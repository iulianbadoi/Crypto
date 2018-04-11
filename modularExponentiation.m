function res = modularExponentiation(a, pow, N)
    % Computes a ^ pow MOD (N) in O(logN) time
    res = 1;
    while pow > 0
       if bitand(pow, 1) == 1
           res = mod((res * a), N);
       end
       pow = floor(pow / 2);
       a = mod(a * a, N);
    end
end

