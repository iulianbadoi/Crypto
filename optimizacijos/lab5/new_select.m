function newchrom=new_select(kriter,chrom,a,b,dims)
    % the title of the target function - ‘kriter’
    [pop bitlength]=size(chrom);
    fit=[];
    % the assessment of chromosomes
    [fit,fitot] = fitness(kriter,chrom,a,b, dims);
    for chromnum=1:pop
     sval(chromnum)=sum(fit(1,1:chromnum));
    end
    % roulette
    parname=[];
    for i=1:pop
     rval=floor(fitot*rand);
     if rval<sval(1)
        parname=[parname 1];
     else
         for j=1:pop-1
             sl=sval(j);
             su=sval(j)+fit(j+1);
             if (rval>=sl) & (rval<=su)
                 parname=[parname j+1];
             end
         end
     end
    end
    newchrom(1:pop,:)=chrom(parname,:);