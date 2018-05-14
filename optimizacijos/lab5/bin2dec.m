function converted = bin2dec(number, low, high)
    converted = 0;
    len = length(number);
    pow = 1;
    max_number = 2 ^ (len) - 1;
    for i = len:-1:1
        converted = converted + pow * number(i);
        pow = pow * 2;
    end
    
    converted = low + ((high - low) / (max_number)) * converted;
end