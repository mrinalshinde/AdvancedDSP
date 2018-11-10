% Matrix decomposition for the DIT FFT algorithm for N = 8
clc
close all
clearvars
%
%% Create the matrices for the DIT FFT algorithm for N = 8
%
% Matrix BF8 for the stage with the butterflies using 8 values
BF8 = [eye(4) eye(4); eye(4) -eye(4)];
% Matrix BF4 for the stage with the butterflies using 4 values
B4 = [1 0 1 0 ; 0 1 0 1; 1 0 -1 0; 0 1 0 -1];
BF4 = [B4 zeros(4,4); zeros(4,4) B4];
% Matrix BF2 for the stage with the butterflies using 2 values
v1 = [1 -1 1 -1 1 -1 1 -1]; 
v2 = [1 0 1 0 1 0 1];
BF2 = zeros(8,8) + diag(v1) + diag(v2,-1) + diag(v2,1);
% Diagonal matrix D1  
W8 = exp(-2i*pi/8);
D1 = zeros(8,8) + diag(ones(1,8));
D1(4,4) = W8^2;
D1(8,8) = W8^2;
% Diagonal matrix D2
D2 = zeros(8,8) + diag(ones(1,8));
D2(6,6) = W8^1;
D2(7,7) = W8^2;
D2(8,8) = W8^3;
% Matrix BR for the bit reversal 
BR = zeros(8,8);
b = bitrevorder(0:7)' + 1;
for k = 1:8
    BR(k,b(k)) = 1;
end
%
%% Verify the matrix decomposition using the submatrices
%
% Create the matrix FFT8_DIT
FFT8_DIT = BF8*D2*BF4*D1*BF2*BR; % Note that X = FFT8_DIT * x
% Check the result using the DFT matrix creted by dftmtx(8)
DFT8 = dftmtx(8);
if norm(abs(FFT8_DIT-DFT8)) < 10^-9
    disp('DFT matrix factorization of DIT FFT signal flow graph is okay!');
else
    disp('Sorry, something is wrong ... ');
end
% EOF