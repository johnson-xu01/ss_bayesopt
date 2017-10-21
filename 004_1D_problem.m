fun = @(x) x.^2 + 4*sin(5*x);
fplot(fun,[-5,5])
xlabel('x','FontSize',25)
ylabel('y','FontSize',25)
title('y=x^{2}+4sin(5x)','FontSize',25)
rng default % For reproducibility
opts = optimoptions(@fmincon,'Algorithm','sqp');
problem = createOptimProblem('fmincon','objective',...
    fun,'x0',3,'lb',-5,'ub',5,'options',opts);
gs = GlobalSearch;
[x,f] = run(gs,problem) % [-0.3080,-3.9032]