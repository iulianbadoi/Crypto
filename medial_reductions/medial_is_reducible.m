function par = medial_is_reducible(element)
    beta = element(1);
    i = element(2);
    j = element(3);
    alpha = element(4);

    par = false;

    if((beta + j) > 5 && (alpha + i) > 5)
        par = true;
    end

    if(alpha == 1 && i == 4 && beta == 0 && j == 5)
        par = true;
    end

    if(beta == 1 && j == 4 && alpha == 0 && i == 5)
        par = true;
    end

    if(alpha == 1 && i == 4 && beta == 1 && j>=5)
        par = true;
    end

    if(beta == 1 && j == 4 && alpha == 1 && i>=5)
        par = true;
    end

    if(alpha == 0 && beta == 0 && i == 5 && j>5)
        par = true;
    end

    if(beta == 0 && alpha == 0 && j == 5 && i>5)
        par = true;
    end

    if(alpha == 0 && beta == 1 && i == 5 && j>=4)
        par = true;
    end

    if(beta == 0 && alpha == 1 && j == 5 && i>=4)
        par = true;
    end

end