%% Tonleiter
% Tonleiter von Do oder C (524 Hz) bis Ti (988 Hz)
% Exponentielle Gewichtung der 7 Toene und Ausgabe
% auf der Soundkarte
%
clc
clearvars
close all
%% Abtastfrequenz, Zeitvektor, Frequenzen und Noten
fs = 4000;
T = 1/fs;
t = 0:T:0.5;
% Frequenzvektor
fNote = [524 588 660 698 784 880 988];
Do = sin(2*pi*fNote(1)*t+2*pi*rand); % C
Re = sin(2*pi*fNote(2)*t+2*pi*rand); % D
Mi = sin(2*pi*fNote(3)*t+2*pi*rand); % E 
Fa = sin(2*pi*fNote(4)*t+2*pi*rand); % F
So = sin(2*pi*fNote(5)*t+2*pi*rand); % G
La = sin(2*pi*fNote(6)*t+2*pi*rand); % A
Ti = sin(2*pi*fNote(7)*t+2*pi*rand); % B
% Gewichtung der Noten
expWtCnst = 6;
expWt = exp(-abs(expWtCnst*t));
Do = Do.*expWt;
Re = Re.*expWt;
Mi = Mi.*expWt;
Fa = Fa.*expWt;
So = So.*expWt;
La = La.*expWt;
Ti = Ti.*expWt;
%% Tonleiter
noteSequence = [Do Re Mi Fa So La Ti];
% soundsc(noteSequence,fs)
player1 = audioplayer(noteSequence,fs);
play(player1)
% EOF