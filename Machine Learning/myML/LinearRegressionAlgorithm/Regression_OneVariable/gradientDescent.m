function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
[m Nfeatures] = size(X);
J_history = zeros(num_iters, 1);


t0 = theta(1,1);t1 = theta(2,1);
hx = X*theta;

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 

J = sum((hx-y).^2)/(2*m);

temp0 = t0-(alpha/m)*sum(hx-y);
temp1 = t1-(alpha/m)*sum((hx-y).*X(:,2));
t0 = temp0;
t1 = temp1;
hx = t0+t1.*X(:,2);
theta = [t0;t1];

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end


