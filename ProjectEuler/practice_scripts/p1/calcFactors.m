
%% Calculate Primes/Factors of message length L
function calcFactors(myNum)
% N is a number where all factors of N are searched

myNum = 5;
Facs = []; % vector to store factors of number

for i = 1:myNum 
    if mod(myNum,i) == 0 % check divisible numbers
   Facs = [Facs i]; % vector to store local factors of number

    end
Facs

% Nfacs = length(Facs); % calc number of factors for current number 

% Fvec = [Fvec Nfacs];
end 
% Fvec
