function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

Theta1_grad = 0;
Theta2_grad = 0;


% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%%
% activation values and hypothesis
X = [ones(m,1) X];
a1 = X; 

z2 = Theta1*a1';
z2 = z2'; % transpose
a2 = sigmoid(z2);[a b] = size(a2); % sigmoid 
a2 = [ones(a,1) a2]; % add bias unit

z3 = Theta2*a2';
z3 = z3';
a3 = sigmoid(z3); %[5000x10]

hx = a3; %[5000x10]

%% Cost
Jvec = zeros(1,num_labels);

for i = 1:num_labels
    Cost = sum(-y.*log(hx(:,i))-(1-y).*log(1-hx(:,i)))+...
        (lambda/2)*(sum(sum(Theta1(:,2:1:end).^2))+sum(sum(Theta2(:,2:1:end).^2)));
    J = (1/m).*Cost;
    Jvec(i) = J;
end

J = sum(Jvec);

%%
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.


%% Backpropagation 

% expand output values to matrix
ymat = eye(num_labels);
ymat = ymat(y,:);


d3 = a3-ymat;

d2 = Theta2(:,2:1:end)'*d3'; %.*(a2*(1-a2))
d2 = d2';
size(a1);
size(d2);
Theta2_grad = Theta2_grad + (1/m)*a2'*d3;
Theta1_grad = Theta1_grad + (1/m)*a1'*d2;



%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end