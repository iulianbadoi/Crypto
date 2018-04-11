function [ p, q] = rhosFactorization( N )
    % Factorizes N in roughly O(N^(1/4)) time
    p = 1; q = N;
    if isprime(N)
       return;
    end
    function F = f(x0, C)
       F = mod(x0 ^ 2 + C, N);
    end
    
    slow = 2; fast = 2; x0 = 2; C = 1;
    while 1
        slow = f(slow, C);
        fast = f(f(fast, C), C);
        [gcd,~,~] = extendedEuclid(abs(slow - fast), N);
        if gcd ~= 1
           %fprintf('Got some gcd - %d', gcd);
           p = gcd;
           q = N / gcd;
           return;
        end
    end

end

