%% Problem 7 

% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
% we can see that the 6th prime is 13.
% 
% What is the 10 001st prime number?


%% Implementation

% key value we want 
keyval = 6;

% give initial range
mynums = 1:1e6; 

myPrimes = isprime(mynums);

Nprimes = 0; 
count = 0;
while Nprimes ~= keyval 
    count = count + 1;
    
    if myPrimes(count) == 1 
        Nprimes = Nprimes + 1; 
            if Nprimes == keyval
            mykeynum = mynums(count);
            end
    end
end 
    
mykeynum
    