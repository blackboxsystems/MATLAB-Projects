%% Problem 4 

% A palindromic number reads the same both ways. 
% The largest palindrome made from the product of 
% two 2-digit numbers is 9009 = 91 × 99.
% 
% Find the largest palindrome made from the product of two 3-digit numbers.


%% Implementation

% insight: a plaindromic number can contain an even or odd number of
% elements.

% first create algorithm to verify that 9009 = 91x99 is largest palindrome
% made by 2 digits. 
clear all;close all;clc;

xvec = 1:999; 
yvec = 1:999; 

checkPal = [];
Palindromes = [];

for i = 1:length(xvec) 
    for j = 1:length(yvec)

        checkPal = num2str(xvec(i)*yvec(j)); 
        N = length(checkPal);
        
        if mod(N,2) == 0; % even number of elements
            pnum = str2num(checkPal);
            firstHalf = checkPal(1,1:N/2);
            secondHalf = fliplr(checkPal(1,(N/2+1):end));
            if firstHalf == secondHalf 
                Palindromes = [Palindromes pnum];
            end 
        else  % odd number of elements
            N = N - 1;
            pnum = str2num(checkPal);
            firstHalf = checkPal(1,1:N/2);
            middleNum = checkPal(1,N/2+1); 
            secondHalf = fliplr(checkPal(1,(N/2+2):end)); 
            if firstHalf == secondHalf 
                Palindromes = [Palindromes pnum];
            end 
        end 
    end 
end

Palindromes 

maxPal = max(Palindromes)
            
            
        
        
        

