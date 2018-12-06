function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
[m Nfeatures] = size(X);
J_history = zeros(num_iters, 1);

Cost = zeros(Nfeatures,1); % Cost function portion vector

for iter = 1:num_iters

hx = X*theta;

    for i = 1:Nfeatures
        Cost(i,1) = (hx(i,1)-y(i)).^2;
    end
    J = sum(Cost)/(2*m);


tempv = zeros(Nfeatures,1);
for ii = 1:Nfeatures 
    tempv(ii,1) = (alpha/m)*(sum(sum((hx-y).*X(:,ii))));
end 
tempv;

theta = theta-tempv;
hx = X*theta;

   
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
