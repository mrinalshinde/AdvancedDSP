% filter poles and zeros
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
%d = fdesign.highpass('Fst,Fp,Ast,Ap',0.50,0.51,60,1);
%d = fdesign.highpass('N,F3dB,Ast,Ap',5,0.5,1.0,60);
% Filter design using floating point format (double)
%d = fdesign.lowpass('N,F3db,Ap,Ast',5,0.4,0.4,50);
%hd = design(d,'ellip'); 
[n,Wp] = ellipord(0.51,0.5,Apass,Astop);
hd=ellip(n,Apass,Astop,Wp);
Hd = dfilt.df2(hd);
set(Hd,'Arithmetic', 'fixed', ...  
    'CoeffWordLength',4, ...    
    'RoundMode',...
    'convergent', ... 
    'OverflowMode', 'Wrap');
zplane(Hd);
hold on


% Filter design using fixed point format

fvtool(Hd);