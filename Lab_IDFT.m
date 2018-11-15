N=8;
X=1:N;
X_fft=fft(X,N);
X1=ifft(X_fft,N);% IFFT COMPUTATION
X2=1/N.*conj(fft(conj(X_fft),N));% FIRST IDFT COMPUTATION
if norm(X1-X2)<10^-9
    fprintf('\nFIRST IDFT successful');
else
    fprintf('FIRST IDFT not successful');
end
X3=1/N.*conj(fft(conj(X_fft)));% SECOND IDFT COMPUTATION
if norm(X1-X3)<10^-9
    fprintf('\nSECOND IDFT successful');
else
    fprintf('SECOND IDFT not successful');
end
Y=X1-X2;
