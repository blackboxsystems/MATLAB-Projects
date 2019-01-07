%% Problem 20



% n! means n × (n ? 1) × ... × 3 × 2 × 1
% 
% For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
% and the sum of the digits in the number 10! 
% is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
% 
% Find the sum of the digits in the number 100!

%% Implementation for Long Digits 
clear all;close all;clc;

tic
x = factorial(100);
number = sym(x);
n = char(number);

S = 0;

for i = 1:length(n)
    num = str2double(n(i));
    if num == 0
        disp('zeros found')
    end
    S = S + str2double(n(i));
end

% Answer
fprintf('The answer is %.0d\n',S)

toc
