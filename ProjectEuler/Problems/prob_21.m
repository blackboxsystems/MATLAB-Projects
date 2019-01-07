%% Problem 20 


% Let d(n) be defined as the sum of proper divisors of n 
% (numbers less than n which divide evenly into n).
% If d(a) = b and d(b) = a, where a ? b, then a and b are an amicable 
% pair and each of a and b are called amicable numbers.
% 
% For example, the proper divisors of 
% 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
% therefore d(220) = 284. 
% The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
% 
% Evaluate the sum of all the amicable numbers under 10000.


%% Implementation 
clear all;close all;clc;
% Get factors for all numbers and store for evaluation 


N = 10000;
mySums = zeros(1,N);
count = 0; 
Fvec = []; % vector to store number of factors for each number

for j = 1:N 
   count = count + 1; % count up one number
   Facs = []; % vector to store local factors of number
for i = 1:count-1
    if mod(count,i) == 0 % check divisible numbers
    Facs = [Facs i]; % store factors
    end
end 
mySums(j) = sum(Facs);

end 

% get rid of primes since they are not amicable numbers
tempVal = mySums>1;
mySums = tempVal.*mySums;

% Delete all sum of factors greater than 10000

tempVal = mySums<N; 
mySums = tempVal.*mySums; 


%% Need to search through mySums and check positions within vector for 
% amicable number 

Namics = [];

for i = 1:N 
    
    tempVal = mySums(1,i); 
    if tempVal == 0 
        checkVal = 1; 
    else
    checkVal = mySums(1,tempVal); 
    end 
    
    if i == checkVal
        Namics = [Namics;[tempVal checkVal]]; 
    end 
end 
    
tempAmic = Namics(2:1:end,1) ~= Namics(2:1:end,2);
Namics = Namics(2:1:end,:)

myAns = [];
for i = 1:length(tempAmic) 
    if tempAmic(i,1) ~= 0 
        myAns = [myAns Namics(i,1)];
    end 
end

% Answer
myAns = sum(myAns)
    
