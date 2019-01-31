clc
clearvars
close all
%
%Signals in the time-domain
% Input signal
freq = [0 0.42 0.48 1];
mag = [0 1 0 0];
x = fir2(101, freq, mag);
% Down-sampled sequence for M = 2
M1 = 2;
y1 = downsample(x,M1);
% Down-sampled sequence for M = 3
M2 = 3;
y2 = downsample(x,M2);

L = 5;
y3 = upsample(x,L);


% Input spectrum
[Xz, w] = freqz(x,1); % bandlimited input spectrum
% Spectrum for Yz1 (M = 2)
Yz1 = freqz(y1,1);

Yz2 = freqz(y2,1);

%Spectrum for Yz3 (L = 3)
Yz3 = freqz(y3,1);

% plot
figure
subplot(2,2,1)
plot(w/pi, abs(Xz),'LineWidth',2); 
grid on
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Input sample')

subplot(2,2,2)
plot(w/pi, abs(Yz1),'LineWidth',2); 
grid on
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Down sample M=2');

subplot(2,2,3)
plot(w/pi, abs(Yz2),'LineWidth',2); 
grid on
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Down sample M=3');

subplot(2,2,4)
plot(w/pi, abs(Yz3),'LineWidth',2); 
grid on
xlabel('\omega/\pi'); ylabel('Magnitude');
title('up sample L=5');