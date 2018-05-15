function [ res ] = fx(x)
    res =(100 * (x(2) - x(1)^2)^2 + (1 - x(1)^2));
    return;
    res = (10 + x^2 - 10 * cos(2 * 3.14 * x));
    return;
    res = -( 10 + (1 / ( (x-0.16)^2 + 0.1))*sin(x));
end

