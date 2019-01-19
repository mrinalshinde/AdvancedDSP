clc
clear all
close all

N = 16;
x = 1:8;
wn = exp(-2j*pi/N);

num = [1 -(wn^(k-1))];
den = [1 -2*cos(2*pi*(k-1)/N) 1];
%g = tf(num, den, 0.1, 'variable','z^-1');
gtzlop = 8*mean(filter(num, den, x));

fftop = fft(x,N);

if norm(abs(gtzlop - fftop)) < 10^(-12)
    disp('X = '); 
    disp(X); % result is okay
else
    disp('Result is not okay!')
end