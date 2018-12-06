% 2 Layer Neural Network 

Layers = 2;

x1 = [0 1 2 3]; 
m = length(x1); 

X = [ones(m,1) x1'];

[m n]= size(X);
Thetas = zeros(n,Layers-1)



% A = zeros(
