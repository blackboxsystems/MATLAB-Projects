
%% Calculate Primes/Factors of message length L
function primeFactors(gvec)
% N is a number you wish to use in order to find all prime factors 
% of every number between 1 & N;

N = length(gvec) 
primeCheck = isprime(gvec);

count = 0; 

%   pNums = []; % vector to store primes contained in vector
% for i = 1:N 
%     if (primeCheck(1,i)) == 1 % check divisible numbers
%         pNums = [pNums gvec(1,i)]; % store factors
%     end
% end 
pNums = primeCheck.*gvec
Nfacs = length(pNums); % calc number of factors for current number 


% Modulus = sum(pNums)
% checkMod = isprime(Modulus)
end
