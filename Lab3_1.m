clear
randn('state',0);
N=100;
X=randn(1,N); % AWGN noise 
R=1024;
[RB,LB]=xcorr(X,'biased');
BIAS=xcorr(X,'biased');
[RUB,LUB]=xcorr(X,'unbiased');
figure(3)
subplot(2,2,1)
stem(LB,RB);
xlabel('Lag');
ylabel('Correlation biased');

subplot(2,2,2)
stem(LUB,RUB);
xlabel('Lag');
ylabel('Correlation unbiased');


%ZB=fft(Z);
%ZB=fftshift(ZB);
%normFreq=(-N+1:N-1)/N;
%k=1:199;
%W=exp((-2*pi*1i*k)/N);
%lag=W./pi;
%ZUB=(fft(W)).^2/2*N;
%ZUB=fft(RUB);
%ZUB=fftshift(ZUB);
%subplot(2,2,3);
%plot(normFreq,10*log10(ZB),normFreq,10*log10(ZUB)); 

%k1=15;
%K=1:15;

%M=ZB./N;
%MS=ZB.^2/N;

%VAR=cov(ZB);
%subplot(2,2,4);
%plot(K,VAR);

subplot(2,2,3);
BPSD=abs(fft(RB,R));
W = 0:2*pi/R:2*pi*(1-1/R);
line(W/pi,10*log10(BPSD)); 
ylim([-50 30]);
xlim([0 1]);
grid on;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('PSD ');
hold on;

UBPSD=abs(fft(RUB,R));
line(W/pi,10*log10(UBPSD),'color',[1 0 0]); 
legend('Biased','Unbiased');


