N = input('Type in the data length N = '); % 128
P = input('Type in the order P = '); % 32

n = 0:N-1;
rng(1379);
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1, length(n));

a = aryule(x,P);
[Pxx,w] = pyulear(x,P);

figure(1);
plot(w/pi,10*log10(Pxx),'Linewidth',2);
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Yule-Walker Power Spectral Density Estimate');
text('String', ['N = ', num2str(N), ', P = ', num2str(P)],...
    'Position', [0.25 12], 'FontSize', 14, 'Color', [1 0 0]);