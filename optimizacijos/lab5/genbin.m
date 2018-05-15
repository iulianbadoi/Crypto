function chromosome=genbin(bitl,numchrom)
    % generation of a binary population
    % word legth bitl
    % size of the population numchrom
    maxchros=2^bitl;
    if numchrom >= maxchros
       numchrom = maxchros;
    end
    chromosome = round(rand(numchrom,bitl));