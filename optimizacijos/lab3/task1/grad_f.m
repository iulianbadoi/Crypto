function [ x, y] = grad_f(X)
    x = 2 .* (X(1) - 3);
    y = 2 .* (X(2) - 3);
end

