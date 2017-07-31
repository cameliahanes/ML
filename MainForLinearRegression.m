% read training data

data = load('examples.txt');
%initialize the matrices and variables

X = data(:,1); %feature matrix
y = data(:,2);  %esults matrix
m = length(y);  %number of training examples
theta  = zeros(2, 1);
iterations  =1500;  %iterations needed for gradient descent
alpha  = 0.01;  %learning rate
plot(X, y, 'rx', 'MarkerSize', 10);
title('training examples');
xlabel('Population in 10.000')
ylabel('Profit in $10.000');

% comppute the cost function
% adding ones column to X
X = [ones(m, 1), data(:,1)];
J = ComputeCost(X, y, theta);

%running gradient descent
[theta, J_history] = GradientDescent(X, y, theta, alpha, iterations);
%plotting linear regression line
hold on;
plot(X(:,2), X * theta, '-');
legend('Trainng Data', 'Linear Regresson');
hold off;
