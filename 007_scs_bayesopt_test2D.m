fun_ms = @(x)my_sixmin(x(1), x(2));
x0 = [-1,2];
ms_lb = [-3,-3];
ms_ub = [3, 3];
fun_bayesopt = @(x)my_sixmin(x.x1, x.x2);
EPOCHES = 5;
[xminm, fminm,  manyminsm] = scs_bayesopt( fun_ms, x0, ms_lb, ms_ub, fun_bayesopt, EPOCHES);
% [-0.0895477652595935,0.712452992790077]
% -1.03162783704003