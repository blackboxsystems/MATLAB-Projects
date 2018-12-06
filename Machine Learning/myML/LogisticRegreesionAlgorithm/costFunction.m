function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
grad = zeros(size(theta));

% =============================================================

z = theta'*X';
g = sigmoid(z);
hx = g';
Cost = sum(-y.*log(hx)-(1-y).*log(1-hx));
J = (1/m).*Cost;

grad = (1/m).*(X'*(hx-y));


% =============================================================

end
