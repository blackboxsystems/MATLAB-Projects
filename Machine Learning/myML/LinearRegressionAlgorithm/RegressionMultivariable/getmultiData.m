% getmultiData.m 
clear all;close all;clc;

% load data
data = load('ex1data2.txt');

% format and parse data 
[X y m n] = setDataMulti(data);   

% initialize parameters (theta vector)
theta = zeros(n+1,1);


%% Iterative method 

    alpha = .01;
    iterations = 400; 
    [theta,J_history] = gradientDescentMulti(X, y, theta, alpha, iterations);
    
    % hypothesis line for plotting
    hyp = theta'*X';
   
    
% theta from normal equation
optitheta = normalEqn(Xnorm, y)
hyp1 = optitheta'*X';

%%  PLOT 
figure(2)
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');









