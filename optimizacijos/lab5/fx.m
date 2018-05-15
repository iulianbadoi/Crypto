function [ res ] = fx(x)
    res = -x;
    return;
    res = 10 + (1 / ( (x-0.16)^2 + 0.1))*sin(x);
end

