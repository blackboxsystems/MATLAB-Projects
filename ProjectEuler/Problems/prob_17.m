%% Problem 17 

% If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
% then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
% 
% If all the numbers from 1 to 1000 (one thousand) inclusive were written
% out in words, how many letters would be used?


%% Implementation 
clear all;clc;

singleDigits = {'one';'two';'three';'four';'five';'six';'seven';...
                'eight';'nine'}; 
            
doubleDigits = {'ten';'eleven';'twelve';'thirteen';'fourteen';'fifteen';...
                'sixteen';'seventeen';'eighteen';'nineteen';'twenty'};

            
LeadingDigits = {'twenty';'thirty';'forty';'fifty';'sixty';'seventy';...
            'eighty';'ninety'};
        
hundreds = 'hundred';
adder = 'and'

singles = [3 3 5 4 4 3 5 5 4]; % 1-9 
doubles = [3 6 6 8 8 7 7 9 8 8]; % 10-19
leading = [6 6 5 5 5 7 6 6]; % 20-90
ihundys = [7]; % 'hundred'
hundys = [10]; % 'hundred and'

sum(leading)
% summer = sum(singles)+sum(doubles)

[startSum,allInst,count_base] = baseNums(singles,doubles,leading); 

[Hinstance,someH,count_H] = sumHundys(singles,ihundys);

counter = count_base+count_H

inclusiveBASE = allInst
inclusiveHundys = someH+Hinstance

% Lastly, One Thousand 

oneT = 11; 

AllSUM = inclusiveBASE+inclusiveHundys+oneT










