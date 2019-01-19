clc;
clearvars;
close all;

Tonleiter

% soundsc(noteSequence,fs)
player1 = audioplayer(noteSequence,fs);
play(player1)

% EOF
N = 4000;
x = Do + Re + Mi + Fa + So + La + Ti;
fftout = fft(x, N);
onesided_fft = 2*fftout(1:N/2+1);
mag = abs(onesided_fft);
f_axis = fs/N*[0:N/2];
figure(3)
subplot(2,1,1)
stem(f_axis, mag);
title('Magnitude Spectrum using DFT');

wl = 128; 
overlap = 124;
subplot(2,1,2)
spectrogram(noteSequence, gausswin(wl), overlap, N, fs,'yaxis');
title('Spectrogram');

