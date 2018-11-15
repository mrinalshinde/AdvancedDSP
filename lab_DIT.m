BF8=[eye(4),eye(4);eye(4),-eye(4)];
B4=[1 0 1 0;0 1 0 1;1 0 -1 0;0 1 0 -1];
BF4=[B4 zeros(4,4);zeros(4,4) B4];
V1=[1 -1 1 -1 1 -1 1 -1];
V2=[1 0 1 0 1 0 1];
BF2=zeros(8,8)+diag(V1)+diag(V2,-1)+diag(V2,1);
W8=exp(-2i*pi/8);
D1=zeros(8,8)+diag(ones(1,8));% diagonal matrix for DIT
D1(7,7)=W8^2;
D1(8,8)=W8^2;

D2=zeros(8,8)+diag(ones(1,8));
D2(4,4)=W8^2;
D2(6,6)=W8^1;
D2(8,8)=W8^3;

% Diagonal matrix for DIF
D3=zeros(8,8)+diag(ones(1,8));% diagonal matrix for DIT
D3(6,6)=W8^1;
D3(7,7)=W8^2;
D3(8,8)=W8^3;

D4=zeros(8,8)+diag(ones(1,8));
D4(4,4)=W8^2;
D4(8,8)=W8^2;


%bit reversal matrix
BR=zeros(8,8);
b=bitrevorder(0:7)'+1;
for k=1:8
    BR(k,b(k))=1;
end
DIT=BR*BF2*D2*BF4*D1*BF8;
DDFT=dftmtx(8);
if norm(DIT-DDFT)< (10^(-9))
    disp('DFT matrix factorization of DIT signal flow graph is right');
else
    disp('DFT matrix factorization of DIT signal flow graph is  not right')
end

% transpose
DIT_Transpose=BF8*D1*BF4*D2*BF2*BR;
if norm(DIT_Transpose-DDFT)< (10^(-9))
    disp('Transpose of the DIT matrix is right ');
else
    disp('Transpose of the DIT matrix is not right')
end

%DIF
DIF=BR*BF2*D4*BF4*D3*BF8;
if norm(DIF-DDFT)< (10^(-9))
    disp('DFT matrix factorization of DIT signal flow graph is right');
else
    disp('DFT matrix factorization of DIF signal flow graph is  not right')
end