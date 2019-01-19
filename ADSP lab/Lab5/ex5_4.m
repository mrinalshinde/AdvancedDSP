clc; clearvars; close all;
d = fdesign.lowpass(0.5,0.6,1,60);
hd = design(d,'ellip');
B = 13;     % word length
L = B-1;    % fraction length
set(hd,'arithmetic','fixed');

%% Scaling using Linf-norm, product round-off noise and overflows
HdLinf = copy(hd);
scale(HdLinf,'Linf','scalevalueconstraint','none');
x1 = reorder(HdLinf,'up');
hfvt1 = fvtool(HdLinf,x1,'analysis','noisepower');
legend(hfvt1,'HdLinf not reordered','HdLinf reordered');

HdL2 = copy(hd);
scale(HdL2,'L2','scalevalueconstraint','none');
x2 = reorder(HdL2,'up');
hfvt2 = fvtool(HdL2,x2,'analysis','noisepower')
legend(hfvt2,'HdL2 not reordered','HdL2 reordered');