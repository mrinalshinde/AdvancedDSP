clc;
clearvars;
close all

fs = 1000; 
f01 = 0;
f02 = 500;
f11 = 50;
f12 = 450;

t = 0:1/1000:1;
t1 =1;
y1 = chirp(t,f01,t1,f02,'linear');
y2 = chirp(t,f11,t1,f12,'linear');
y = [y1 y2]; 

y_dft = y1 + y2;

player1 = audioplayer(y,fs);
play(player1)
figure()
subplot(3,1,1)
plot(t,y1);
subplot(3,1,2)
plot(t,y2);
subplot(3,1,3)
plot(t,y_dft);

N = 2^14;

y_dft = y1 + y2;
fftout = fft(y_dft, N);
onesided_fft = fftout(1:N/2+1);
mag = abs(onesided_fft);
f_axis = fs/N*[0:N/2];
figure()
plot(f_axis, mag);
title('DFT for the superposition of two chirp signals');

window_length = 100; 
L = 10;
overlap = window_length - L;
figure()
spectrogram(y_dft, window_length, overlap, N, fs,'yaxis');
title('Spectrogram');