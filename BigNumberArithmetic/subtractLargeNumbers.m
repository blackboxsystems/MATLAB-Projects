function [ outNumber,elapsedTime ] = subtractLargeNumbers( numberA,numberB )
%Subtract 2 large numbers, the numbers must be in string format
% Check format below

% Input format

% check answer for shorter numbers (< 15 sig figs)
% format long
% checker = abs(str2double(numberA)-str2double(numberB));

Nlarge = 0; Nsmall = 0;
% check which number is bigger
if (length(numberA) > length(numberB))
    longNum = numberA; Nlarge = length(numberA);
    shortNum = numberB; Nsmall = length(numberB);
elseif (length(numberA) < length(numberB))
    longNum = numberB; Nlarge = length(numberB);
    shortNum = numberA; Nsmall = length(numberA);
elseif (length(numberA) == length(numberB))  % if same size, look at digits
    
    aVal = str2double(numberA(1,1)); % first significant digit
    bVal = str2double(numberB(1,1));
    
    if (aVal == bVal)
        index = 2;
        while ((aVal == bVal) && (index ~= length(aVal)))
            aVal = str2double(numberA(1,index));
            bVal = str2double(numberB(1,index));
            if  (aVal > bVal)
                 shortNum = numberB; Nsmall = length(numberB);
                longNum = numberA; Nlarge = length(numberA);
%                 break;
            elseif (aVal < bVal)
                 shortNum = numberA; Nsmall = length(numberA);
                longNum = numberB; Nlarge = length(numberB);
%                 break;
%             else 
            end
            index = index + 1;
            if (index == length(numberA))
                shortNum = numberA; Nsmall = length(numberA);
                longNum = numberB; Nlarge = length(numberB);
                break;
            end
            
        end
        
%         if (Nlarge == Nsmall)
%             shortNum = numberA; Nsmall = length(numberA);
%             longNum = numberB; Nlarge = length(numberB);
%         end
        
    elseif (aVal < bVal)
        shortNum = numberA; Nsmall = length(numberA);
        longNum = numberB; Nlarge = length(numberB);
    elseif (aVal > bVal)
        shortNum = numberB; Nsmall = length(numberB);
        longNum = numberA; Nlarge = length(numberA);
    end
end

%% preinitialize vector to store integers of the 2 numbers
myMat = zeros(2,Nlarge);

% store numbers in matrix
for i = 1:Nlarge 
    myMat(1,i) = str2double(longNum(1,i));
end 

startPos = Nlarge - Nsmall; 
for i = 1:Nsmall 
    myMat(2,startPos+i) = str2double(shortNum(1,i));
end 



%% Subtract elements of vector by columns

tic % start timer
digitVec = -diff(myMat(:,:)); % subtract column elements & reverse signs
 
% Account for remainders in vector and shifting values 
checkCount = 0;  % check how many remainder back-steps we take
while ((sum(digitVec >= 0) ~= length(digitVec)) && (checkCount < length(digitVec)))
    checkCount = checkCount+1;
    for i = length(digitVec):-1:1   
        if digitVec(1,i) < 0 % catch a negative difference
            n = 0;
%             digitVec
            while ((digitVec(1,i-n) <= 0) && (n < length(digitVec)-1)) % grab a remainder
                n = n + 1;
%                 digitVec
                if (digitVec(1,i-n) > 0)  % find a number to decrement for neg number
                    digitVec(1,i-n) = digitVec(1,i-n)-1; % decrement
                    digitVec(1,i-n+1) = digitVec(1,i-n+1)+10; % add to negative num position
                    
                    for j = i:n % include remainder decrement for between dec and neg number
                            digitVec(1,j) = digitVec(1,j)+9; % add to negative num position
                    end
                    break;  % escape the remainder sequence
                end         
            end
        end 
    end 
end
elapsedTime = toc;  % show calculation time
checkCount;
%% Clean Up Answer in string form 

for i = 1:length(digitVec)
    if (digitVec(1,i) ~= 0)
        myNum = abs(digitVec(1,i:1:end));
        break;
    else 
        myNum = abs(digitVec);
    end 
end

outNumber = strrep(strrep(strrep(mat2str(myNum),'[',''),']',''),' ','');

length(outNumber);


end

