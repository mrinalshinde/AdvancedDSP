% Example for FIR filter order for single and multistage decimator
clc
clearvars
close all
%
%% Single stage design for H(z)
rp = 0.002;             % Passband ripple
rs = 0.001;             % Stopband ripple
ft = 12000;             % Sampling frequency
f = [180 200];          % Cutoff frequencies
a = [1 0];              % Desired amplitudes
dev = [rp rs];         % Desired deviations 
NH = firpmord(f,a,dev,ft);
disp('##### Filter order for single stage decimation filter H(z) #####'); 
format compact;
disp(NH);
%
%% Filter order for image suppressor filter G(z)
rp = 0.001;             % Passband ripple
rs = 0.001;             % Stopband ripple
ft = 12000;             % Sampling frequency
f = [180*15 200*15];    % Cutoff frequencies
a = [1 0];              % Desired amplitudes
dev = [rp rs];         % Desired deviations 
NG = firpmord(f,a,dev,ft);
disp('##### Filter order for image suppressor filter G(z) #####'); 
disp(NG);
%
%% Filter order for periodic filter F(z)
rp = 0.001;             % Passband ripple
rs = 0.001;             % Stopband ripple
ft = 12000;             % Sampling frequency
f = [180 12000/15-200];  % Cutoff frequencies
a = [1 0];              % Desired amplitudes
dev = [rp rs];         % Desired deviations 
NF = firpmord(f,a,dev,ft);
disp('##### Filter order for periodic filter F(z) #####'); 
disp(NF);
%
% EOF