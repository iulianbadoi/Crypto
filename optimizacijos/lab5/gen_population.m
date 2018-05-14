function population = gen_population(bit_len, individ_cnt)
    population = [];
    for i = 1:individ_cnt
        chrom = [];
        for j = 1:bit_len 
            chrom = [chrom randi([0 1])];
        end
        population = [population; chrom];
    end
end