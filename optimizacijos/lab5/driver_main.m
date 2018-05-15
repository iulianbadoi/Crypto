L_B = -4;
U_B = 4;

BIT_CNT = 10;
POP_CNT = 50;
GENS_CNT = 1000;
MUTATE_DEG = 0.05;
MATE_DEG = 0.6;

chroms = gen_population(BIT_CNT, POP_CNT);

[fit_i, fit_total] = fitness(@fx, chroms, L_B, U_B);
fit_total
for i = 1:GENS_CNT
    selected = select_ga(@fx, chroms, L_B, U_B);
    mated = mating(chroms, MATE_DEG);
    mutated = mutate_chroms(chroms, MUTATE_DEG);
    chroms = mutated;
end
[fit_i, fit_total] = fitness(@fx, chroms, L_B, U_B);
[val index] = min(fit_i);
size(chroms)
bin2dec(chroms(index, :), L_B, U_B)
val
fit_total