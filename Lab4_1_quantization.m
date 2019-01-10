% Example for quantization characteristics 
% Required File: twosquant.m
%
clc
clearvars
close all
%
%% Signal and Wordlength
n = -1.5:0.00001:1.5;   % signal to be quantized
x = n;
w = 5;                  % wordlength
figure;
%
%% ### Case 1: Rounding and Saturation
xq = twosquant(x, w, 'r', 's');
e = x - xq;
subplot(221)
grid; hold on;
stairs(n,x,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -1.5 1.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Rounding and Saturation','FontSize', 12);
legend('Input x','Q(x)','Error e','Location','NorthWest');
%
%% ### Case 2: Rounding and Overflow
xq = twosquant(x, w, 'r', 'o');
e = x - xq;
subplot(222)
grid; hold on;
stairs(n,x,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -2.5 2.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Rounding and Overflow','FontSize', 12);
legend('Input x','Q(x)','Error e','Location','NorthWest');
%
%% ### Case 3: Truncation and Saturation
xq = twosquant(x, w, 't', 's');
e = x - xq;
subplot(223)
grid; hold on;
stairs(n,x,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -1.5 1.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Truncation and Saturation', 'FontSize', 12);
legend('Input x','Q(x)','Error e','Location','NorthWest');
%
%% ### Case 4: Truncation and Overflow
xq = twosquant(x, w, 't', 'o');
e = x - xq;
subplot(224)
grid; hold on;
stairs(n,x,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -2.5 2.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Truncation and Overflow','FontSize', 12);
legend('Input x','Q(x)','Error e','Location','NorthWest');
% EOF