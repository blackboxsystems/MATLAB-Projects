function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y


% Initialize some values
[m Nfeatures] = size(X); % number of training samples and features
Cost = zeros(1,m);
hx = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

hx = X*theta;

for j = 1:m
Cost(1,j) = (hx(j,1)-y(j)).^2;
end

J = sum(Cost)/(2*m);


% =========================================================================

end
