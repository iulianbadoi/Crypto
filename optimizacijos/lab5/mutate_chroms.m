function chroms = mutate_chroms(chroms, mutate_deg, dim)
    [pop_cnt bit_cnt] = size(chroms);
    pop_cnt = pop_cnt / dim;
    for i = 1:pop_cnt * dim % :^)
       for j = 1:bit_cnt
          if(rand < mutate_deg)
             chroms(i,j) = xor(chroms(i,j), 1); 
          end
       end
    end
end