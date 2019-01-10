clear all
close all
clc
%word length 
L = 12;
%Fixed-point format 
B = 13;
% fraction length % 
%value = -b(1)*2^(B-L-1)+b(2)*2^(B-L-2)+b(3)*2^(B-L-3)+...
   %+ b(B)*2^(-L);
sos1=[0.0662272, 0.0662272,0.0000000,1.0000000, -0.2593284, 0.0000000;...
1.0000000, 2.0000000, 1.0000000, 1.0000000, -0.6762858, 0.3917468]; 
g1 = 1; 
[num1,den1] = sos2tf(sos1,g1);
Hd1 = dfilt.df2sos(sos1,g1); 
set(Hd1, 'Arithmetic', 'fixed', ... 
'CoeffWordLength', B, ... 
'InputWordLength', B, 'InputFracLength', L, ... 
'SectionInputWordLength', B, ... 
'SectionOutputWordLength', B, ... 
'StateWordLength', B, ... 
'StateFracLength', L, ... 
'OutputWordLength', B, ... 
'ProductMode', 'KeepMSB', ... 
'AccumMode', 'KeepMSB', ... 
'RoundMode', 'round', ... 
'OverflowMode', 'saturate');

%info(Hd1);
%fvtool(Hd1);
%realizemdl(Hd1); 

sos2 = [1.0000000, 2.0000000, 1.0000000, 1.0000000, -0.6762858, 0.3917468; ... 
    0.0662272, 0.0662272, 0.0000000, 1.0000000, -0.2593284, 0.0000000;]; 
g2 = 1; 
[num2,den2] = sos2tf(sos2,g2);
Hd2 = dfilt.df2sos(sos2,g2);

 set(Hd2, 'Arithmetic', 'fixed', ... 
     'CoeffWordLength', B, ...
     'InputWordLength', B, 'InputFracLength', L, ... 
     'SectionInputWordLength', B, ... 
     'SectionOutputWordLength', B, ... 
     'StateWordLength', B, ... 
     'StateFracLength', L, ... 
     'OutputWordLength', B, ... 
     'ProductMode', 'KeepMSB', ... 
     'AccumMode', 'KeepMSB', ... 
     'RoundMode', 'round', ... 
     'OverflowMode', 'saturate'); 
 % Product round-off noise power for the first cascade structure %
 % ### First cascade structure using quantization before accumulation #
  Hd11 = copy(Hd1); 
  set(Hd11, 'AccumWordLength', B+1);
  rng('default'); 
  % Default random generator settings 
  npsd11 = noisepsd(Hd11);
  Roundoff_NoisePower11 = pow2db(avgpower(npsd11)); 
  % Roundoff_NoisePower11 = sum(npsd11.data)/length(npsd11.data)*pi; 
  disp('### Product round-off noise power for the two cascade structures ###'); 
  disp('First cascade structure using quantization before accumulation: '); 
  disp(['Roundoff_NoisePower11 in dB = ',num2str(Roundoff_NoisePower11)]);
  
 % First cascade structure using quantization after accumulation %
  Hd12 = copy(Hd1);
  set(Hd12, 'AccumMode', 'FullPrecision'); 
  rng('default');
  % Default random generator settings
  npsd12 = noisepsd(Hd12);
  Roundoff_NoisePower12 = pow2db(avgpower(npsd12)); 
  % Roundoff_NoisePower12 = sum(npsd12.data)/length(npsd12.data)*pi;
  disp('First cascade structure using quantization after accumulation: '); 
  disp(['Roundoff_NoisePower12 in dB = ',num2str(Roundoff_NoisePower12)]);
  
  
  % Product round-off noise power for the second cascade structure % 
  % ### Second cascade structure using quantization before accumulation #
  Hd21 = copy(Hd2); 
  set(Hd21, 'AccumWordLength', B+1);
  rng('default'); 
  % Default random generator settings 
  npsd21 = noisepsd(Hd21); 
  Roundoff_NoisePower21 = pow2db(avgpower(npsd21)); 
  disp('Second cascade structure using quantization before accumulation: '); 
  disp(['Roundoff_NoisePower21 in dB = ',num2str(Roundoff_NoisePower21)]);
  
  %  ### Second cascade structure using quantization after accumulation ###
  Hd22 = copy(Hd2); 
  set(Hd22, 'AccumMode', 'FullPrecision');
  rng('default');
  % Default random generator settings 
  npsd22 = noisepsd(Hd22); 
  Roundoff_NoisePower22 = pow2db(avgpower(npsd22));
  disp('Second cascade structure using quantization after accumulation: ');
  disp(['Roundoff_NoisePower22 in dB = ',num2str(Roundoff_NoisePower22)]); 
  % % EOF