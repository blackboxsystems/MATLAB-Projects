%% Problem 1 


% If we list all the natural numbers below 10 that are multiples of 3 or 5, 
% we get 3, 5, 6 and 9. The sum of these multiples is 23.
% 
% Find the sum of all the multiples of 3 or 5 below 1000.


%% Steps for implementation 


myNum = 10;
multiples = []; % vector to store factors of number

for i = 1:myNum-1 % less than 1000
    if (mod(i,3) == 0) || (mod(i,5) == 0) % check if multiple of 3 or 5
       multiples = [multiples i]; % vector to store local factors of number
    end
end
multiples;

N_mults = length(multiples);
sumMults = sum(multiples);

sumMults = calcMultiples(1000)