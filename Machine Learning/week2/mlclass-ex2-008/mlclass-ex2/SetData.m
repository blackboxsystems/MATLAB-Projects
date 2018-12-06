function [ X,y,theta ] = SetData( X,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[mx nx] = size(X); 
[my ny] = size(y);

% Orient Matrices Correctly
if nx>mx 
    X = reshape(X,nx,mx);
    [mx nx] = size(X); 
end 
 

if ny>my 
    y = reshape(y,ny,my); 
    [my ny] = size(y); 
end 


%% Add ones column to X data 

X = [ones(size(X,1),1) X];
[mx nx] = size(X);
X = X';
% Create theta vector 

theta = ones(nx,1);

end

