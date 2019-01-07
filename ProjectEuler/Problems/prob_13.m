%% Problem 13 
% 
% Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
% 

%% Implementation 

% possible but will not be able to view digits past 16 digits 

% read from text, seperate rows as different values and sum 
clear all;clc; 

data = importdata('LargeSump12.txt');

[X Y] = size(data)

mySum = 0;

for i = 1:X 
    mySum = mySum + data(i,1);
end

format longeng
    
mySum
% OR 
myAnsSum = sum(data)
    
    
    