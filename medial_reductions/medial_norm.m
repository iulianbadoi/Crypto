function n = medial_norm(element)
beta = element(1);
i = element(2);
j = element(3);
alpha = element(4);

if(medial_is_reducible(element) == true)
    gamma = alpha + i;
    delta = beta + j;
    liambda = abs(gamma - delta);
    miu = min(gamma,delta);
    
    if(miu == gamma)
        pos = 2;
    else
        pos = 3;
    end
    
    miu_1 = mod(miu,3);
    if(miu_1 ~= 2)
        miu_1 = miu_1 + 3;
    end
    
    if(miu_1 == 2 && pos == 2 && beta == 0)
       miu_1 = miu_1 + 3;
    end
    
    if(miu_1 == 2 && pos == 3 && alpha == 0)
       miu_1 = miu_1 + 3;
    end
    
    if(pos == 2)
        n = [beta, miu_1-alpha, miu_1-beta+liambda, alpha];
    else
        n = [beta, miu_1-alpha+liambda, miu_1-beta, alpha];
    end
else
    n = element;
end

end