%% Problem 19

% You are given the following information, but you may prefer to do some 
% research for yourself.
% 
% 1 Jan 1900 was a Monday.
% A leap year occurs on any year evenly divisible by 4, but not on a 
% century unless it is divisible by 400.
% How many Sundays fell on the first of the month during the twentieth 
% century (1 Jan 1901 to 31 Dec 2000)?

%% 
clc;

year_start = 1901;
year_end = 2000;
Years = 1:1:length(year_start:year_end); 
% days in month
Months = [31 28 31 30 31 30 31 31 30 31 30 31];
Month_hit = cumsum(Months) + 1;

% weekDays = [1 2 3 4 5 6 7]; % MTWTFSS


% # days in year (check)
Ndays = sum(Months);

leapYears = mod(Years,4) == 0; 
Nleaps = sum(leapYears);

myFirstMonths = 0;
count = 1;

for i = Years
    if leapYears(1,i) == 1; 
        Months(1,2) = 29; 
    else
        Months(1,2) = 28;
    end 
   
    Month_hit = cumsum(Months)+1;
    newcount = 0;
    for j = 1:Month_hit(1,end)+1 
        count = count + 1; 
        newcount = newcount+1;
        if ((sum(newcount==Month_hit)==1) && mod(count,7) == 0)
            myFirstMonths = myFirstMonths + 1;
        end 
    end 
end 

myFirstMonths




