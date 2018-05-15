% Plot the trajectory of Anti-Gradient Descent
[x,y]=meshgrid(-3:.3:3);
z=100*(y-x.^2).^2+(1-x.^2).^2;
figure(1)
hold off
contour(x,y,z)
[dx,dy]=gradient(z,.2,.2);
hold on
quiver(x,y,dx,dy)
% set the initial point
x=[1.3,1.3];
xs=x; % dummy variable required for the iterative process
itsk=50; % the number of iterations
step=0.002; % the step size
for i=1:itsk

 % compute the next point
 x = xs - step*gradient1(xs)./abs(gradient1(xs));
 % plot the step
 plot([xs(1),x(1)],[xs(2),x(2)],'r',[xs(1),x(1)],[xs(2),x(2)],'ro')
 % refresh the variables
 xs=x
end