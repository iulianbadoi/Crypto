clear all
close all


x = -10:0.01:10;
xx = -10:0.01:10;
% plotting boundaries
% Y1 = sqrt(2.*x - 1);
Y2 = (9 - 0.8*(x.^2)) ./ 2;


figure

hold on
plot((x.^2 + 1) / 2, x,'LineWidth',1); % pirmas constraint
plot(x, Y2,'LineWidth',1);

legend('2 * x - y^2 - 1 = 0', '9 - 0.8 * x^2 - 2 * y = 0');
xlabel('x');
ylabel('y');
plot(x, 5*ones(size(x)), 'b');
plot(x, -5*ones(size(x)), 'b');
plot(5*ones(size(x)), x, 'b');
plot(-5*ones(size(x)), x, 'b');

% f(x,y) = -x - y
% subject to 2x - y^2 - 1 >= 0
% and 9 - 0.8*x^2 - 2y >= 0

% linearization of constraints
% new constraints -5 <= x <= 5 , -5 <= y <= 5
x_min = -500; x_max = 500;
y_min = -500; y_max = 500;


% Iterate while most demaged function is more than EPS
EPS = 1e-5;
f = [1; 1];
A =  [];
b = [];
lb = [-5; -5];
ub = [5; 5];
hold on
X = [0,0];
ITER = 6;
str =strcat('Cutting plane algoritmo eiga, kai iteracija = ', int2str(ITER));
title(str)
oldpnt=X;
polygon_x = [10
             10
          -10
          -10];
polygon_y = [10
             -10
             10
             -10];
hull = convhull(polygon_x, polygon_y);
plot(hull);

return;
         
for i = 1:500
    [x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb,ub);
    x
    X = x;
    val1 = g1(X);
    val2 = g2(X);
    minval = min(val1, val2);
    if(abs(minval) < EPS)
        break;
    end
    % stuff
    if(g1(X) < g2(X))
        [grad_x, grad_y] = grad_g1(X);
        A = [A; -grad_x -grad_y];
        b = [b g1(X)-X(1)*grad_x-X(2)*grad_y];
        
        % Draw line
        
        %get two points :( sad
        x_low = -10;
        x_high = 10;
        
        pnt1 = [x_low, (-g1(X) -grad_x.*(x_low-X(1)) + grad_y*X(2))./grad_y]; 
        pnt2 = [x_high, (-g1(X) -grad_x.*(x_high-X(1)) + grad_y*X(2))./grad_y]; 
        
       if(i ~= ITER)
            pl = plot([pnt1(1), pnt2(1)], [pnt1(2) , pnt2(2)], '--','LineWidth',1, 'color', 'black');
            pl.Color=[0,0,0, 0.14];
       else
            pl = plot([pnt1(1), pnt2(1)], [pnt1(2) , pnt2(2)],'LineWidth',3, 'color', 'green');

       end
        %p1 = plot(xx, (-g1(X) -grad_x.*(xx-X(1)) + grad_y*X(2))./grad_y, 'black');
       
    else
        [grad_x, grad_y] = grad_g2(X);
        A = [A; -grad_x -grad_y];
        b = [b  g2(X)-X(1)*grad_x-X(2)*grad_y]; 
        
        % Draw line
        x_low = -10;
        x_high = 10;
        
        pnt1 = [x_low, (-g2(X) -grad_x.*(x_low-X(1)) + grad_y*X(2))./grad_y]; 
        pnt2 = [x_high, (-g2(X) -grad_x.*(x_high-X(1)) + grad_y*X(2))./grad_y]; 
        
       if(i ~= ITER)
            pl = plot([pnt1(1), pnt2(1)], [pnt1(2) , pnt2(2)], '--','LineWidth',1, 'color', 'black');
            pl.Color=[0,0,0, 0.14];
       else
            pl = plot([pnt1(1), pnt2(1)], [pnt1(2) , pnt2(2)],'LineWidth',3, 'color', 'green');

       end
    end
    if(i == ITER)
        plot(x(1), x(2), 'r*')
    end
    if(i-1==ITER)
        diff = x - oldpnt;
        quiver(oldpnt(1), oldpnt(2), diff(1), diff(2),0, 'magenta', 'LineWidth', 2, 'MaxHeadSize', 3);
        
    end
    oldpnt=x;
end

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
xlim([-10 10])
ylim([-10 10])