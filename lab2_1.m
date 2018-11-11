clc
clear all
close all

Fs1 = 64;
Fs2 = 24;
R = 32;
N1 = 32;
N2 = 128;
Fp = 10;
k1 = 0:N1-1;
k2 = 0:N2-1;
n = 0:R-1;
x1 = cos(2*pi*Fp*n/Fs1);
x2 = cos(2*pi*Fp*n/Fs2);
X1 = fft(x1,N1);
X2 = fft(x2,N1);
X3 = fft(x2,N2);
w1 = 2*pi*Fp/Fs1;
w2 = 2*pi*Fp/Fs2;
figure()

ax1 = subplot(2,2,1);
stem(k1,abs(X1))
title('')
ylabel ('|X1[k]|')
xlabel ('k');
ax2 = subplot(2,2,2);
stem(k1,abs(X2))
ylabel ('|X2[k]|')
xlabel ('k');
ax3 = subplot(2,2,3:4);
stem(k2,abs(X3))
suptitle('DFT of sinusoidal sequence with F_p = 10Hz')
set(ax3,'xlim',[0 120])
axis([ax1 ax2],[0 30 0 30])
linkaxes([ax3,ax2,ax1],'y'); 
ylabel ('|X3[k]|')
xlabel ('k');
