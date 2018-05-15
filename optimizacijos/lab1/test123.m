clear all

A = [5 0; 0 2];

T = [-2 -2];
S = [-0.2 -0.5];

tx = -4:.2:4;
ty = T(2) + (tx-T(1))*S(2)/S(1);


[B,C] = eig(A);

[X,Y] = meshgrid(-4:.2:4, -4:.2:4);
        Z = 0.5*(A(1,1)*X .^2 + 2*A(1,2)*X.*Y + A(2,2)*Y.^2);
        
[dX,dY]=gradient(Z);

subplot(1,2,1)
% braizome konturini dvieju kintamuju funkcijos z brezini

contour(X,Y,Z,20)

% nurodome, kad sekanti piesinuka braizytu tame paciame brezinyje

hold on

% braizome gradientu lauka

quiver(X,Y,dX,dY)

% Nurodome, kad toliau jau leidziame braizyti, istrynus senaji
% brezini. To gali prireikti, jei vel noresime braizyti
% kitoje programoje, kuria leisime po sios
hold on

line([0 B(1,1)], [0 B(1,2)], 'linewidth', 3)
hold on
line([0 B(2,1)], [0 B(2,2)], 'linewidth', 3)
hold on
line(tx,ty,'linewidth',3,'color',[1 0 0])

hold off
axis([-4 4 -4 4])
%axis equal

subplot(1,2,2)
for i = 1:length(tx)
    tt(i) = i;
    tz(i) = 0.5*(A(1,1)*tx(i)^2 + 2*A(1,2)*tx(i)*ty(i) + A(2,2)*ty(i)^2);
end
plot(tt,tz)