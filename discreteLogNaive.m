function res = discreteLogNaive(gen, y, N)
    %gen - generator
    %y   - value that g^x takes, i.e g^x = y Modulo N
    
    res = 1;
    for i = 1:N-1
       if modularExponentiation(gen, i, N) == y
          res = i;
          return;
       end
    end
end