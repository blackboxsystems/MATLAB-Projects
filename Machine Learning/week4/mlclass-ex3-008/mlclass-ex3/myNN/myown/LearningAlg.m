%% Employ Learning 

% Network Architecture
Layers = 2;
s1 = 2;
K = 1;
s2 = K;

% initialize thetas randomly
ep = .01;
thetas = rand(s1+1,s2)*(2*ep-ep);
lambda = 1.0;

% initialize values to store 
Jhist = zeros(1,m);
Dt = 0;
% layers of a 
for i = 1:m
% for i = 1
    
    a1 = X(i,:);
    z2 = sum(thetas*a1);
    a2 = sigmoid(z2);
    hx = a2;

% training sample output
yt = y(i,1);


%% Cost Function for Logistic Regression
Cost = sum(-yt.*log(hx)-(1-yt).*log(1-hx));  %  +(lambda/2)*sum(thetas.^2)
J = (1/m).*Cost
Jhist(i) = J;

%% Backpropagation Algorithm

% Deltas (error) function 
dt = a2-yt;

grad = a1*dt';

Dt = Dt + grad;

end

% Derivative of Cost Function
D = zeros(3,1);
D(2:3,1) = (1/m)*Dt+lambda*thetas(2:3,1);
D(1,1) = (1/m)*Dt;
D
% plot(Jhist)



