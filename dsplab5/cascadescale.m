function L2_norm=cascadescale(sos,o)
k1 = 1; 
k2 = 1;
k3 = 1; 
x1 = 1/k1; 
si1 = 0; 
si2 = [0 0];
varnew = 0; 
delta = 1;
if o==3
    while delta > 0.000001
        y1 = -sos(1,5)*si1 + x1;
        x2 = (-sos(1,1)/k2)*(y1+si1); 
        si1 = y1;
        y2 = -sos(2,5)*si2(1)-sos(2,6)*si2(2) + x2; 
        y3 = (y2 + 2*si2(1) + si2(2))/k3; 
        si2(2) = si2(1); si2(1) = y2; 
        varold = varnew; 
        varnew = varnew + y1^2; 
       delta = varnew -varold; x1 = 0;
    end
else
      while delta > 0.000001
         y1 = -sos(1,5)*si2(1)-sos(1,6)*si2(2) + x1; 
         y2 = (y1 + 2*si2(1) + si2(2))/k2; 
         si2(2) = si2(1); si2(1) = y1; 
         varold = varnew; 
         varnew = varnew + y1^2;  
         delta = varnew -varold; x1 = 0;
      end
end
fprintf(' \nL2 - norm squared = %f',varnew);
L2_norm = varnew;
end
