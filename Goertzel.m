N=8;
x=1:8;
k1=1:8;
zi=[0 0];%initial conditions
xe=[x 0];
output=zeros(9,8);
for k=0:N-1
w=exp(-1j*2*pi*k/N);
c=-2*cos(2*pi*k/N);
b=[1 -w];
a=[1 c 1];
output(:,k+1)=filter(b,a,xe,zi);
end
Z1=goertzel(x,k1);
%evalution of the result obtained by the goertzel filter
Y=fft(x);
filtout=zeros(1,N);
for i=1:8
    filtout(i)=output(9,i);
end
delta=norm(Y-filtout);
if(delta<10^(-12))
 fprintf('\n output of goertzel function  and filter is same');
else 
 fprintf('\n output of goertzel function and filter is not same');   
end   


