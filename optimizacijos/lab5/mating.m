function mated_chroms = mating(chroms, degree)
    [pop_cnt, bit_cnt] = size(chroms);
    
    mated_chroms = chroms;
    
    mate_cnt = floor(pop_cnt * degree);
    mate_cnt = mate_cnt - mod(mate_cnt, 2);
    
    mates = [];
    for i = 1:mate_cnt
        rand_chrom_id = max(1, round(pop_cnt * rand));
        mates = [mates; rand_chrom_id];
    end
    
    for i = 1:2:mate_cnt
       change_pos = max(1, round(bit_cnt * rand));
       
       mate_1 = chroms(mates(i), :);
       mate_2 = chroms(mates(i + 1), :);
       
       [mated_1, mated_2] = mate_2_(mate_1, mate_2, change_pos);
       
       mated_chroms(i, :) = mated_1;
       mated_chroms(i + 1, :) = mated_2;
   end
end