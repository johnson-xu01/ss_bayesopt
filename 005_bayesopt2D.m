% ±¥“∂Àπ”≈ªØ
var1 = optimizableVariable('vx',[-5,5]);
var2 = optimizableVariable('vy',[-5,5]);
fun = @(x) my_sixmin(x.vx, x.vy);
results = bayesopt(fun,[var1, var2]);
% x = results.XAtMinObjective.vx  % -0.3082
% y = results.MinObjective % -3.9032
%-0.0899134883433755,-0.625793659204760
%-0.864545155015378

x = results.XAtMinObjective{1,:}; % [-0.0899134883433755,-0.625793659204760]
y = results.MinObjective; % -0.864545155015378