clc; clear all; close all;
wordlength = 4;
fractionbits = 2^(-wordlength);
step = 1/(2^(wordlength));
N = 1/step;

theta = 0:2*pi/100:2*pi;
r1 = cos(theta); r2 = sin(theta); 
figure(2); subplot(1,2,1)
plot(r1,r2,'b.','Linewidth',1.5); hold on;
a = [1 0 0];

for k = -N:1:N
    K = k*step;
    for l = -2*N:0.5:2*N
        L = l*step;
        p = roots([1,-K,L]);
        if(abs(p) < 1)
           plot(real(p),imag(p),'r.'); hold on;
        end
    end
end
axis([-1 1 -1 1]);
hold off;
title('Pole distribution Direct Form wordlength 4');

theta = 0:2*pi/100:2*pi;
r1 = cos(theta); r2 = sin(theta); 
subplot(1,2,2);
plot(r1,r2,'b','Linewidth',1.5); hold on;

for alpha = -N:0.5:N
    alpha = alpha*step;
    for beta = -2*N:0.5:2*N
        beta = beta*step;
        b = roots([1,-2*alpha,(alpha*alpha + beta*beta)]);
        if(abs(b) < 1)
           plot(real(b),imag(b),'r.'); hold on;
        end
    end
end
hold off;
title('Pole distribution Coupled Form wordlength 4');