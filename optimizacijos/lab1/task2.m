clear
clear all
close all

[x,y]=meshgrid(-2:.2:2,-1.8:.2:1.8);

z=x.*exp(-x.^2-y.^2)

[dx,dy]=gradient(z);

contour(x,y,z)

hold on

quiver(x,y,dx,dy)

hold off

figure(2)

surf(x, y, z)