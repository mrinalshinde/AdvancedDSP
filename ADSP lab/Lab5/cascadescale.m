function L2s = cascadescale(k1,k2,k3,n)
% k1, k2, k3:   scaling factors
% n:            # simulation run
% L:            L2-norm squared
%
% Initialization
si1 = 0;
si2 = [0 0];
varnew = 0; 
delta = 1;
x1 = 1;
% Loop until precision is achieved
while delta > 10^-9
    y1 = 0.2593284*si1 + x1/k1;                     % output node y1
    x2 = (0.0662272)*(y1 + si1)/k2;
    si1 = y1;
    y2 = 0.6762858*si2(1) - 0.3917468*si2(2) + x2;  % output node y2
    y3 = (y2 + 2*si2(1) + si2(2))/k3;               % output node y3
    si2(2) = si2(1); si2(1) = y2;
    varold = varnew;
    if n == 1
        y = y1;
    elseif n == 2
        y = y2;
    elseif n == 3
        y = y3;
    else
        disp('Error: n must be 1, 2 or 3');
    end
    varnew = varnew + y^2;  % squared value of L2-norm 
    delta = varnew - varold;
    x1 = 0;
end
L2s = sqrt(varnew); 
% EOF