clear all

A = [2 -0.4; -0.4 0.5];

eig(A)
[X,Y] = meshgrid(-4:.1:4, -4:.1:4);
Z = 0.5*(A(1,1)*X .^2 + 2*A(1,2)*X.*Y + A(2,2)*Y.^2);
%Z = 100*(Y-X.^2).^2+(1-X.^2).^2;

contour(X,Y,Z,20); hold on

X0 = [1;2];

for i=1:10
S = X0 * A

gamma = (S'*S)/(S'*A*S);

X1 = X0 + gamma*S;
plot([X0(1) X1(1)], [X0(2) X1(2)], 'k'); hold on

X0 = X1;
end

hold off
axis equal