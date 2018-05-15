close all;
clear all;

L_B = -5;
U_B = 5;

BIT_CNT = 20;
POP_CNT = 150;
GENS_CNT = 1000;
MUTATE_DEG = 0.008;
MATE_DEG = 0.5;
DIM_SIZE = 2;


% Contours and stuff
x = linspace(L_B,U_B);
y = linspace(L_B,U_B);
[X,Y] = meshgrid(x,y);
Z =  -(100 * (Y - X.^2).^2 + (1 - X.^2));

zol = figure
movegui(zol, 'northeast');
xlim([L_B U_B])
ylim([L_B U_B])
hold on;

contour(X,Y,Z)
% global minimumf
figure(1);
plot(1, 1, 'xr');

fig3d = figure;
movegui(fig3d, 'southeast');
figure(2);

hold on;
surf(X,Y,Z);
chroms = gen_population(BIT_CNT, POP_CNT, DIM_SIZE);


ObjectiveFunction = @fx;
nvars = 2;    % Number of variables
LB = [-5 -5];   % Lower bound
UB = [5 5];  % Upper bound
[x,fval] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB)
x
fval




[fit_i, fit_total] = fitness(@fx, chroms, L_B, U_B, DIM_SIZE);
fit_total

init_gen_plot = [];
init_3dgen_plot = [];
for i = 1:GENS_CNT
    selected = select_ga(@fx, chroms, L_B, U_B, DIM_SIZE);
    mated = mating(selected, MATE_DEG, DIM_SIZE);
    mutated = mutate_chroms(mated, MUTATE_DEG, DIM_SIZE);
    chroms = mutated;

    delete(init_gen_plot);
    delete(init_3dgen_plot);

    asd = 4;
end
delete(init_gen_plot);


for j = 1:POP_CNT
    j_pos = [];
    for k = 1:DIM_SIZE
       j_pos = [j_pos bin2dec( chroms( (j - 1) * DIM_SIZE + k, :), L_B, U_B)]; 
    end
    figure(1);
    init_gen_plot = [init_gen_plot plot(j_pos(1), j_pos(2), 'bo')];
    figure(2);
    init_3dgen_plot = [init_3dgen_plot scatter3(j_pos(1), j_pos(2), fx([j_pos(1), j_pos(2)]), 'bo')];
end 

%

[fit_i, fit_total] = fitness(@fx, chroms, L_B, U_B, DIM_SIZE);
[min_val min_index] = min(fit_i);
fprintf('Min value is - %d \n', min_val);
% find location
pos = [];
for d = 1:DIM_SIZE
    converted_val = bin2dec(chroms( (min_index - 1) * (DIM_SIZE) + d, :), L_B, U_B);
    pos = [pos converted_val];
end
fprintf('Position is: \n');
disp(pos);