clc;
clear;
data = load('data_3d.txt');

x_points = data(:,1);
y_points = data(:,2);
z_points = data(:,3);

scatter3(x_points, y_points, z_points);
axis equal;

EPS = 0.0001;

new_a = mean(x_points);
new_b = mean(y_points);
new_c = mean(z_points);
new_r = 1;
param_a = new_a;
param_b = new_b;
param_c = new_c;
param_r = new_r;
flag = true;

while flag 
    param_a = new_a;
    param_b = new_b;
    param_c = new_c;
% jacobian
   syms x y z a b c r
   J = jacobian(sqrt(( x - a )^2 + (y - b)^2 + (z - c)^2) - r, [a b c r]);
   J = subs(J, [a b c r], [param_a param_b param_c param_r]);
   Jf = function_handle(J);
   Jacobian = arrayfun(Jf, x_points, y_points, z_points, 'UniformOutput', 0);
   Jacobian = cell2mat(Jacobian);

% residuals
  syms x y z
  f = sqrt((x - param_a)^2 + (y - param_b)^2 + (z - param_c)^2) - param_r;
  fh = function_handle(f);
  F = arrayfun(fh, x_points, y_points, z_points, 'UniformOutput', 0);
  F = cell2mat(F);

  res = (Jacobian'* Jacobian) \ (Jacobian' * F);

  % solve 
  new_a = param_a - res(1,1);
  new_b = param_b - res(2,1);
  new_c = param_c - res(3,1);
  new_r = param_r - res(4,1);

  difference = (new_a - param_a)^2 + (new_b - param_b)^2 + (new_c - param_c)^2 + (new_r - param_r) ^2;
  if difference > EPS 
    flag = true;
  else 
    flag = false;
  end 
end 


[ x, y, z ] = sphere(40);
hold on;
surf( new_r * x + new_a, new_r * y + new_b , new_r * z + new_c );
parameters = [new_a new_b new_c new_r]
