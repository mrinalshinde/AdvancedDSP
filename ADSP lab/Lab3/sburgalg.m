function [a,k,eps] = burgalg(x,P)

if nargin == 0
    N = 64; P = 20;
end

n = 0:N-1;
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1,N);

a = 1; 
ef(:,1) = x; eb(:,1) = x;

eps(1) = 1/N*norm(x);     % Initial value for the variance
k = zeros(P,1);

for j = 1:P
    % Reflection coefficients
    k(j) = 2*ef(j-1,2:N+1-j)*eb(j-1,1:N-1)'/...
        (abs(ef(j-1,2:N+1-j)).^2 + abs(eb(j-1,1:N-j)).^2);
    
    % Error sequences
    eb(j,:) = eb(j-1, 1:N-j) - conj(k(j))*ef(j-1, 2:N+1-j);
    ef(j,:) = ef(j-1, 2:N+1-j) - k(j)*eb(j-1,1:N-j);
    % Error variance
    eps(j) = eps(j-1)*(1-k(j)^2);    
    % Step of Levinson-Durbin recursion to find the AR parameter 
    % knowing the reflection coefficients
    a = [a 0] - [0 fliplr(conj(a(2:end))) -1] * k(j);
end
k = -k;
% Final AR parameter for PSD estimation
    a = [1 -a(2:end)]; 
end