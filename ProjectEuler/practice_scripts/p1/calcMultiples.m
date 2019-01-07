
%% Calculate Primes/Factors of message length L
function [sumMults] = calcMultiples(myNum)
% N is a number where all factors of N are searched

% myNum = 1000;
multiples = []; % vector to store factors of number

for i = 1:myNum-1 
    if (mod(i,3) == 0) || (mod(i,5) == 0) % check if multiple of 3 or 5
       multiples = [multiples i]; % vector to store local factors of number
    end
end
multiples;

N_mults = length(multiples);
sumMults = sum(multiples);

end 
% Fvec
