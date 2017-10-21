function [xminm, fminm, manyminsm] = scs_bayesopt( fun_ms, x0, ms_lb, ms_ub, fun_bayesopt, EPOCHES)
%% scatter search
ms = MultiStart;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
problem = createOptimProblem('fmincon','x0',x0,'objective',fun_ms,'lb', ms_lb,'ub', ms_ub,'options',opts);
[xminm, fminm, ~, ~, manyminsm] = run(ms, problem, 50);
%% 贝叶斯优化
for epoch = 1 : EPOCHES
    len = size(manyminsm(1).X0, 2);
    if len < 2
        break;
    else
        %% 确定bayesopt拟合的范围
        lb = min(manyminsm(1).X0{1}, manyminsm(1).X0{2});
        ub = max(manyminsm(1).X0{1}, manyminsm(1).X0{2});
        lb_size = size(lb,2);
        vars = optimizableVariable();
        for i = 1:lb_size
            vars(i) = optimizableVariable(strcat('x',num2str(i)), [lb(i),ub(i)]);
        end
        %% 贝叶斯优化
        bayesopt_res = bayesopt(fun_bayesopt, vars);
        %% 重新scatter search
        x_bayesopt = bayesopt_res.XAtMinObjective{1,:};
        ms_lb = min(manyminsm(1).X, x_bayesopt);
        ms_ub = max(manyminsm(1).X, x_bayesopt);
        problem = createOptimProblem('fmincon','x0',ms_lb,'objective',fun_ms,'lb',ms_lb,'ub',ms_ub,'options',opts);
        [xminm, fminm, ~, ~, manyminsm] = run(ms, problem, 50);
    end
end
end