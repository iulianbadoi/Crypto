p = 5;
q = 7;

%test1
%beta = 11;
%alpha = 16;
% ats x = 8

%test2
beta = 12;
alpha = 11;
% ats x = 8

% Sprendziam x in beta ^ x mod n = alpha  
n = p * q;

mod1 = p - 1;
mod2 = q - 1;


gen_p = 2; % p generatorius
gen_q = 3; % q generatorius


% Isskaidom lygti i dvi lygtis moduliu p ir q


beta_p = mod(beta, p);
beta_q = mod(beta, q);

alpha_p = mod(alpha, p);
alpha_q = mod(alpha, q);

% x * ld(gen_1) (6

% x1 * ld_left_p = ld_rght_p 
ld_left_p = babyGiantStep(gen_p, beta_p, p);
ld_right_p = babyGiantStep(gen_p, alpha_p, p);

% x1 * ld_left_p = ld_right_p mod (p - 1)
inv = findInverse(ld_left_p, p-1);
x1 = mod(inv * ld_right_p, p - 1);

if(ld_left_p == ld_right_p)
   x1 = 0; 
end

% x2 * ld_left_q = ld_rght_q 
ld_left_q = babyGiantStep(gen_q, beta_q, q);
ld_right_q = babyGiantStep(gen_q, alpha_q, q);


% x2 * ld_left_q = ld_right_q mod (q - 1)
inv = findInverse(ld_left_q, q-1);
x2 = mod(inv * ld_right_q, q - 1);

if(ld_left_q == ld_right_q)
   x2 = 0; 
end

% (p - 1) * k1 - (q - 1) * k2 = x2 - x1
x2 = -x2;

diff = x2 - x1;

[gcd, k1, k2] = extendedEuclid(p - 1, q - 1);

if( mod(diff, gcd) ~= 0)
   fprintf('Klaida! Gcd nedalino diffo');
   return;
end

k1 = k1 * (diff / gcd);
k2 = k2 * (diff / gcd);

final_x = k1 * (p - 1) - k2 * (q - 1) + x2 - x1


