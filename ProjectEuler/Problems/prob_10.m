%% Problem 10 

% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
% 
% Find the sum of all the primes below two million.


%% Implementation

limit = 200;

% myprimes = primes(limit); 
format long
myAns = sum(primes(limit))