clc; clearvars; close all;
[B, A] = ellip(3, 0.2, 20, 0.5);
[Z, P, K] = tf2zp(B, A);
coeff = zp2sos(Z, P, K);
H1 = zeros(Ns,159);
H2 = zeros(Ns,159);

for i=1:Ns
    % Method I impulse responses & norm evaluation
    Ha(i,:) = impz([1 0 0], coeff(i,4:6), 80)';
    Hb(i,:) = impz(coeff(i,1:3), coeff(i,4:6), 80)';
    l1_H1(i,1) = sum(abs(Ha(i,:))); % l1_norm for first node
    l1_H1(i,2) = sum(abs(Hb(i,:))); % l1_norm for second node
    Gk(i) = max(l1_H1(i,:)); % scale factor for section i
    l1_1(i) = Gk(i) / prod(l1); % Gk(I) / product of previous scale factors
    % Method II impulse responses & norm evaluation
    if i == 1
    H1(i,1:80) = impz([1 0 0], coeff2(i,4:6), 80)';
    H2(i,1:80) = impz(coeff2(i,1:3), coeff2(i,4:6), 80)';
    else
    H1(i,:) = conv(impz(coeff2(i-1,1:3), coeff2(i-1,4:6), 80), impz([1 0 0], coeff2(i,4:6), 80))';
    H2(i,:) = conv(impz(coeff2(i-1,1:3), coeff2(i-1,4:6), 80), impz(coeff2(i,1:3), coeff2(i,4:6), 80))';
    end
    l1_H2(i,1) = sum(abs(H1(i,:))); % l1_norm for first node
    l1_H2(i,2) = sum(abs(H2(i,:))); % l1_norm for second node
    l1_2(i) = max(l1_H2(i,:)); % scale factor for section i
     % Scaling of coefficients
    if i ~= 1
    coeff(i-1,1:3) = coeff(i-1,1:3) / l1_1(i); % Scale coeffs (bi's) - Method I
    coeff1(i-1,1:3) = coeff1(i-1,1:3) / l1_2(i); % Scale coeffs (bi's) - Method II
    end
    coeff2(i,1:3) = coeff2(i,1:3) / l1_2(i); % Scale coeffs (bi's) - Method II convolution
end