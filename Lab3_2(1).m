% Example for PSD Estimation Using Welch Method
%
clc
clearvars
close all

N = input('Data Length N = ');
L = input(' Window Length L = ');
S = input('Offset distance S = ');
P_seg = (N-L)/S+1;
n = 0 : N-1;
noverlap = L - S;
% Signal, window and Welch estimate
randn('state',0);
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1, length(n));
window = hamming(L);
[PSD,W] = pwelch(x,window,noverlap);


line(W/pi,10*log10(PSD),'LineWidth',2); 
ylim([-20 20]);
xlim([0 1]); 
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample) ');
ylabel('Power/frequency (dB/rad/sample)');
title('Welch PSD estimate');
str = ['N = ', num2str(N), 'L = ', num2str(L),'S = ',num2str(S)];
text([0.25 14],[0.3 20],[0.4 30],str);