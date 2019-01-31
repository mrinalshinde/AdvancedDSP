%clc; clear all; close all;

N = 1e6; n = -(N-1):1:(N-1);
x = randn(1,N);

y1 = xcorr(x, 'unbiased');
y2 = xcorr(x, 'biased');
figure(3)
subplot(2,2,1); stem(n,y1); title('Unbiased ACS');  xlabel('Lag Index'); ylabel('Amplitude');
subplot(2,2,2); stem(n,y2); title('Biased ACS');  xlabel('Lag index'); ylabel('Amplitude');

N1 = 512; n1 = 0:N1-1;
freq = 0:(2*pi)/N1:pi;

f1 = fft(y1, N1); f1 = f1(1:N1/2+1);
f2 = fft(y2, N1); f2 = f2(1:N1/2+1);

p1 = 10*log10((1/(2*pi*N))*(abs(f1).^2));
p2 = 10*log10((1/(2*pi*N))*(abs(f2).^2));

subplot(2,1,2); plot(freq,p1,'b',freq,p2,'r'); 
title('Power Spectral Density'); xlabel('Normalised freqeuncy'); ylabel('Power');
legend('Unbiased ACS','Biased ACS');