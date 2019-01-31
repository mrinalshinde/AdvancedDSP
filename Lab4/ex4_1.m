%clc; clear all; close all;

 n = -1.5:0.00001:1.5;
 x = n;
 w = 5;
 
 y1 = twosquant(n,w,'r','s');
 y2 = twosquant(n,w,'t','s');
 y3 = twosquant(n,w,'r','o');
 y4 = twosquant(n,w,'t','o');
 e1 = x - y1;
 e2 = x - y2;
 e3 = x - y3;
 e4 = x - y4;
 figure(2);
 subplot(2,2,1); stairs(n,y1); hold on; stairs(n,x); hold on; stairs(n,e1,'Linewidth',1.5); hold off; 
 title('Rounding and Saturation'); legend('Output','Input','Error');
 subplot(2,2,2); stairs(n,y2); hold on; stairs(n,x); hold on; stairs(n,e2,'Linewidth',1.5); hold off; 
 title('Truncation and Saturation'); legend('Output','Input','Error');
 subplot(2,2,3); stairs(n,y3); hold on; stairs(n,x); hold on; stairs(n,e3,'Linewidth',1.5); hold off; 
 title('Rounding and Overstairs'); legend('Output','Input','Error');
 subplot(2,2,4); stairs(n,y4); hold on; stairs(n,x); hold on; stairs(n,e4,'Linewidth',1.5); hold off; 
 title('Truncation and Overflow'); legend('Output','Input','Error');
 