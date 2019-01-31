%function sos_scaled = findnorm()
si1 = 0;
si2 = [0 0];
k = zeros(1,3);
k1 = 1; k2 = 1; k3 = 1;
delta = 1;
x1 = 1;
% Loop until precision is achieved
while max(delta) > 0.000001 
    y1 = 0.2593284*si1 + x1/k1;                     % output node y1
    x2 = (0.0662272)*(y1 + si1)/k2;
    si1 = y1;
    y2 = 0.6762858*si2(1) - 0.3917468*si2(2) + x2;  % output node y2
    y3 = (y2 + 2*si2(1) + si2(2))/k3; % output node y3
    si2(2) = si2(1); si2(1) = y2;
    k_old = k;
    k(1) = k(1) + y1^2;
    k(2) = k(2) + y2^2;
    k(3) = k(3) + y3^2;
    k(3)
    delta = k - k_old;
    x1 = 0;
end
k = sqrt(k);
k
sos_unscaled = [0.0662272, 0.0662272, 0.0000000, 1.0000000, -0.2593284, 0.0000000; ...
       1.0000000, 2.0000000, 1.0000000, 1.0000000, -0.6762858, 0.3917468];
sos_scaled = [0.0662272/k(2), 0.0662272/k(2), 0.0000000, 1.0000000, -0.2593284, 0.0000000; ...
       1.0000000/k(3), 2.0000000/k(3), 1.0000000/k(3), 1.0000000, -0.6762858, 0.3917468];
sos_unscaled
sos_scaled
%end