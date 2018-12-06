% Example for PSD Estimation Using Yule-Walker Method
%
clc
clearvars
close all
%
%% Parameters and Signal
N = input('Type in the data length N = '); % 128
P = input('Type in the order P = '); % 32
n = 0:N-1;
rng(1379);
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1, length(n));
%
%% AR model parameters for Yule-Walker method
a = aryule(x,P);
% fvtool(1,a);
%
%% Yule-Walker PSD estimate
[Pxx,w] = pyulear(x,P);
%
%% Plot
figure1 = figure('Color',[1 1 1]);
axes1 = axes('Parent',figure1); box(axes1,'on'); 
line(w/pi,10*log10(Pxx),'Parent',axes1,'LineWidth',2,'Color',[0 0 1]); 
ylim(axes1,[-20 20]); xlim(axes1,[0 1]); grid;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Yule-Walker Power Spectral Density Estimate');
text('String', ['N = ', num2str(N), ', P = ', num2str(P)],...
    'Position', [0.25 12], 'FontSize', 14, 'Color', [1 0 0]);
% EOF