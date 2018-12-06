function [X y m n] = setData( dataSet )
% SETDATA grabs the raw data matrix and parses out X and y data in 
% relevant format for later algorithm use 

X = dataSet(:,1:1:end-1);
y = dataSet(:,end);

[m n] = size(X);

X = [ones(m,1) X];


end

