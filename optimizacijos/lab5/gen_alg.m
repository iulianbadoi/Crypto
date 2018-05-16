ObjectiveFunction = @fx;
nvars = 2;    % Number of variables
LB = [-6 -6];   % Lower bound
UB = [6 6];  % Upper bound
[x,fval] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB)


ObjectiveFunction = @fx;
nvars = 2;    % Number of variables
LB = [0 0];   % Lower bound
UB = [1 13];  % Upper bound
x0 = [5,5];
options = optimoptions(@simulannealbnd,'InitialTemperature',[50 50]);
[x,fval,exitFlag,output] = simulannealbnd(ObjectiveFunction,x0,LB,UB,options);


nvars = 2;
options = optimoptions('particleswarm','SwarmSize',3000, 'InertiaRange', [0.9, 1]);
[x,fval,exitFlag,output]= particleswarm(ObjectiveFunction,nvars, LB, UB)

asd = 54;