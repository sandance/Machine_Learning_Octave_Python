function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


%J_initial =  1 ./m * (-y' * log(sigmoid(X*theta)) - (1 - y' ) * log(1 - sigmoid(X*theta)));

Prediction = X * theta;
sqrErrors = (Prediction - y) .^ 2;

J_add = lambda * sum (theta(2:length(theta)) .^ 2) / (2*m);

J_initial =  sum(sqrErrors) /( 2 * m) ;

J = J_initial + J_add;

% Gradiant decent 

alpha=1;

grad= (X' * ((X*theta) - y) ) /m;

grad(2:end) = grad(2:end) + lambda *  theta(2:end)  /m;



% =========================================================================

grad = grad(:);

end