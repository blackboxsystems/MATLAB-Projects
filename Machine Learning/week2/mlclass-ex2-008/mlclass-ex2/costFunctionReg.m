function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% Computing Cost Function for Logistic Regression
z = theta'*X';
g = sigmoid(z);
hx = g';
Cost = sum(-y.*log(hx)-(1-y).*log(1-hx))+(lambda/2)*sum(theta(2:1:end,1).^2);
J = (1/m).*Cost;

% Gradient Descent for Logistic Regression
grad = (1/m).*(X'*(hx-y))+(lambda/m)*theta;
grad(1,1) = (1/m).*(X(:,1)'*(hx-y));
grad;

% =============================================================

end
