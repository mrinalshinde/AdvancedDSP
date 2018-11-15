close all
clear all
clc

Asl = input('Choose sidelobe attenuation (< 120 dB):');
if Asl < 13.36
    beta = 0;
elseif (13.26 <= Asl) && (Asl <= 60) 
    beta = 0.76609 * ((Asl-13.26)^0.4) + ...
        0.09834 * (Asl-13.26);
else 
    beta = 0.12438 * (Asl + 6.3);
end

f1 = 1/14;
f2 = 2/15;
deltaw = 2 * pi *(f2 - f1);
L = (24*pi*(Asl+12))/(155*deltaw) + 1;
R = 2^ceil(log2(L));
N = R;
n = 0:R-1;
%deltaml = pi/beta;
x = cos(2*pi*n/14) + 0.1*sin(4*pi*n/15);
wk = kaiser(R,beta);
XK = transpose(fft(wk.*x', R));
XR = transpose(fft(rectwin(R).*x', R));

fprintf('\n The chosen parameters are as follows:')
fprintf('\n deltaw = %d',deltaw)
fprintf('\n beta = %d',beta)
fprintf('\n N = R = %d',N)
figure()
ax1 = subplot(1,2,1);
plot(n, abs(XR),'-o')
title('x windowed by rectangular window');
set(ax1,'xlim',[0 N])
ax2 = subplot(1,2,2);
plot(n, abs(XK),'-ro')
title('x windowed by kaiser window');
set(ax2,'xlim',[0 N])