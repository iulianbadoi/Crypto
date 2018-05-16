function population = gen_population(bit_len, individ_cnt, dim)
    % dim for dimensions
    population = [];
    for i = 1:individ_cnt
        for d = 1:dim
            chrom = [];
            for j = 1:bit_len 
                chrom = [chrom round(rand)];
            end
            population = [population; chrom];
        end
    end
end