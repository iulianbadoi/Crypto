function ret = pollardsRhoDL(g, alpha, N , orderOfN)
    subOrder = (orderOfN);
    function [x_i, e1, e2] = F(x, a, b) 
        x_i=x;e1=a;e2=b;
        % Returns set of parameters for x random walk
        % x - current "main" value considered
        % a, b - current value of a and b in g^a*alpha^b = x
        if mod(x,3) == 1
            x_i = mod(alpha * x, N);    
            e2 = mod(b+1, subOrder);            
        elseif mod(x, 3) == 0
            x_i = mod(x * x, N);
            e1 = mod(a * 2, subOrder);
            e2 = mod(b * 2, subOrder);
        elseif mod(x, 3) == 2
            x_i = mod(x * g, N);
            e1 = mod(a + 1, subOrder);
        end
    end

    function initVals(order1, order2)
        aI = max(1, min(subOrder - 1, order1));  bI = max(1, min(subOrder - 1, order2)); 
        xI = mod(modularExponentiation(g,aI,N) * modularExponentiation(alpha,bI,N),N);
        aJ = aI; bJ = bI; xJ = xI;
    end

    function initRandVals()
        aI = mod(floor(rand(1)*N), N-1) + 1;  bI = mod(floor(rand(1)*N), N-1) + 1; 
        xI = mod(modularExponentiation(g,aI,N) * modularExponentiation(alpha,bI,N),N);
        aJ = aI; bJ = bI; xJ = xI;
    end
    initVals(0, 0);
    aI = 0; bI = 0; xI = 1;
    aJ = aI; bJ = bI; xJ = xI;
    
    while 1
        [xI, aI, bI] = F(xI, aI, bI);
        % Make two steps
        [xJ, aJ, bJ] = F(xJ, aJ, bJ);
        [xJ, aJ, bJ] = F(xJ, aJ, bJ);
        
        if xI == xJ
            if bI == bJ
                % Reinitialize variables
                initRandVals();
                %initVals(mod(floor(rand() * subOrder), subOrder),mod(floor(rand() * subOrder), subOrder));
            else
                r = mod(bI - bJ, subOrder);
                
                inverse = findInverse(r, subOrder);               
                if inverse == -1
                   initRandVals();
                   continue;
                end
                ret = mod(inverse * (aJ - aI), subOrder);
                
                if ret == 0
                    initRandVals();
                    continue;
                end
                return ;
            end
            
        end
    end
end