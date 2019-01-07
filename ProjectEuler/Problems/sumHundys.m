function [ Hinstance,someH,count ] = sumHundys( singles,ihundys,hundys )
%This function sums the instances of counting through in the hundreds where
% the instance is: one hundred,two hundred,three hundred ....

summer = 0;
count = 0;
for i = 1:length(singles)
    count = count + 1;  % should disply 9 times
    summer = summer + (ihundys(1,1)+singles(1,i));
end

Hinstance = summer;

%% non instance numbers 
% one hundred and,two hundered and, three hundred and .....

someH = 0; 
count = count; % pass count along from above
for j = 1:length(singles)
    for i = 1:99
        count = count + 1;
        someH = someH + singles(1,j); 
    end 
end
        
someH
        
    




end

