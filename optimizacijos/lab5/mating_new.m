function chrom1=mate_new(chrom,kiek)
% crossover procedure
% chrom – the initial set of genes
% chrom1 – genes after the crossover
% kiek – crossover degree from 0 to 1
mateind = [ ];
chrom1 = chrom;
[pop bitlength] = size(chrom);
ind = 1:pop;
u = floor(pop*kiek);
if floor(u/2) ~= u/2
 u = u-1;
end
% random crossover
while length(mateind)~=u
 i = round(rand*pop);
 if i == 0
 i = 1;
 end
 if ind(i) ~= -1
 mateind = [mateind i];
 i = -1;
 end
end
% crossover at a random point
for i = 1:2:u-1
 splitpos = floor(rand*bitlength);
 if splitpos == 0
 splitpos = 1;
 end
 i1 = mateind(i);
 i2 = mateind(i+1);
 tempgene = chrom(i1,splitpos+1:bitlength);
 chrom1(i1,splitpos+1:bitlength)=chrom(i2,splitpos+1:bitlength);
 chrom1(i2,splitpos+1:bitlength)=tempgene;
end