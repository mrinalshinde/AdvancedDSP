clc
clearvars
close all
N = 4;
fprintf('\nexecution time of fft\n');
t1=zeros(4);
for k=1:N
    X=randn(1, 10^k);
    tic;
    n=length(X);
    X2=fft(X,n);
   t1(k)=toc;
end
fprintf('\n execution time of dftmtx\n');
t2=zeros(4);
for k=1:N
    
    X=randn(1,10^k);
    tic;
    n=length(X);
    X1=X*dftmtx(n);
   t2(k)=toc;
end
x_axis=1:N;
semilogx(x_axis,t1,x_axis,t2);
title('Exceution Time');
xlabel('Number of FFT bins')
ylabel('Time Taken');