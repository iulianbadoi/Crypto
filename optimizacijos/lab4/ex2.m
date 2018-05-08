clear all
% g(x,y) = 1 - x^2 - y
% linerization of g(x,y) at points on line y = x
%
xmin = (-1 + 5^0.5)/2;
xmax = 2;

n = 100;

X = -2:0.001:2;
G = 1 - X.^2;
plot(X,G,'g'); hold on

for i=1:n
    s = xmin + i*(xmax-xmin)/n;
    Y = -2*s*X + s^2 + 1;
    plot(X,Y,'k'); hold on
end

hold off
axis([-1 1 0 1])
    
    