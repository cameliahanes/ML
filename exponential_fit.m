clc;
clear;
x0 = 0.01;
x = linspace(x0, 2, 200);
x = x(:);
noise = 0.05;
y = 5 * x.*exp(-3*x);
y = y + noise * (rand(size(x)) - 0.5);
y = abs(y);
y = y(:);
hold on;

eps = 0.0001;

A = [x ones(size(x))];
z = log(y./x);
c = (A' * A)\(A'* z);

c = [exp(c(2)) c(1)];
c
xfit = linspace(min(x), max(x));
yfit = c(1) * xfit .* exp(c(2) * xfit);


plot(x, y, 'o', xfit, yfit, '-');

hold off;



