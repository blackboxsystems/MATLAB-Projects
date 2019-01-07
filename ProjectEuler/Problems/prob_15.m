%% Problem 15 

% Starting in the top left corner of a 2×2 grid, and only being able to
% move to the right and down, there are exactly 6 routes to the bottom 
% right corner.
% 
% 
% How many such routes are there through a 20×20 grid?

%% Implementation

% found algorithm for calculating the total number of paths in mxm matrix 

n = 20;

format longeng 
Fans = factorial(2*n)/(factorial(n)*factorial(n));

format long


% for an mxn matrix the formula is 
% fans = factorial(m+n)/(factorial(m)*factorial(n)