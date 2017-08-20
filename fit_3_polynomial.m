clear;
clc;

x = (1:200);
y = rand(1, 200)*100;
x = x(:);
y = y(:);
% the coefficient matrix of the overdetermined system is
A = [ x.^3 x.^2 x ones(size(x)) ];

%the coefficient matrix for the normal equation is
B = A' * A;

% the right-hand side vector for the normal equation is
rhs = A'* y;

% solve the normal equation
c = ( A'* A ) \ ( A'* y );

xfit = linspace(min(x), max(x));
yfit = c(1) * xfit.^3 + c(2) * xfit.^2 + c(3)*xfit + c(4);
plot(x, y, 'o', xfit, yfit, '-');
