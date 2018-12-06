% getData.m 
clear all;close all;clc;


data = load('Bananas.txt');

% format and parse data 
[X y m n] = setData(data); % get X with intercept, y, and number of features (n)  

% initialize parameters (theta vector)
theta = zeros(n+1,1);


%% compute optimized theta 

optitheta = pinv(X'*X)*X'*y;

%% Iterative method 


% if n == 1 
%     
%     J = computeCost(X,y,theta);
% 
%     alpha = .001;
%     iterations = 1500; 
%     [theta,J_history] = gradientDescent(X, y, theta, alpha, iterations);
%     
%  theta
%     % hypothesis line for plotting
%     hyp = theta'*X'; 


hyp1 = optitheta'*X';
    
Xplot = X(:,2:1:end);

figure(1)
subplot(2,2,1);
plot(Xplot,y,'r.')
hold on 
plot(Xplot,hyp1,'b-');
xlabel('Whole Fruit weight');
ylabel('Edible Fruit weight');



%% perdict fruit weight 

wholefruit = 213; 

predict = optitheta'*[1;wholefruit];

fprintf('fruit weight is predicted to be around %3.2f\n',round(predict))


