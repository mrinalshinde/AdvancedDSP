function [a,k,v] = burgalg(x,P)
% Burg algorithm
% x     :   Data (row vector) of length N
% P     :   Order of prediction error filter
% Pxx   :   Burg PSD estimate
% a     :   AR model coefficients (row vector)
% k     :   Reflection (PARCOR) coefficients
% v     :   Error variance estimate (epsilon burg)
%
% Initialization
ef = x;                 % Forward prediction error
eb = x;                 % Backward prediction error
a = 1;                  % AR-model coefficient a0 = 1
N = length(x);          % Data length
v0 = 1/N*sum(x.^2);     % Initial value for the variance
v = v0;                 % Error variance (epsilon burg)
%
% Reflection coefficients and error variance
k = zeros(P,1);
for i = 1:P
    % Reflection coefficients
    k(i) = 2*ef(2:N+1-i)*eb(1:N-i)'/...
        abs(ef(2:N+1-i)).^2 + abs(eb(1:N-i)).^2);
    % Error sequences
    tmp = ef(2:N+1-i) - k(i)*eb(1:N-i);
    eb = eb(1:N-i) - conj(k(i))*ef(2:N+1-i);
    ef = tmp;
    % Error variance
    v = v*(1-k(i)^2);    
    % Step of Levinson-Durbin recursion to find the AR parameter 
    % knowing the reflection coefficients
    a = [a 0] - [0 fliplr(conj(a(2:end))) -1] * k(i);
end
k = -k;
% Final AR parameter for PSD estimation
a = [1 -a(2:end)]; % Note: a = -p except a0 = 1 (see initialization)
% EOF