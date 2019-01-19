clc; close all; clear all;

Fp = 510; % Passband Frequency in Hz
Fs = 500; % Stopband Frequency in Hz
Ft = 2000; % Sampling Frequency in Hz
Rp = 1.0; % Passband Ripple in dB
Rs = 60; % Stopband Attenuation in dB

hp = fdesign.highpass(Fs, Fp, Rs, Rp, Ft);
hpd(1) = design(hp, 'ellip');
hpd(1) = convert(hpd,'df2'); % Direct form II (df2)

hpd(1).Arithmetic = 'fixed';
hpd(1).Roundmode = 'floor';
hpd(1).OverflowMode = 'wrap';
hpd(1).CoeffWordLength = 14;
for i = 2:8
    hpd(i) = copy(hpd(1));
    hpd(i).CoeffWordLength = 14 + 2*(i-1);
end
%% Check results
hfv = fvtool(hpd(1).Numerator, hpd(1).Denominator, hpd(2).Numerator, hpd(2).Denominator,...
    hpd(3).Numerator, hpd(3).Denominator, hpd(4).Numerator, hpd(4).Denominator,...
    hpd(5).Numerator, hpd(5).Denominator, hpd(6).Numerator, hpd(6).Denominator,...
    hpd(7).Numerator, hpd(7).Denominator, hpd(8).Numerator, hpd(8).Denominator);
legend(hfv,'Coefficient word length 14','Coefficient word length 16',...
    'Coefficient word length 18', 'Coefficient word length 20',...
    'Coefficient word length 22', 'Coefficient word length 24', ...
    'Coefficient word length 26', 'Coefficient word length 28' );

for i = 1:8
flag = isstable(hpd(i).Numerator, hpd(i).Denominator);
if flag
    fprintf('Filter with %d bits is stable \n',12+2*i);
else
    fprintf('Filter with %d bits is unstable \n',12+2*i);
end
end
