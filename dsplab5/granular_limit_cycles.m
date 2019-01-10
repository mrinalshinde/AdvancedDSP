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
alpha = input('Filter coefficient alpha = ');
rmode = input('Type in r for rounding or t for truncation = ','s');
y = zeros(1,21);
yi = yic;
for n = 1:21
    if rmode == 'r'
        y(n) = twosquant(alpha*yi,w-1,'r','o'); % rounding
    elseif rmode == 't'
        y(n) = twosquant(alpha*yi,w-1,'t','o'); % truncation
    else
        error('Choose r for rounding or t for truncation');
    end
    yi = y(n);
end
k = 0:20;
stem(k,y,'LineWidth',2); grid;
ylabel('Amplitude'); xlabel('Time index n');
if rmode == 'r'
    str = 'rounding'; % rounding
elseif rmode == 't'
    str = 'truncation'; % truncation
else
    error('Choose r for rounding or t for truncation');
end
h = title(['\alpha = ' num2str(alpha),...
    ', y[-1] = ' num2str(yic), ', ' str]);
h.FontSize = 14;
% saveas(h,'granular_limit_cycles.bmp');
% EOF