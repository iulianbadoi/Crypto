clear all;
close all;

x = linspace(-4, 15);

% plotting boundaries
% Y1 = sqrt(2.*x - 1);
Y2 = (9 - 0.8*(x.^2)) ./ 2;

figure
hold on
plot((x.^2 + 1) / 2, x); % pirmas constraint
plot(x, Y2);

legend('1-mas constraintas', '2-ras constraintas');
% Find a feasible direction of descent for:
% f(x,y) = (x-3)^2 + (y-3)^2
% g1(x,y) = 2*x - (y)^2   - 1        >= 0
% g2(x,y) = 9 - 0.8 * (x)^2 - 2*y >= 0
% Is pradziu aktyvus yra tik g1, tai ji ir naudosim
% starting point X0 = [0.5,0]
% 
% Find x that minimizes f = -1t + 0d1 + 0d2
%
% subject to
% 1t - 10d1 + 2d2 <= 0
% 1t - 2d1 + 8d2 <= 0
% -1 <= d1 <= 1; -1 <= d2 <= 1.
% 

% startying point
X = [0.5, 0];
plot(X(1), X(2), 'r*');

EPS = 1e-8;
STEP = 0.01;

[gradFX, gradFY] = grad_f(X);
[gradGX, gradGY] = grad_g1(X);
quiver(X(1), X(2), gradFX, gradFY, 'g');
quiver(X(1), X(2), gradGX, gradGY, 'b');

% Move right until some boundary is hit

%
for i = 1:20
    f = [-1; 0; 0];
    % Ziurim kuris constrainas yra active
    
    % Tariam, kad jau esam boundary
    
    % Veinoto modifikacija!!!
    [gfx, gfy] = grad_f(X);
    [ggx1, ggy1] = grad_g1(X);
    [ggx2, ggy2] = grad_g2(X);
    
    g1_eval = g1(X);
    g2_eval = g2(X);
    
    A =  [1 gfx  gfy; 
          1 -ggx1 -ggy1; 
          1 -ggx2 -ggy2];
    b = [0; g1_eval; g2_eval];
    
    lb = [-1; -1; -1];
    ub = [1000; 1; 1];

    [x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb,ub);
    %quiver(X(1), X(2), x(2), x(3), 'black');
    oldPnt = X;
    for j=1:10000
        % Check constraints
        D(1) = X(1) + (STEP) * x(2);
        D(2) = X(2) + (STEP) * x(3);

        if(g1(D) < -0.0 || g2(D) < -0.0) 
            fprintf('Breaking @ %d - iter\n', j);
            break;
        end
        X = D;
    end
    plot([oldPnt(1), X(1)], [oldPnt(2) , X(2)], '-O');
end

zz = (X(1) - 3)^2 + (X(2) - 3)^2
