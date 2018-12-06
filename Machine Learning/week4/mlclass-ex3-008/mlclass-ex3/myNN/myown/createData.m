%% Create spread of data for classification 
clear all;close all;clc; 

N = 50;

% positive values (1)
xA = randi([50 100],N,1);
yA = randi([50 100],N,1); 

% negative values (0)
xB = randi(50,N,1); 
yB = randi(50,N,1); 

% set data matrix
X = [xA yA;xB yB];
m = length(X);

% input data
x0 = ones(m,1);
x1 = X(1:m,1);
x2 = X(1:m,2);

X = [x0 x1 x2];

% output data
y = [ones(N,1);zeros(N,1)];


figure(1) 
plot(xA,yA,'b+') 
hold on 
plot(xB,yB,'r.')
hold off



