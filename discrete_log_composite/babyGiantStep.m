function ret = babyGiantStep(g, alpha, N)
    % Finds x in g^x = alpha MOD N in roughly O(sqrt(N)) time
    % Trying to solve for g ^ (i * m + j) = alpha
    % g ^ (i * m) = alpha * g ^ (-j)
    % Hashmap int -> int
    table =  containers.Map('KeyType','int32','ValueType','int32');
    m = floor(sqrt(N)) + 1;
    
    %fprintf('g - %d, alpha - %d, N - %d, m - %d\n', g, alpha, N, m); 
    
    ret = -1;
    % Table containing baby steps, i.e g ^ (i)
    prevVal = 1;
    for i=0:m-1
        table(prevVal) = i;
        prevVal = mod(prevVal * g, N);
    end 
    % Find inverse element, g^(-m) 
    inverseEl = findInverse(prevVal, N);
    % Iterating through giant steps, g ^(j * -m) 
    prevVal = 1;
    for j=0:m-1
        finalVal = mod(alpha * prevVal, N);
        
        if isKey(table, finalVal)
            babyStepI = table(finalVal);
            ret = babyStepI + j * m;
            if(ret == 0)
               ret = N - 1; 
            end
            return;
        end
        prevVal = mod(prevVal * inverseEl, N);
    end 

end