%% Problem 5 

% 2520 is the smallest number that can be divided by each of the numbers 
% from 1 to 10 without any remainder.
% 
% What is the smallest positive number that is evenly divisible 
% by all of the numbers from 1 to 20?


%% Implementation


divs = 1:20; % our divisors 

% we know that 2520 is the smallest number for 1:10 division 
% so we can start from this number

myrems = 1;
count = 2520;

while sum(myrems) > 0 
    count = count + 1; 
    
    myrems = mod(count,divs); 
    checker = sum(myrems); 
    
    if checker == 0 
        myNum = count; 
    end 
end 

myNum
    

%% Answer 
% this took a bit to compute so here's the answer
% myNum =
% 
%    232792560

