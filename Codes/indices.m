function f = indices(p, nc)
   f=zeros(2,1);
   f(2) = mod(p, nc);
   if f(2) == 0
       f(2) = nc;
   end
   f(1) = floor(double(p)/double(nc)) + 1;
   if f(2)==nc
       f(1) =f(1) - 1;
   end 
end