function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples

% pass training set to theta parameters
z = theta'*X';
p = sigmoid(z);

% ring true(1) for above .5 and false(0) for anything lower
p = p>.5;


end
