close all;
clear all;

L_B = 0.001;
U_B = 0.3;

BIT_CNT = 6;
POP_CNT = 8;
GENS_CNT = 6000000;
MUTATE_DEG = 0.005;
MATE_DEG = 0.6;
DIM_SIZE = 1;


% Contours and stuff
x = L_B:0.001:U_B;
y =( 10 + (1 ./ ( (x-0.16).^2 + 0.1)).*sin(x));
zol = figure

movegui(zol, 'northeast');
xlim([L_B U_B]);
ylim([10 12.5]);
hold on;

% global minimumf

plot(x, y, 'b');

legend('10 + (1 / ( (x-0.16)^2 + 0.1))*sin(x)');
title('f-jos minimizavimas naudojant genetini algoritma');
xlabel('x');
ylabel('y');
hold on;
chroms = gen_population(BIT_CNT, POP_CNT, DIM_SIZE);

EPS = 0.01;

[fit_i, fit_total] = fitness(@fx, chroms, L_B, U_B, DIM_SIZE);
fit_total

init_gen_plot = [];
init_3dgen_plot = [];
for i = 1:GENS_CNT
    selected = new_select(@fx, chroms, L_B, U_B, DIM_SIZE);
    mated = mating_new(selected, MATE_DEG);
    mutated = mutate_new(mated, MUTATE_DEG);
    chroms = mutated;
    [f_i f_t] = fitness(@fx, chroms, L_B, U_B, 1);
    if max(f_i) >= 2.5 - EPS
            for j = 1:POP_CNT
                j_pos = [];
                for k = 1:DIM_SIZE
                   j_pos = [j_pos bin2dec( chroms( (j - 1) * DIM_SIZE + k, :), L_B, U_B)]; 
                end
                init_gen_plot = [init_gen_plot plot(j_pos(1), fx(j_pos(1)), 'bo')];
            end 
            asd = 4;
        i
        break;
    end
    delete(init_gen_plot);


    if mod(i, 1) == 0
        for j = 1:POP_CNT
            j_pos = [];
            for k = 1:DIM_SIZE
               j_pos = [j_pos bin2dec( chroms( (j - 1) * DIM_SIZE + k, :), L_B, U_B)]; 
            end
            init_gen_plot = [init_gen_plot plot(j_pos(1), fx(j_pos(1)), 'bo')];
        end 
        asd = 4;
     end
end
        
delete(init_gen_plot);



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