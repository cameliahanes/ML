% the dataset can be replaced, I've generated random 2D points
x = randn(1,30)*100;
y = randn(1,30)*100;

hold on
scatter(x,y);
% make sure they are column vectors
x = x(:);
y = y(:);

A = [x ones(size(x))];
c = (A'*A)\(A'*y);
R2 = 0;
if R2
    r = y - A*c;
    R2 = 1 - (norm(r)/norm(y - mean(y)))^2;
end

xfit = linspace(min(x), max(x));
yfit = c(1) * xfit + c(2);
plot(x, y, 'o', xfit, yfit, '-');
hold off;
