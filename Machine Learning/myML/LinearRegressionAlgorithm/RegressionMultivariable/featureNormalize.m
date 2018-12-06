function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.


X_norm = X;
Nfeatures = size(X,2);
mu = zeros(1, Nfeatures);
sigma = zeros(1, Nfeatures);

maxVal = max(X_norm);
minVal = min(X_norm);
sig = maxVal-minVal

mu = mean(X(:,1:end));
sigma = std(X(:,1:end))


for i = 1:Nfeatures   
X_norm(:,i) = (X(:,i)-mu(i))./sigma(i);
end


end
