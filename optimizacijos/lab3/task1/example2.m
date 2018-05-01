% Find a feasible direction of descent for:
% f(x,y) = (x-3)^2 + (y-3)^2
% g(x,y) = -x^2 - y + 1 >= 0
% starting point X0 = [-1; 0]
%
% Find x that minimizes f = -1t + 0d1 + 0d2
%
% subject to
% 1t - 2d1 + d2 <= 0
% 1t - 8d1 - 6d2 <= 0
% -1 <= d1 <= 1; -1 <= d2 <= 1.
% 
f = [-1; 0; 0];
A =  [1 -2  1; 1 -8 -6];
b = [0; 0];
lb = [-1; -1; -1];
ub = [1000; 1; 1];

[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb,ub);

x
fval
exitflag

X = -2.5:0.01:2.5;
G = 1 - X.^2;
plot(X,G); hold on;

% grad(f) at X0 = [-8; -6]
% grad(g) at X0 = [2; -1]

quiver(-1,0,-8/5,-6/5); hold on;
quiver(-1,0,2/1,-1/1); hold on;
quiver(-1,0,x(2),x(3)); hold on
