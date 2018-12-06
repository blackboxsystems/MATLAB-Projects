%% XOR>AND Neural Network



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
% Thetas = zeros(n,n);
Thetas = [-30 20 20;10 -20 -10;-10 20 20]';
Dij = 0; 

% hidden layer
A = zeros(n,Layers-2)



%% Compute parameters
% first hidden layer parameters
ij = 3;
a10 = 1;
a11 = sigmoid((Thetas(:,1)'*X(:,ij)))
a12 = sigmoid((Thetas(:,2)'*X(:,ij)))

A(:,1) = [a10;a11;a12];

% output layer
a21 = sigmoid(Thetas(:,3)'*A);
hx = round(a21)




