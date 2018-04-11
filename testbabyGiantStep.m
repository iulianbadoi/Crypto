%program for testing whether implementation yelds correct results
%generator = 7;
generator = 5;
N = 383;
%N = 499; % Strong prime here 
TESTS = 1000; % # of cases to test on
% Check if is generator
table = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
for i=1:N-1
   table(modularExponentiation(generator,i,N))=i;
end

if table.Count < N - 1
   fprintf('"generator" is not generator!\n'); 
   return;
end

for i=1:TESTS
    execTimeNaive = 0; % execution time of naive procedure 
    execTimeBGS   = 0; % execution time using BGS
    execTimePRDL =  0; % execution time using Pollard's rho algorithm
    
    randVal   = floor(rand() * N);
    fprintf('Testing on %d \n', randVal);
    publicKey = modularExponentiation(generator,randVal,N);
    
    tic;
    ansNaive  = discreteLogNaive(generator,publicKey,N);
    execTimeNaive = toc;
    
    tic;
    ansBGS    = babyGiantStep(generator,publicKey,N);
    execTimeBGS = toc;
    
    if ansNaive ~= ansBGS || ansNaive ~= randVal
       fprintf('Answers differ! %d vs %d vs %d \n', ansNaive, ansBGS);
       break;
    else
       fprintf('OK! x = %d, execution time: %d vs %d vs %d  \n', ansNaive, execTimeNaive, execTimeBGS); 
    end
end