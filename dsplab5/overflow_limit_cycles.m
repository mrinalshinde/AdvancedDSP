% Example Overflow Limit Cycles in a Second-Order IIR Filter
%
% Required Function: twosquant.m
%
clc
clearvars
close all
%
c = menu('Avoid overflow by coefficient condition', 'no', 'yes');
if c == 1 % first choice: coefficients
    alpha1 = -0.9;
    alpha2 = 0.5;
else
    alpha1 = -0.4;
    alpha2 = 0.5;
end
yi1 = 0.8; 
yi2 = -0.8;
y = zeros(1,41);
%
% Second choice: round and overflow mode
c = menu('Choose', 'rounding and wrap overflow', ... 
    'truncation and wrap overflow', ...
    'rounding and saturation', ...
    'truncation and saturation');
% w = input('fractional wordlength = ');
w = 7; % w-1 = 6 fraction length
% Compute the quantized output for zero-input 
for n = 1:41
    y(n) = -alpha1*yi1 -alpha2*yi2;
    if c == 1       % Case 1
        y(n) = twosquant(y(n),w-1,'r','o'); % rounding and wrap overflow
    elseif c == 2   % Case 2
        y(n) = twosquant(y(n),w-1,'t','o'); % truncation and wrap overflow
    elseif c == 3   % Case 3
        y(n) = twosquant(y(n),w-1,'r','s'); % rounding and saturation
    elseif c == 4   % Case 4
        y(n) = twosquant(y(n),w-1,'t','s'); % truncation and saturation
    end
    yi2 = yi1; 
    yi1 = y(n);
end
% Plot
k = 0:40;
stem(k,y,'LineWidth',2); 
ylim([-1 1]); grid;
xlabel('Time index n'); ylabel('Amplitude');
if c == 1           % Case 1
    str = ('rounding and wrap overflow');
elseif c == 2       % Case 2
    str = ('truncation and wrap overflow');
elseif c == 3       % Case 3
    str = ('rounding and saturation');
elseif c == 4       % Case 4
    str = ('truncation and saturation');
end
h = title(str);
h.FontSize = 12;
% saveas(h,'overflow_limit_cycles.bmp');
% EOF