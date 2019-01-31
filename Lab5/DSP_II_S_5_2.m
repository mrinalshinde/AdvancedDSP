% DSP_II_S_5_2
% Solution for DSP II Problem 5.2
% 
% Scaling a 3rd-order IIR Filter in Cascade Form using the Method scale 
%
clc
clearvars
close all
% SOS matrix and filter object
sosmtx = [0.0662272    0.0662272    0  ...
          1.0000      -0.2593284    0; ...
          1.0000       2.0000       1.0000  ...
          1.0000      -0.6762858    0.3917468]; 
g = 1;      
hd = dfilt.df2sos(sosmtx,g);
% Call scale for filter object hd
hds = scale(hd,'L2', 'ScaleValueConstraint','none',...
    'sosReorder','none');
disp('SOS-Matrix obtained by scale:');
disp(hds.sosMatrix);
% Scale values are given in hds.ScaleValues
s1 = hds.ScaleValues(1);
s2 = hds.ScaleValues(2);
s3 = hds.ScaleValues(3);
disp('Scale values obtained by scale:');
disp('s1 = '); disp(hds.ScaleValues(1));
disp('s2 = '); disp(hds.ScaleValues(2));
disp('s3 = '); disp(hds.ScaleValues(3));
%
% Compare the results with the scaled SOS-Matrix
k1 = sqrt(1.07210002757252);
k2 = sqrt(0.02679820762398);
k3 = sqrt(11.96975400608943);
sosmtxscaled = [sosmtx(1,1)/k2   sosmtx(1,2)/k2   sosmtx(1,3)     ...
                sosmtx(1,4)      sosmtx(1,5)      sosmtx(1,6)  ;  ...
                sosmtx(2,1)/k3   sosmtx(2,2)/k3   sosmtx(2,3)/k3  ...
                sosmtx(2,4)      sosmtx(2,5)      sosmtx(2,6) ];
fprintf('\nScaled SOS-Matrix should be:\n');
disp(sosmtxscaled);
disp('Scaled Gain should be:');
disp(g/k1);
%
% Note: There is an additional input scaling multiplier of the second stage
% scaled structure after scaling with method see realizemdl(hds);
realizemdl(hds);
% 
sosMatrix2 = hds.sosMatrix;
sosMatrix2(1,1) = sosMatrix2(1,1)*s2;
sosMatrix2(1,2) = sosMatrix2(1,2)*s2;
disp('Combining the additional scaling multiplier with SOS-Matrix:');
disp(sosMatrix2);
% EOF