function [fit_i, fit_total] = fitness(eval_fun, chroms, low, high)
    [pop_size bit_cnt] = size(chroms);

    fit_i = [];
    fit_total = 0;
    
    for i = 1:pop_size
        dec_chrom = 0;
        dec_chrom = bin2dec(chroms(i, :), low, high);
        fit_i = [fit_i eval_fun(dec_chrom)];
    end
    
    fit_total = sum(fit_i);
end