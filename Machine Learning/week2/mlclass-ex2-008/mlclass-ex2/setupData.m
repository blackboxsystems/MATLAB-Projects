%% Set up Data 

% 2 features in X 
x1 = [1 2 3 4 5 8 10 67];
x2 = [1 2 3 4 5 56 34 90]; 
X = [x1;x2];
X = X';

 y =[0 1 1 0 1 0 1 1];
 y = y';

%% Set Data and get hx Transpose 

[X,y,theta] = SetData(X,y)

% Transpose function
hx = theta'*X;
hx = hx';

%%

g = sigmoid(hx)

plot(g)