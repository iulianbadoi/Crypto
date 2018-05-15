function [fit_i, fit_total] = fitness(eval_fun, chroms, low, high, dim)
    [pop_size bit_cnt] = size(chroms);

    pop_size = pop_size / dim;
    fit_i = [];
    fit_total = 0;
    
    for i = 1:dim:pop_size * dim
        args = [];
        for d = 0:dim-1
            dec_chrom = bin2dec(chroms(i + d, :), low, high); 
            args = [args dec_chrom];
        end
        fit_i = [fit_i eval_fun(args)];
    end
    
    fit_total = sum(fit_i);
end