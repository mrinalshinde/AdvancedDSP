% Example for the design of Nyquist filters
clc
clearvars
close all
%
%% Design with firnyquist
l = 3;           % number of bands l
r = 0.33;        % rolloff factor r, must satisfy 0 < r < 1
% r is related to the normalized transition width tw by tw = r/l
dev = 0.001;     % scalar to specify the peak ripple   
% peak ripple is constrained by the scalar dev
h1 = firnyquist('minorder',l,r,dev);
hvt1 = fvtool(h1,1);
legend(hvt1,'3-band Nyquist filter designed with firnyquist');
%
%% Design with firhalfband
fp = 0.45;     % passband edge frequency fp, must satisfy 0 < fp < 0.5
dev = 0.05;    % scalar to specify the peak ripple
% Half-band filter of minimum order, designed with the equiripple method
h2 = firhalfband('minorder',fp,dev);
hvt2 = fvtool(h2,1);
legend(hvt2,'Halfband filter designed with firhalfband');
%
%% Design with fdesign.nyquist
n = 34;         % filter order
ast = 60;       % attenuation in the stop band in decibels
hd3 = fdesign.nyquist(3,'n,ast',n,ast);
h3 = design(hd3,'kaiserwin');
hvt3 = fvtool(h3.numerator,1);
legend(hvt3,'3-band filter designed with fdesign.nyquist');
%
% EOF