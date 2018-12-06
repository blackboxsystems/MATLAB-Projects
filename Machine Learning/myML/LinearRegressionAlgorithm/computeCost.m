function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

m = length(y); % number of training examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


% initialize some values
hx = X*theta;
J = sum((hx(:,1)-y(:,1)).^2)/(2*m);

%% OR

% hx = theta(1,1)+theta(2,1).*X(:,2); % hypothesis function
% Cost = zeros(1,m);  
% for i = 1:m
%     Cost(i) = (hx(i)-y(i)).^2;
% end 
%     J = sum(Cost)/(2*m);


% =========================================================================

end
