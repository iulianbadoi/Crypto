function r = mod_exp(g, n, p)
% skaiciuoja r=g^n mod p
    r = sym(1);
    g = sym(g);
    n = sym(n);
    p = sym(p);
    while n > 0
        if mod(n, sym(2)) ~= 0
            r = mod(r * g, p);
        end
        n = floor(sym(n)/sym(2)); % Apvalinimas zemyn (standartine matlab'o funkcija). Pvz. floor(4.99) = 4. 
        g = mod(g * g, p);
    end
end