function [X y m n] = setDataMulti( dataSet )
% SETDATA grabs the raw data matrix and parses out X and y data in 
% relevant format for later algorithm use 

Xnorm = dataSet(:,1:1:end-1);
y = dataSet(:,end);

[m n] = size(Xnorm);


[X mu sigma] = featureNormalize(Xnorm);

X = [ones(m,1) X];


end

