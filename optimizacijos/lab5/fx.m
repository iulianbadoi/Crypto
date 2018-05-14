function [ res ] = fx(x)
    res = x^2 + 1 - x^3 + x^4/12 + mod(x, 12) - 7*mod(x^3,12);
end

