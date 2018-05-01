% linprog example
%
% Find x that minimizes f(x) = -5x1 -4x2 -6x3
%
% subject to
% x1 - x2 + x3 <= 20
% 3x1 + 2x2 + 4x3 <= 42
% 3x1 + 2x2 <= 30
% 0 <= x1, 0 <= x2, 0 <= x3.
% 
f = [-5; -4; -6];
A =  [1 -1  1
      3  2  4
      3  2  0];
b = [20; 42; 30];
lb = zeros(3,1);

[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb);

x
fval
exitflag

% check if the solution is on the boundary of the feasible region