clc
clearvars
close all
N1=[10,10^2,10^3,10^4];
L=length(N1);
fprintf('\nexecution time of fft\n');
timefft=[0,0,0,0];
for k=1:L
    
    X=randn(1,N1(k));
    tic;
    n=length(X);
    X2=fft(X,n);
   timefft(k)=toc;
end
fprintf('\n execution time of dftmtx\n');
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