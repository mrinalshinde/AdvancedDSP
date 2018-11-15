clc
clearvars
close all
N1=[10,10^2,10^3,10^4];
L=length(N1);

timefft=[0,0,0,0];
fprintf('\n execution time of fft: ');
fprintf('\n')

for k=1:L
    
    X=randn(1,N1(k));
    tic;
    n=length(X);
    X2=fft(X,n);
   timefft(k)=toc;
   disp(timefft(k))
end

timedftmtx=[0,0,0,0];
for k=1:L
    
    X=randn(1,N1(k));
    tic;
    n=length(X);
    X1=X*dftmtx(n);
   timedftmtx(k)=toc;
   
end


plot(N1,timefft,N1,timedftmtx);
title('Exceution Time');
xlabel('N')
ylabel('FFT and DFT');