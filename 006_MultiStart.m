ms = MultiStart;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
fun_ms = @(x) x.^2 + 4*sin(5*x);
problem = createOptimProblem('fmincon','x0',-5,'objective',fun_ms,'lb',-5,'ub',5,'options',opts);
[xminm,fminm,flagm,outptm,manyminsm] = run(ms,problem,50);
%%
%贝叶斯优化
fun_bayesopt = @(x) x.vx.^2 + 4*sin(5*x.vx);
EPOCHES = 5;
%%
%确定bayesopt拟合的范围
for epoch = 1 : EPOCHES
    len = size(manyminsm(1).X0,2);
    if len < 2
        break;
    else
        lb = min(manyminsm(1).X0{1}, manyminsm(1).X0{2});
        ub = max(manyminsm(1).X0{1}, manyminsm(1).X0{2});
        var = optimizableVariable('vx',[lb,ub]);
        bayesopt_res = bayesopt(fun_bayesopt,var);
        x_bayesopt = bayesopt_res.XAtMinObjective.vx;  % -0.3082
        ms_lb = min(manyminsm(1).X, x_bayesopt);
        ms_ub = max(manyminsm(1).X, x_bayesopt);
        problem = createOptimProblem('fmincon','x0',ms_lb,'objective',fun_ms,'lb',ms_lb,'ub',ms_ub,'options',opts);
        [xminm,fminm,flagm,outptm,manyminsm] = run(ms,problem,50);
    end
end
xminm
fminm
