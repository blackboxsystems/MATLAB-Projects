%% Problem 22 

% Using names.txt (right click and 'Save Link/Target As...'), 
%     
% a 46K text file containing over five-thousand first names, 
% begin by sorting it into alphabetical order. 
% Then working out the alphabetical value for each name,
% multiply this value by its alphabetical position in the list 
% to obtain a name score.
% 
% For example, when the list is sorted into alphabetical order, 
% COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th
% name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
% 
% What is the total of all the name scores in the file?

%% Implementation

% myNames = dlmread('prob_22_names.txt',',');
% myNames = csvread('prob_22_names.txt');

clear all;close all;clc;

myNames = importdata('prob_22_names.txt',',');

myCharNames = myNames{1}; % Convert to character array

myLargeArray = []; 

tic
count = 0; 
newpos = 1;limit = 46448;
while count < 46448 
    count = count + 1; 
    
    if myCharNames(1,count) == '"' 
        count = count + 1; 
    elseif myCharNames == ',' 
        count = count + 1; 
        newpos = newpos+1;
    end 
    
    myLargeArray(1,count) = myCharNames(1,count); 
end 

elapsedTime = toc
%%
myLargeArray = deblank(char(myLargeArray));
myDoubleArray = double(myLargeArray); 

csvDoubleVec = [];
for i = 1:length(myDoubleArray) 
   if myDoubleArray(1,i) ~= 0 
       csvDoubleVec = [csvDoubleVec myDoubleArray(1,i)];
   end  
    
end

csvDoubleVec; 
newCharArray = char(csvDoubleVec);
% offset double array 
myOffsetVec = csvDoubleVec-64;


%% parse data input and seperate names into array;
% array will carry all names but seperated into columns by starting letter

ABC = {};
newcount = 0;
tic
for j = 1:26 % number of letters for searching
    count = 1;
    while count < length(myOffsetVec)
        if myOffsetVec(1,count) < 1  % check for comma value
            count = count + 1;
            if myOffsetVec(1,count) == j 
                tempName = [];
                while myOffsetVec(1,count) > 0 && count < length(myOffsetVec)
                    tempName = [tempName myOffsetVec(1,count)];
                    count = count + 1; 
                end 
                newcount = newcount+1;
                ABC{newcount,1} = char(tempName+64);
                
            end 
        else
            count  = count + 1;
        end
    end 
end 

%%
myABCs = sort(ABC);
elapsedTime = toc
                    
%% Convert array groups into vector to sort by ascii offset 
     mySummer = 0;
for i = 1:length(myABCs)
my123s = sum(double(myABCs{i,1})-64);
mySummer = mySummer + i*my123s;
end

myABCs;

format short
myAns = mySummer

% CHECK SCRIPT
% check_p22; 





