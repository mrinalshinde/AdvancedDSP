% Example Quantization or Granular Limit Cycles in a First-Order IIR Filter
%
% Required File: twosquant.m
%
clc
clearvars
close all
%
w = 7; % fraction length w-1 = 6
yic = 0.2;
% yic = input('Initial condition y[-1] = ');
alpha = 0.49;
y1 = zeros(1,21);y2 = zeros(1,21);

yi1 = yic;
yi2 = yic;
for n = 1:21
    y1(n)= twosquant(alpha*yi1,w-1,'r','o'); % rounding
    y2(n) = twosquant(alpha*yi2,w-1,'t','o'); % truncation
    yi1 = y1(n);
    yi2 = y2(n);
end
k = 0:20;
figure(1); subplot(2,1,1);
stem(k,y1,'LineWidth',2); 
ylabel('Amplitude'); xlabel('Time index n');
str = 'rounding'; % rounding
h = title(['\alpha = ' num2str(alpha),...
    ', y[-1] = ' num2str(yic), ', ' str]);
h.FontSize = 11;


subplot(2,1,2); stem(k,y2,'LineWidth',2); grid;
ylabel('Amplitude'); xlabel('Time index n');
str = 'truncation'; % rounding
h = title(['\alpha = ' num2str(alpha),...
    ', y[-1] = ' num2str(yic), ', ' str]);
h.FontSize = 11;
% saveas(h,'granular_limit_cycles.bmp');
% EOF