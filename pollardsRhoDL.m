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
            e2 = mod(b, subOrder);
        end
    end

    function initVals(order)
        aI = max(1, min(subOrder - 1, order));  bI = max(1, min(subOrder - 1, order)); 
        xI = mod(modularExponentiation(g,aI,subOrder) * modularExponentiation(alpha,bI, subOrder),subOrder);
        aJ = aI; bJ = bI; xJ = xI;
    end
    initVals(1);
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
                fprintf('reinitializing!\n');
                initVals(mod(floor(rand() * N), N));
            else
                r = mod(bI - bJ, subOrder);
                
                fprintf('found diff - %d \n' , r);
                
                ret = mod(findInverse(r, subOrder) * (aJ - aI), subOrder);
                
                fprintf('found ans - %d \n' , ret);
                
                %ret = mod(inverse * (aJ - aI), N);
               
                if ret == 0
                    initVals(mod(floor(rand() * N), N));
                    fprintf('Ans nerastas!\n');
                    return;
                end
                %fprintf('radau ans!\n');
                return ;
            end
        end
    end
end