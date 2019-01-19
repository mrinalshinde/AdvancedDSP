clc;
clear all;
close all;

Asl = input('Sidelobe attenuation1 = ');
if Asl < 13.26
     b = 0;
elseif Asl >= 13.26 || asl < 60
    b = 0.76609 *(Asl - 13.26)^0.4 + 0.09834 *(Asl - 13.26);
else
    b = 0.12438 *(Asl + 6.3);
end

f1 = 1/14;
f2 = 2/15;
dml = 2*pi*abs(f1-f2);
window_length = (24*pi*(Asl+12))/(155*dml) + 1;

R = 2^ceil(log2(window_length));

n = 0:R-1;
x = cos(2*pi*n/14) + 0.02*sin(4*pi*n/15);
kwind = kaiser(R,b);
rwind = rectwin(R);

fftout = fft(kwind.*x', R);
mag_k = abs(fftout);
fftout = fft(rwind.*x', R);
mag_r = abs(fftout);

x_axis = 0:1:R-1;
figure(2)
subplot(1,2,1)
stem(x_axis, mag_r)
title('DFT analysis using a Rectangular window');
subplot(1,2,2)
stem(x_axis, mag_k)
title('DFT analysis using a Kaiser window');