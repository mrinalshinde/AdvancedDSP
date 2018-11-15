clc
clear
close all

x = 1:8;
N = length(x);
xe = [x 0];
zi = [0 0];
k1 = 1:8;
for k = 0:N-1
num = [1 -exp(-1i*2*pi*k/N) 0];
den = [1 -2*cos(2*pi*k/N) 1];
X(:,k+1) = filter(num,den,xe,zi);
end
X = X(9,:);
Y = goertzel(x,k1);

disp('DFT computation using filter and goertzel function:')
for n = 1:N
    fprintf('\n X[%d] = using filter = %d',n-1,X(n))
    fprintf('\n X[%d] = using goertzel = %d',n-1,Y(n))
end

delta = norm(X-Y);
if (delta < 10^(-12))
 fprintf('\n *** Euqal results ! ***');
else 
 fprintf('\n output of goertzel function and filter is not same');   
end   


