clc
close all
clear all

N = 12;
x = fir1(11,125/500,rectwin(12));
M = 5;
wo = 2*pi/19;
dw = 2*pi/10;
W = exp(-1j*dw);
n1 = 0:N-1;
r = exp(-1j*wo*(n1)).*(exp(-1j*dw*(n1.^2)/2));
g = x.*r;
n2 = -N+1:M-1;
h = W.^(-(n2.^2/2));
n3 = 0:M-1;
p = W.^((n3.^2)/2);
y1 = conv(g,h);
y = y1(N:N+M-1).*p;
disp('Output of block diagram implementation')
disp(num2str(y))
yczt = czt(x,M,W,exp(1j*wo));
disp('Output of computation with function czt')
disp(num2str(yczt))

if (norm(y-yczt)) < 10^(-12)
 fprintf('same results!');
else 
 fprintf('not the same result!');   
end   
