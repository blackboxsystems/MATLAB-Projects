%% Problem 23 

% A perfect number is a number for which the sum of its proper divisors 
% is exactly equal to the number. For example, the sum of the proper 
% divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is 
% a perfect number.
% 
% A number n is called deficient if the sum of its proper divisors 
% is less than n and it is called abundant if this sum exceeds n.
% 
% As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
% the smallest number that can be written as the sum of two abundant 
% numbers is 24. By mathematical analysis, it can be shown that all 
% integers greater than 28123 can be written as the sum of two 
% abundant numbers. However, this upper limit cannot be reduced any 
% further by analysis even though it is known that the greatest number 
% that cannot be expressed as the sum of two abundant numbers is less 
% than this limit.
% 
% Find the sum of all the positive integers which cannot be written as 
% the sum of two abundant numbers.



%% Implementation 


% Find factors and sum for each number, check if equal to number 



Nlim = 28123;
count = 0; 
Fvec = []; % vector to store number of factors for each number
deficient = [1];
abundant = [];
perfect = [];

tic;
for j = 1:1:Nlim 
   count = count + 1; % count up one number
   Facs = []; % vector to store local factors of number
for i = 1:count-1
    if mod(count,i) == 0 % check divisible numbers
    Facs = [Facs i]; % store factors
    end
%     if sum(Facs) ~= count
%         perfect = [perfect i];
%     end
end 
 if sum(Facs) < count
        deficient = [deficient i+1];
 elseif sum(Facs) > count 
     abundant = [abundant i+1];
 else 
     perfect = [perfect i+1];
    end
end

elapsedTime = toc

deficient;
abundant;
perfect;

%% Summing through abundant numbers

Nab = length(abundant); 
myints = 0;
NUMS = zeros(1,Nlim);
count  = 0;
for j = 1:Nab
    count  = count + 1;
    timer = count/Nab
    for i = 1:Nab 
        myints = abundant(1,j)+abundant(1,i);
        if myints < Nlim && (NUMS(1,myints) == 0)
        NUMS(1,myints) = myints;
        else 
            break;
        end 
    end 
end 


myans = sum(NUMS)

%%

newNums = [];
for i = 1:length(NUMS); 
    if NUMS(1,i) ~= 0 
        newNums = [newNums NUMS(1,i)];
        
    end
end

%%
numvec = 1:28123;
nonabNums = NUMS./numvec;

nonAB = sum(numvec.*(nonabNums == 0))
        
