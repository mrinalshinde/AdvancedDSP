close all
clear all
clc

Asl = input('Choose sidelobe attenuation (< 120 dB):');
if Asl < 13.36
    beta = 0;
elseif (13.26 <= Asl) && (Asl <= 60) 
    beta = 0.76609 * ((Asl-13.26)^0.4) + ...
        0.09834 * (Asl-13.26);
else 
    beta = 0.12438 * (Asl + 6.3);
end

% rectangular window
%R = 256;
%deltaml2 = (4 * pi)/R;
%Asl2 = 13;


