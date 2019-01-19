clc; clearvars; close all

N = input('Type in the length N of the signal = '); % 1024
L = input('Type in L for the correlation window (of length 2*L-1) = '); % 256
R = input('Type in the length R of the FFT = '); % 4096

n = 0:N-1;
rng(1379);
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1,N);

rxx = xcorr(x,'biased')';
window = bartlett(2*L-1);
windext = [zeros(1,N-L),window',zeros(1,N-L)];  
wrxx = rxx.*windext'; 

Pxx = abs(fft(wrxx,R));
w = 0:2*pi/R:2*pi*(1-1/R);

figure(1)
subplot(1,2,1);
plot(w/pi,10*log10(Pxx),'LineWidth',1.5,'Color',[0 0 1]); grid;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Blackman-Tukey Power Spectral Density Estimate');
text('String', ['N = ', num2str(N), ', L = ', num2str(L), ...
     ', R = ', num2str(R)], 'Position', [0.35 12], ...
     'FontSize', 14, 'Color', [1 0 0]);

subplot(1,2,2);
l = -(N-1):(N-1);
stem(l,rxx,'g'); hold on
stem(l,windext','k');
stem(l,wrxx','r');
grid, axis tight
legend('Biased ACS', 'Correlation Window', 'Windowed ACS');
xlabel('Lag index'); ylabel('Amplitude');
title('Biased ACS, correlation window and windowed ACS');
