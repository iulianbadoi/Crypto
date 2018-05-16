function chrom=mutate_new(chrom,mu)
% mutation of chromosomes
% mu – the mutation strength; usually assumed as a small positive number
[pop bitlength] = size(chrom);
for i=1:pop
    for j=1:bitlength
        if rand <= mu
         if chrom(i,j) == 1
           chrom(i,j) = 0;
         else
            chrom(i,j) = 1;
         end
        end
    end
end