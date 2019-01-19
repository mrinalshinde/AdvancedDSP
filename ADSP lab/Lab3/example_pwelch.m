N = input('Type in the data length N = ');
L = input('Type in the window length L = ');
S = input('Type in the offset distance S between segments S = ');
P = (N-L)/S+1;
n = 0 : N-1;
noverlap = L - S;
%
%% Signal and window
rng(1379);
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1, length(n));
window = hamming(L);
%
%% Welch estimate
[Pxx,w] = pwelch(x,window,noverlap);
%
%% Plot
figure1 = figure('Color',[1 1 1]);
axes1 = axes('Parent',figure1); box(axes1,'on'); 
line(w/pi,10*log10(Pxx),'Parent',axes1,'LineWidth',2,'Color',[0 0 1]); 
ylim(axes1,[-20 20]); xlim(axes1,[0 1]); grid;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Welch Power Spectral Density Estimate');
text('String', ['N = ', num2str(N), ', L = ', num2str(L),...
    ', S = ', num2str(S)], 'Position', [0.25 12],...
    'FontSize', 14, 'Color', [1 0 0]);
% EOF