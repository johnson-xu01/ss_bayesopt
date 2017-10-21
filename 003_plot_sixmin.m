x1=-3:0.1:3;
x2=-3:0.1:3;
[x,y] = meshgrid(x1, x2);
mesh(x,y,my_sixmin(x,y))
title('sixmin([x,y]) = 4x^{2} - 2.1x^{4} + 0.33x^{6} + xy - 4y^{2} + 4y^{4}','FontSize',25)
xlabel('x','FontSize',25)
ylabel('y','FontSize',25)
zlabel('sixmin','FontSize',25)