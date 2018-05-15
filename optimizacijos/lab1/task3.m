x0 = [-1,1];
options = optimset('LargeScale','off');
[x, fval,exitflag,output] = fminunc(@fun2, x0, options)
