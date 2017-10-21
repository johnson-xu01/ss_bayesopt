possColors = 'kbgcrm';
sixmin = @(x)(4*x(:,1).^2 - 2.1*x(:,1).^4 + x(:,1).^6/3 ...
    + x(:,1).*x(:,2) - 4*x(:,2).^2 + 4*x(:,2).^4);
f = @(x,y)sixmin([x,y]); % vectorized objective fcn
ezcontour(f,[-2 2 -1.1 1.1])
hold on
for i = 1:size(manyminsm,2)
    cIdx = rem(i-1, length(possColors)) + 1;
    color = possColors(cIdx);
    plot(manyminsm(i).X(1),manyminsm(i).X(2),'*','Color',...
        color,'MarkerSize',25); % plot center of basin with *
end
xlabel('x','FontSize',25)
ylabel('y','FontSize',25)
title('sixmin([x,y])','FontSize',25)
hold off