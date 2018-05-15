function selected_ga = select_ga(eval_fun, chroms, low, high)
    [pop_cnt bit_cnt] = size(chroms);
    
    selected_ga = chroms;
    
    [fit_i fit_total] = fitness(eval_fun, chroms, low, high);
    
    for i = 1:pop_cnt
       rand_fitness = floor(rand * fit_total);
       sum_curr = 0;
       for j = 1:pop_cnt
          sum_curr = sum_curr + fit_i(j);
          if sum_curr >= rand_fitness
             % Append
             selected_ga(i, :) = chroms(j, :);
             break;
          end
       end
    end
    

end