clc;
clear all;
close all;

N = 12;
M = 5;
wn = exp(-2j*pi/N);
w0 = 2*pi/19; %
delta_w = 2*pi/10;

input = fir1(11, 125/500, rectwin(N));

%Modulation
n = 1:N;
nsquared = ((n - 11).^2)/2;
r = exp(-j*w0*n).*wn.^nsquared;
modulated_output = input .* r;

%Convolution
h = exp(j*delta_w*nsquared)
conv_output = conv(modulated_output, h); 

%Demodulation
h1 = exp(-j*delta_w*nsquared)
demod_output = conv_output .* h1 