clc;
clearvars;
close all;

N = 8;
wn = exp(-2j*pi/N);
x = 1:8;
y = zeros(N);

for k = 0:N-1
    num = [1 -wn.^k];
    den = [1 -2*cos(2*pi*k/N) 1];
    output = filter(num, den, x);
    y(k+1) = output(N);
end
fftout = fft(x,N);

disp('Output using filter ');
y(:,1)
disp('Output using fft ');
fftout'