% Find a feasible direction of descent for:
% f(x,y) = (x-100)^2 + (y-1)^2
% g1(x,y) = y + 1 >= 0
% g2(x,y) = -y >= 0
% starting point X0 = [0; -1]
%
% Find w that minimizes f = -1t + 0d1 + 0d2
%
% subject to
% 1t - 200d1 - 4d2 <= 0
% 1t + 0d1 - 1d2 <= 0
% -1 <= d1 <= 1; -1 <= d2 <= 1.
% 
f = [-1; 0; 0];
A =  [1 -200  -4; 1 0 -1];
b = [0; 0];
lb = [-1; -1; -1];
ub = [10000; 1; 1];

[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb,ub);

x
fval
exitflag

X = -1:0.01:2;
G1 = -1*ones(size(X));
G2 = zeros(size(X));
plot(X,G1,'k'); hold on;plot(X,G2,'k'); hold on;

% grad(f) at X0 = [-200; -4]
% grad(g1) at X0 = [0; 1]

gf = [-200; -4];
gg1 = [0; 1];
d = [x(2); x(3)];

quiver(0,-1,-200/norm(gf),-4/norm(gf)); hold on;
quiver(0,-1,0/norm(gg1),1/norm(gg1)); hold on;
quiver(0,-1,x(2)/norm(d),x(3)/norm(d)); hold on

% VENOTT Modification
%
% Find w that minimizes f = -1t + 0d1 + 0d2
%
% subject to
% 1t - 200d1 - 4d2 <= 0
% 1t + 0d1 - 1d2 <= 0
% 1t + 0d1 + 1d2 <= 1
% -1 <= d1 <= 1; -1 <= d2 <= 1.

Amod =  [1 -200  -4; 1 0 -1; 1 0 1];
bmod = [0; 0; 1];

[xmod,fvalmod,exitflag,output,lambda] = linprog(f,Amod,bmod,[],[],lb,ub);

xmod
fvalmod
exitflag

dmod = [xmod(2); xmod(3)];
quiver(0,-1,xmod(2)/norm(dmod),xmod(3)/norm(dmod)); hold on

axis equal