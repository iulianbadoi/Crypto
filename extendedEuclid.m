function [gcd, xret, yret] = extendedEuclid(a, b)
    % Solves for (x,y) in a * x + b * y = gcd(a,b)
    
    % x = - (b // a) * x1 +  y1
    % y = x1
    
    if rem(b, a) == 0
       xret = 1;
       yret = 0;
       gcd = a;
       return;
    end
    [res, x1, y1] = extendedEuclid(rem(b,a), a);

    gcd = res;
    xret = -floor(b / a) * x1 + y1;
    yret = x1;
end

