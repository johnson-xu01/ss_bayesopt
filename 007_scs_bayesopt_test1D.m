fun_ms = @(x) x.^2 + 4*sin(5*x);
x0 = -5;
ms_lb = -5;
ms_ub = 5;
fun_bayesopt = @(x)fun_ms(x.x1);
EPOCHES = 5;
[xminm, fminm,  manyminsm] = scs_bayesopt( fun_ms, x0, ms_lb, ms_ub, fun_bayesopt, EPOCHES);