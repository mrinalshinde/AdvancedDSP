clc
clear
close all

x = 1:8;
N = length(x);
xe = [x 0];

for k = 0:N-1
num = [1 -exp(-1i*2*pi*k/N) 0];
den = [1 -2*cos(2*pi*k/N) 1];
result(:,k+1) = filter(den,num,xe);
end





