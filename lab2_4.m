clc;
clearvars;
close all

fs = 1000; %Sampling Frequency
%Chirp Signal
t = 0:1/1000:1;
y1 = chirp(t,0,1,500);
y2 = chirp(t,50,1,450);
y = [y1 y2]; 
y_dft = y1 + y2;

player1 = audioplayer(y,fs);
play(player1)
figure(4)
subplot(3,1,1)
plot(t,y1);
subplot(3,1,2)
plot(t,y2);
subplot(3,1,3)
plot(t,y_dft);

N = 1024;

y_dft = y1 + y2;
fftout = fft(y_dft, N);
onesided_fft = 2*fftout(1:N/2+1);
mag = abs(onesided_fft);
f_axis = fs/N*[0:N/2];
figure(5)
plot(f_axis, mag);
title('DFT for the superposition of two chirp signals');

window_length = 32; 
L = 6;
overlap = window_length - L;
figure(6)
spectrogram(y_dft, window_length, overlap, N, fs,'yaxis');
title('Spectrogram');