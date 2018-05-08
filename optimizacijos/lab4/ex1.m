clear all
% f(x,y) = -x -2y
% g1(x,y) = 1 - x^2 - y >= 0
% g2(x,y) = y >= 0
%
% Limits: -2 <= x <= 2
%         -1 <= y <= 2
%
% LPP0 yields X0 = [2; 2]
%
% Linearize g1 at X0: -4x -y >= -5
%
f = [-1; -2];
A =  [4 1];
b = [5];
lb = [-2; -1];
ub = [2; 2];

[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb,ub);

x
fval
exitflag

X = -2:0.01:2;
G1 = 1 - X.^2;
G2 = zeros(size(X));
L1 = 5 - 4*X;

plot(X,G1,'k',X,G2,'k',X,L1,'k')
hold on
plot([x(1) x(1)],[x(2) x(2)],'ro')
hold off
axis([-2 2 -1 2])