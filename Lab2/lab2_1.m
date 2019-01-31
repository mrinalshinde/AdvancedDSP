clc;
clearvars;
close all;

fs1 = 64;
fs2 = 24;
R = 32;
n2 = 128;
f = 10;

n = 0:R-1;

N=R;
x1 = cos(2*pi*f*n/fs1);
rwind = rectwin(R);
y1 = fft(rwind.*x1',N);

x2 = cos(2*pi*f*n/fs2);
y2 = fft(rwind.*x2',N);

N=128;

windowext = [zeros(1,R),rwind',zeros(1,R)];
y3 = fft(windowext.*x2',N);

x_axis = 0:1:R-1;
x2_axis = 0:N-1;
mag1 = abs(y1);
mag2 = abs(y2);
mag3 = abs(y3);
figure(1)
subplot(2,2,1)
stem(x_axis,mag1);
title('Fs=64Hz, R=32, N=32');
subplot(2,2,2)
stem(x_axis,mag2);
title('Fs=24Hz, R=32, N=32');
subplot(2,1,2)
stem(x2_axis,mag3)
title('Fs=24Hz, R=32, N=128');