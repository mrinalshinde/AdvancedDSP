clc
close all
clear all

N = 12;
x = fir1(11,125/500,rectwin(12));
M = 5;

w0 = 2*pi/19; %starting frequency
dw = 2*pi/10; %frequency increment

W = exp(-1j*dw); %Window

n1 = 0:N-1;
r = exp(-1j*w0*(n1)).*(exp(-1j*dw*(n1.^2)/2)); 
g = x.*r; %Multiplication

n2 = -N+1:M-1;
h = W.^(-(n2.^2/2)); %Impulse Response
X = conv(g,h);

n3 = 0:M-1;
p = W.^((n3.^2)/2);
y = X(N:N+M-1).*p; %Demodulation

disp('Output:')
disp(num2str(y))
yczt = czt(x,M,W,exp(1j*w0));
disp('Output of computation with function czt:')
disp(num2str(yczt))

if (norm(y-yczt)) < 10^(-12)
 fprintf('same');
else 
 fprintf('not the same');   
end   
