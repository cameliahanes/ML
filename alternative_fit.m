clc;
clear;
% fit points to c1 / x + c2 * x
% the basis functions are 1 / x und x
% i generate my own data
x = (1:200);
x = x(:);

y = rand(1,200)* 100;
y = y(:);

A = [1./x x];
c = (A'*A)\(A'*y);

xf = x;
yf = A * c;
plot(x, y, 'o', xf, yf, '-');
