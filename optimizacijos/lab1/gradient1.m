function g=gradient1(x)
    % partial derivative in respect of x(1)
    g(1)=4*x(1).*(101*x(1).^2 - 100*x(2) - 1);
    % partial derivative in respect of x(2)
    g(2)=200*(x(2) - x(1)^2);