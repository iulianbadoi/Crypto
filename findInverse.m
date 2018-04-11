function [ inverse ] = findInverse( a, N)
   % Find inverse of a modulo N, i.e finds x in a * x = 1 MOD N 
   [gcd, x, y] = extendedEuclid(a, N);
   if gcd ~= 1
       inverse = -1;
   else 
    inverse = mod((x + N), N);
   end
end

