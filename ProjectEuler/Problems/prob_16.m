%% Problem 16 

% 215 = 32768 and the sum of its digits is
% 3 + 2 + 7 + 6 + 8 = 26.
% 
% What is the sum of the digits of the number 2^1000?


%% Implementation 

% calculate number, convert to char, seperate values into matrix, 
% sum matrix elements for answer 


%% Implementation for Long Digits 
clear all;close all;clc;

tic
number = sym(2^1000);
n = char(number);

S = 0;

for i = 1:length(n)
    S = S + str2double(n(i));
end

% Answer
fprintf('The answer is %.0d\n',S)

toc


