function res = phi( N, primes )
    res = 1;
    for i = 1: length(primes)
        if mod(N, primes(i)) ~= 0
           fprintf('Klaida! %i-tasis prime elementas nedalina N\n', i);
           return;
        end
        res = res * ( N - N / primes(i));
    end
    res = res / (N ^ (length(primes) - 1));
    
end

