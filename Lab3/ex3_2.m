clc; clear all; close all;

N = input('Welch: Type in the data length N = '); %input length
L = input('Welch: Type in the window length L = '); % segment length
S = input('Welch: Type in the offset distance S between segments S = '); %offset between segments
%N = 1024, L = 256, S = 256;

n = 0:N-1;
noverlap = L - S;

rng(1379);
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1, length(n));
window = hamming(L);
[wPxx,w] = pwelch(x,window,noverlap);

clc;
Lp = input('Periodogram: Type in the length L of the window = ');
Rp = input('Periodogram: Type in the length R of the fft = ');
% Signal
np = 0:Lp-1;
rng(1379);
xp = 2*sin(0.06*pi*np) + sin(0.14*pi*np) + randn(1,Lp);
% Window and Periodogram
pwindow = rectwin(Lp);
[pPxx,pw] = periodogram(xp,pwindow,Rp);

figure(1); subplot(1,2,1);
plot(pw/pi,10*log10(pPxx));
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Periodogram Power Spectral Density Estimate');
text('String', ['L = ', num2str(Lp), ', R = ', num2str(Rp)],...
    'Position', [0.35 12], 'FontSize', 14, 'Color', [1 0 0]);

subplot(1,2,2);
plot(w/pi,10*log10(wPxx));
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Welch Power Spectral Density Estimate');
text('String', ['N = ', num2str(N), ', L = ', num2str(L),...
    ', S = ', num2str(S)], 'Position', [0.25 12],...
    'FontSize', 14, 'Color', [1 0 0]);