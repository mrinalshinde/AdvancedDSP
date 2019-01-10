
clc
clearvars
close all

Fs = 2000;
Fpass = 510;
Fstop = 500;
Apass = 1.0;
Astop = 60;
wp= (2*pi*Fpass)/Fs;
ws= (2*pi*Fstop)/Fs;
d = fdesign.highpass('Fst,Fp,Ast,Ap',0.50,0.51,60,1);
%d = fdesign.highpass('N,F3dB,Ast,Ap',5,0.5,1.0,60);
% Filter design using floating point format (double)
%d = fdesign.lowpass('N,F3db,Ap,Ast',5,0.4,0.4,50);
hd = design(d,'ellip'); 
%
% Filter design using fixed point format
hf = copy(hd);
hf = convert(hf,'df2');
hf.Arithmetic = 'fixed';
hf.Roundmode = 'floor';% truncation 
%hf.CoeffWordLength = 14;



hf1 = copy(hd);
hf1 = convert(hf1,'df2');
hf1.Arithmetic = 'fixed';
hf1.Roundmode = 'floor';% truncation 
hf1.CoeffWordLength = 16;

 a= isstable(hf1.Numerator,hf1.Denominator);
 if a==1 
     disp('16 bit stable');
 else 
     disp('16 bit unstable');
 end 

hf2= copy(hd);
hf2 = convert(hf2,'df2');
hf2.Arithmetic = 'fixed';
hf2.Roundmode = 'floor';% truncation 
hf2.CoeffWordLength = 18;

a= isstable(hf2.Numerator,hf2.Denominator);
 if a==1 
     disp('18 bit stable');
 else 
     disp('18 bit unstable');
 end 

hf3= copy(hd);
hf3 = convert(hf3,'df2');
hf3.Arithmetic = 'fixed';
hf3.Roundmode = 'floor';% truncation 
hf3.CoeffWordLength = 20;

a= isstable(hf3.Numerator,hf3.Denominator);
 if a==1 
     disp('20 bit stable');
 else 
     disp('20 bit unstable');
 end 

hf4= copy(hd);
hf4 = convert(hf4,'df2');
hf4.Arithmetic = 'fixed';
hf4.Roundmode = 'floor';% truncation 
hf4.CoeffWordLength = 22;

a= isstable(hf4.Numerator,hf4.Denominator);
 if a==1 
     disp('22 bit stable');
 else 
     disp('22 bit unstable');
 end 

hf5= copy(hd);
hf5 = convert(hf5,'df2');
hf5.Arithmetic = 'fixed';
hf5.Roundmode = 'floor';% truncation 
hf5.CoeffWordLength = 24;

a= isstable(hf5.Numerator,hf5.Denominator);
 if a==1 
     disp('24 bit stable');
 else 
     disp('24 bit unstable');
 end 

hf6= copy(hd);
hf6 = convert(hf6,'df2');
hf6.Arithmetic = 'fixed';
hf6.Roundmode = 'floor';% truncation 
hf6.CoeffWordLength = 26;

a= isstable(hf6.Numerator,hf6.Denominator);
 if a==1 
     disp('26 bit stable');
 else 
     disp('26 bit unstable');
 end 
 
hf7= copy(hd);
hf7 = convert(hf7,'df2');
hf7.Arithmetic = 'fixed';
hf7.Roundmode = 'floor';% truncation 
hf7.CoeffWordLength = 28;

a= isstable(hf7.Numerator,hf7.Denominator);
 if a==1 
     disp('28 bit stable');
 else 
     disp('28 bit unstable');
 end 

%hf.overflowmode='wrap';
% hf.InputWordLength = 5;
% hf.OutputWordlength = 5;
fhv = fvtool(hf,hf1,hf2,hf3,hf4,hf5,hf6,hf7);
legend('Reference','Reference','16 bits','16 bits','18 bits','18 bits','20 bits','20 bits','22 bits','22 bits','24 bits','24 bits','26 bits','26 bits','28 bits','28 bits');
% EOF