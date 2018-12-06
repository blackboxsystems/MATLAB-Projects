%% Neural Network Forward and Backpropagation 

Layers = 3;

% input data
x1 = [0 1 0 1]; 
x2 = [0 1 1 0];

X = [x1;x2];
X = X'; 

m = length(X);% number of training samples

% add intercept term
X = [ones(m,1) X]'

%% 
[n m] = size(X);

% initialize parameters
Thetas = zeros(n,Layers-1)
Dij = 0; 

% hidden layer
A = zeros(n,Layers-2)

%% Compute parameters
% first hidden layer parameters
a10 = 1;
a11 = sigmoid((Thetas(:,1)'*X(:,3)))
a12 = sigmoid((Thetas(:,1)'*X(:,3)))

A(:,1) = [a10;a11;a12];

% output layer
a21 = sigmoid(Thetas(:,2)'*A)
hx = a21; 




