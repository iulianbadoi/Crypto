base_p_1 = sym(257); 
base_p_2 = sym(509);

p = sym(257^3); % Siuo atveju ne pirminis, bet faktorizuoti lengva
q = sym(509);

n = sym(p * q);
e = sym(65537);
oiler_pq = phi(n, [base_p_1, base_p_2]); 

d = findInverse(e, oiler_pq);

if mod(d * e, oiler_pq) ~= 1
   fprintf('Klaida! d ir e nera tarupsavyje pirminiai');
   return;
end
 
message = sym(50);

encrypted_message = mod_exp(message, e, n); % sifrograma
decrypted_message = mod_exp(encrypted_message, d, n)



