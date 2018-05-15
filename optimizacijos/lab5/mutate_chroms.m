function chroms = mutate_chroms(chroms, mutate_deg)
    [pop_cnt bit_cnt] = size(chroms);
    
    for i = 1:pop_cnt
       for j = 1:bit_cnt
          if(rand < mutate_deg)
             chroms(i,j) = xor(chroms(i,j), 1); 
          end
       end
    end
end