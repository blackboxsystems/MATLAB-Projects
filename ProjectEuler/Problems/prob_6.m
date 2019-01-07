%% Problem 6 

% The sum of the squares of the first ten natural numbers is,
% 
% 12 + 22 + ... + 102 = 385
% The square of the sum of the first ten natural numbers is,
% 
% (1 + 2 + ... + 10)2 = 552 = 3025
% Hence the difference between the sum of the squares of the first 
%ten natural numbers and the square of the sum is 3025 ? 385 = 2640.
% 
% Find the difference between the sum of the squares of the 
%first one hundred natural numbers and the square of the sum.


%% Implementation 


nums = 1:100; 

s1 = sum(nums)^2;
s2 = sum(nums.^2);

sdiff = s1-s2



