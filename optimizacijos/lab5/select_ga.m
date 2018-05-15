function selected_ga = select_ga(eval_fun, chroms, low, high, dim)
    % One sample is dimens - dimensional
    
    [pop_cnt bit_cnt] = size(chroms);
    pop_cnt = pop_cnt / dim;
    
    selected_ga = chroms;
    
    [fit_i fit_total] = fitness(eval_fun, chroms, low, high, dim);
    min_val = min(fit_i);
    for i = 1:size(fit_i)
        fit_i(i) = fit_i(i) - min_val + 1;
        fit_total = fit_total - min_val + 1;
    end
    fit_total = sum(fit_i); 
    
    for i = 1:pop_cnt
       rand_fitness = floor(rand * fit_total);
       sum_curr = 0;
       for j = 1:pop_cnt
          sum_curr = sum_curr + fit_i(j);
          if sum_curr >= rand_fitness
             % Append
             selected_ga( (i - 1) * (dim) + 1 : i * dim, :) = chroms((j - 1) * (dim) + 1 : j * dim, :);
             break;
          end
       end
    end
    

end