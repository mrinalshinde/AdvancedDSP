clc
clear
% Goertzel Algorithim   2nd Order IIR filter
x=1:8;
N=length(x)
;
%[I,Q] = goertzel(x,k,N);
for k=0:N-1
w(k+1) = exp(-1i*2*pi*k/N);
v1=0;
v2=0;
for n=1:N
v(k+1,n)=x(n)+(2*cos(2*pi*k/N) * v1)-v2;
v2=v1;
v1=v(k+1,n);
end

X(k+1)=v(k+1,N)-( w(k+1)* v(k+1,(N-1)) )

end

%XX=goertzel(x);% MATLAB Built in function. The function has positive W factor



