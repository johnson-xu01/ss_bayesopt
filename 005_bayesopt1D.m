% ±¥“∂Àπ”≈ªØ
var = optimizableVariable('vx',[-5,5]);
fun = @(x) x.vx.^2 + 4*sin(5*x.vx);
results = bayesopt(fun,var)
x = results.XAtMinObjective.vx  % -0.3082
y = results.MinObjective % -3.9032