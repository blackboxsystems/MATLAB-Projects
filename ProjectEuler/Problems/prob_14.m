%% Problem 14 
% 
% The following iterative sequence is defined for the set of positive integers:
% 
% n ? n/2 (n is even)
% n ? 3n + 1 (n is odd)
% 
% Using the rule above and starting with 13, we generate the following sequence:
% 
% 13 ? 40 ? 20 ? 10 ? 5 ? 16 ? 8 ? 4 ? 2 ? 1
% It can be seen that this sequence (starting at 13 and finishing at 1) 
% contains 10 terms. Although it has not been proved yet (Collatz Problem), 
% it is thought that all starting numbers finish at 1.
% 
% Which starting number, under one million, produces the longest chain?
% 
% NOTE: Once the chain starts the terms are allowed to go above one million.


%% Implementations

limit = 1e6-1;
chainLength = 0;
inum = 0;
tic
for n = 2:1:limit
    count = 0;
    inum = n;
    keyVal = 2;

while keyVal ~= 1
    count = count + 1; 
    
    if mod(n,2) == 0 
        n = n/2; 
    else
        n = 3*n+1;
    end 
    keyVal = n;   
end
    if count > chainLength 
        chainLength = count;
        chainNum = inum;
    end
    
end

toc
%% Answer 

chainLength 
chainNum
    

