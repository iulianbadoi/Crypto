[x,y]=meshgrid(-3:.3:3);
z = 100 * (y - x.^2).^2 + (1 - x.^2).^2;
figure(1)
hold off
contour(x,y,z)
[dx,dy]=gradient(z,.2,.2);
hold on
quiver(x,y,dx,dy)
% set the initial point
x=[-2,3];
xs=x; % dummy variable required for the iterative process
itsk=300; % the number of iterations
step=0.0003; % the step size
for i=1:itsk
 grad = gradient1(xs)
 x = xs - step*grad;
 xa = xs;
 difference = 1;
 while difference > 0
     x = xs - step*grad;
     difference = fun2(xs) - fun2(x);
     if difference > 0
         xs = x;
     end
 end
 plot([xa(1),x(1)],[xa(2),x(2)],'r',[xa(1),x(1)],[xa(2),x(2)],'ro')
 
 xs=x
end