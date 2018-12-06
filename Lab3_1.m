clear vars
clear all
close all
clc
randn('state',0);
noise = randn(1,100);
[acs_biased,~] = xcorr(noise,'biased');
[acs_unbiased,n] = xcorr(noise,'unbiased');
figure()

subplot(2,2,1);
stem(n, acs_biased)
title('')
ylabel ('amplitude')
xlabel ('lag index')
title('Biased ACS')

subplot(2,2,2);
stem(n, acs_unbiased)
ylabel ('amplitude')
xlabel ('lag index');
title('Unbiased ACS')

subplot(2,2,3:4);
phi_biased = fft(acs_biased,512);
phi_unbiased = fft(acs_unbiased,512);
faxis = 0 : 2*pi/512 : 2*pi*(1-1/512);
hold on
line(faxis/pi,abs(phi_biased)); 
line(faxis/pi,abs(phi_unbiased),'color',[1 0 0]);
grid on
ylabel ('|\Phi_{XX}(e^{j\omega})|')
xlabel ('\omega/pi');
title('Power Spectral Density')
legend('Biased','Unbiased');
set(gca, 'YScale', 'log')
hold off

