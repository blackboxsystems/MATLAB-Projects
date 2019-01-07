function [ addedSum,allInst,count ] = baseNums( singles,doubles,leading )
%This functiod adds the initial base sums of a number starting from 1, then
%added each 100 position for 9 times; 


% add numbers from 1-20 for base of each set of 100 numbers and starting 
startSingles = sum(singles);
startNums = sum(singles)+sum(doubles)

% sum letters from 21-99 by tagging on singles to leading base ten number
summer = 0;
instance = 0; % instance of a leading number (twenty,thirty,forty...) w/o
              % reference to its single companion.
count = 20;
for i = 1:length(leading); 
    count = count + 1;
    instance = instance+leading(1,i);
    for j = 1:length(singles); 
        count = count + 1;
        summer = summer + (leading(1,i)+singles(1,j));
    end 
end 
instance 
summer
addedSum = 10*(startNums) + summer + instance
             
allInst = 10*addedSum




end

