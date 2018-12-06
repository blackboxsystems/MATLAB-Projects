function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
[m n] = size(X);
m = length(y);

ypos = y>0;
yneg = y<1;

Xpos = [];
Xneg = [];
for i = 1:m 
    if ypos(i) == 1 
        Xpos = [Xpos [X(i,1);X(i,2)]];
    else 
        Xneg = [Xneg [X(i,1);X(i,2)]];
    end 
end 

figure(1)
plot(Xpos(1,:),Xpos(2,:),'b+')
hold on; 
plot(Xneg(1,:),Xneg(2,:),'ro')
hold off;

% =========================================================================


end
