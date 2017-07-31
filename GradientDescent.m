function [theta, J_history] = GradientDescent (X, y, theta, alpha, iterations)
%prepare variables
m = length(y);
J_history = zeros(iterations, 1);

  for i = 1 : iterations,
    h = X * theta;
    t1 = theta(1) - (alpha * (1/m) * sum (h - y));
    t2 = theta(2) - (alpha * (1/m) * sum((h-y).*X(:,2)));
    theta(1) = t1;
    theta(2) = t2;
    J_history(i)  =ComputeCost(X, y, theta);
  end

endfunction
