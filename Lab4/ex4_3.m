clc; clear all; close all;

theta = 0:2*pi/100:2*pi;
r1 = cos(theta); r2 = sin(theta); 
figure(2); subplot(1,2,1)
plot(r1,r2,'b.','Linewidth',1.5); hold on;
a = [1 0 0];
for k = -1:0.1:1
    for l = -1:0.1:1
        b = [1,-k,l];
        Hd = tf(a,b);
        P = pole(Hd); hold on;
        plot(real(P),imag(P),'r.'); hold on;
    end
end
axis([-1 1 -1 1]);
hold off;
title('Pole distribution Direct Form');

theta = 0:2*pi/100:2*pi;
r1 = cos(theta); r2 = sin(theta); 
subplot(1,2,2);
plot(r1,r2,'b','Linewidth',1.5); hold on;

for r = -1:0.1:1
    for th = 0:2*pi/100:2*pi
        a = [r*sin(th) 0 0];
        b = [1,-2*r*cos(th),r*r];
        Hd = tf(a,b);
        P = pole(Hd); hold on;
        plot(real(P),imag(P),'r.'); hold on;
    end
end
hold off;
title('Pole distribution Coupled Form');

