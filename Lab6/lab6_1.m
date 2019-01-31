clc
clearvars
close all

Amp=2;
fm=2;
w=2*pi*fm;
fs=16;
ts=1/fs;
n=0:ts:2;
x=Amp*sin(w*n);
figure
subplot(2,2,1);
stem(n,x);
hold on
plot(n,x);
title('input sine ');

M = 2;
yd = downsample(x,M);

subplot(2,2,2);
stem(yd);
title('Downsample M=2');

L = 3;
yu = upsample(x,L);
subplot(2,2,3);
stem(yu);
title('upsample L=3');

