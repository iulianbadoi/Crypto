function [gcd, xret, yret] = extendedEuclid(a, b)
    % Solves for (x,y) in a * x + b * y = gcd(a,b)
    
    % x = - (b // a) * x1 +  y1
    % y = x1
    a = sym(a);
    b = sym(b);
    if b == 0 || rem(b, a) == 0
       xret = sym(1);
       yret = sym(0);
       gcd = sym(a);
       return;
    end
    if a == 0
        [res, x1, y1] = extendedEuclid(b, 0);
    else
        [res, x1, y1] = extendedEuclid(rem(b,a), a);
    end
    gcd = res;
    xret = -floor(b / a) * x1 + y1;
    yret = x1;
end

