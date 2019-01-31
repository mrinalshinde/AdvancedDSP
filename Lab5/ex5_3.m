clc
clearvars
close all
format compact
%
%% Filter specification
% unscaled filter
k1 = 1; k2 = 1; k3 = 1;
% Fixed-point format
B = 13;     % word length
L = B-1;    % fraction length
% value = -b(1)*2^(B-L-1)+b(2)*2^(B-L-2)+b(3)*2^(B-L-3)+...+ b(B)*2^(-L)
sos_unscaled = [0.0662272/k2, 0.0662272/k2, 0.0000000, 1.0000000, -0.2593284, 0.0000000; ...
       1.0000000/k3, 2.0000000/k3, 1.0000000/k3, 1.0000000, -0.6762858, 0.3917468]; 
g = 1/k1; 
Hd = dfilt.df2sos(sos_unscaled,g);
set(Hd, 'Arithmetic', 'fixed', ...
    'CoeffWordLength', B, ...
    'InputWordLength', B, 'InputFracLength', L, ...
    'SectionInputWordLength', B, ...
    'SectionOutputWordLength', B, ...
    'StateWordLength', B, ...
    'StateFracLength', L, ...
    'OutputWordLength', B, ...
    'ProductMode', 'KeepMSB', ...
    'AccumMode', 'KeepMSB', ... 
    'AccumWordLength', B+1, ...
    'RoundMode', 'round', ...
    'OverflowMode', 'saturate');
npsdNoScale = noisepsd(Hd);
Roundoff_NoisePowerNoScale = pow2db(avgpower(npsdNoScale));

HdL2 = copy(Hd);
scale(HdL2,'L2','scalevalueconstraint','none','SOSReorder','none');
npsdL2 = noisepsd(HdL2);
Roundoff_NoisePowerL2 = pow2db(avgpower(npsdL2));

%% Scaling using Linf-norm, product round-off noise and overflows
HdLinf = copy(Hd);
scale(HdLinf,'Linf','scalevalueconstraint','none','SOSReorder','none');
npsdLinf = noisepsd(HdLinf);
Roundoff_NoisePowerLinf = pow2db(avgpower(npsdLinf));

%% Scaling using l1-norm, product round-off noise and overflows
Hdl1 = copy(Hd);
scale(Hdl1,'l1','scalevalueconstraint','none','SOSReorder','none');
npsdl1 = noisepsd(Hdl1);
Roundoff_NoisePowerl1 = pow2db(avgpower(npsdl1));

disp('Product round-off noise power in dB without scaling:');
disp(Roundoff_NoisePowerNoScale);
disp('Product round-off noise power in dB using L2-norm:');
disp(Roundoff_NoisePowerL2);
disp('Product round-off noise power in dB using Linf-norm:');
disp(Roundoff_NoisePowerLinf);
disp('Product round-off noise power in dB using l1-norm:');
disp(Roundoff_NoisePowerl1);