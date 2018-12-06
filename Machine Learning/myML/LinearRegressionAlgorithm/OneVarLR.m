% One Feature (Variable) Data linear regression 

% power in mW of light used
X = [1 2 3 4 5 6 7 8 9];
y = [1 1.2 2.2 1.3 2.4 1.8 1.9 2.4 3.3];
X = X';
y = y';

% get size of data matrix
[m Nfeatures] = size(X);

% add intercept term to X
X = [ones(m,1) X];
% create thetas vector
theta = zeros(Nfeatures+1,1);

theta_true = pinv(X'*X)*X'*y;

if Nfeatures == 1 % if data contains one variable
    
    J = computeCost(X,y,theta);

    alpha = .01;
    iterations = 1500; 
    [theta,J_history] = gradientDescent(X, y, theta, alpha, iterations);
 % hypothesis line for plotting
    hyp = theta'*X';
    
figure(1)
subplot(2,2,1);
plot(X(:,2:1:end),y,'r.')
hold on 
plot(hyp,'r-');
    
else % if more than one variable
    
   J = computeCostMulti(X,y,theta) 
   alpha = .01; 
   num_iters = 1500;
   [theta,J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);
   
   
figure(1)
subplot(2,2,1);
plot(X(:,2:1:end),y,'r.')
subplot(2,2,2);
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

end 






