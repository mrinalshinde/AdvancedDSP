%clc; clearvars; close all

% unscaled filter
k1 = 1; 
B = 13;     % word length
L = B-1;    % fraction length
g = 1/k1; 
H1 = zeros(2,159);
H2 = zeros(2,159);

sos_unscaled = [0.0662272, 0.0662272, 0.0000000, 1.0000000, -0.2593284, 0.0000000; ...
       1.0000000, 2.0000000, 1.0000000, 1.0000000, -0.6762858, 0.3917468];
k = ones(1, size(sos_unscaled,1));
for i = 1:size(sos_unscaled,1)
    if i == 1
        H1(i,1:80) = impz([1 0 0], sos_unscaled(i,4:6),80)';
        H2(i,1:80) = impz(sos_unscaled(i,1:3), sos_unscaled(i,4:6),80)';
    else
        H1(i,:) = conv(impz(sos_unscaled(i-1,1:3), sos_unscaled(i-1,4:6),80), impz([1 0 0], sos_unscaled(i,4:6),80))';
        H2(i,:) = conv(impz(sos_unscaled(i-1,1:3), sos_unscaled(i-1,4:6),80), impz(sos_unscaled(i,1:3), sos_unscaled(i,4:6),80))';
    end
    sos = sos_unscaled(i,:);
    Hd = dfilt.df2sos(sos,k(1));
    type = 'l1';
    switch type
    case 'l1'
        %l1 = norm(Hd, 'l1');
        l1 = sum(abs(H1(i,:)));
        if l1 >= 1
            %k(i) = sum(abs(sos));
            k(2) = sum(abs(H1(i,:))); % l1_norm for first node
            k(3) = sum(abs(H2(i,:))); % l1_norm for second node
            k(1) = max(k(:)); 
        end
    case 'l2'
        l1 = norm(Hd, 'l2');
        if l1 >= 1
           k(i) =  sqrt(sum(sos.^2));
        end
    case 'linf'
        l1 = norm(Hd, 'linf');
        if l1 >= 1
           k(i) =  max(sos);
        end      
    otherwise
        disp('other value')
    end
end
sos_scaled = [0.0662272/k(2), 0.0662272/k(2), 0.0000000, 1.0000000, -0.2593284, 0.0000000; ...
       1.0000000/k(3), 2.0000000/k(3), 1.0000000/k(3), 1.0000000, -0.6762858, 0.3917468];
sos_unscaled
sos_scaled    
    
