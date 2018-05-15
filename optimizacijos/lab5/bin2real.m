function deci=bin2real(chrom,a,b)
    % binary chromosome -> decimal number in the range from a to b
    [pop bitlength] = size(chrom);
    maxchrom=2^bitlength-1;
    % weights of binary digits
    realel=chrom.*((2*ones(1,bitlength)).^fliplr([0:bitlength-1]));
    % sumation 
    tot=sum(realel);
    % range
    deci=a+tot*(b-a)/maxchrom;