function population = gen_population(bit_len, individ_cnt, dim)
    % dim for dimensions
    population = [];
    for i = 1:individ_cnt
        for d = 1:dim
            chrom = [];
            for j = 1:bit_len 
                chrom = [chrom randi([0 1])];
            end
            population = [population; chrom];
        end
    end
end