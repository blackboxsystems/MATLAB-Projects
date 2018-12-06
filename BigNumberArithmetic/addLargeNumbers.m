function [ out,elapsedTime ] = addLargeNumbers(numberA,numberB)
%ADDLARGENUMBERS adds two large numbers by storing elements in a 
% string form(string array)

% example input Format:
% Ndigits = 1024;
% numberA = strrep(num2str(randi(9,1,Ndigits)),' ','');
% numberB = strrep(num2str(randi(9,1,Ndigits)),' ','');
%Nlarge = 0; Nsmall = 0;


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
                break;
            elseif (aVal < bVal)
                 shortNum = numberA; Nsmall = length(numberA);
                longNum = numberB; Nlarge = length(numberB);
                break;
%             else 
            end
            index = index + 1;
            if (index == length(numberA))
                shortNum = numberA; Nsmall = length(numberA);
                longNum = numberB; Nlarge = length(numberB);
                break;
            end
            
        end
    elseif (aVal < bVal)
        shortNum = numberA; Nsmall = length(numberA);
        longNum = numberB; Nlarge = length(numberB);
    elseif (aVal > bVal)
        shortNum = numberB; Nsmall = length(numberB);
        longNum = numberA; Nlarge = length(numberA);
    end
end

% number of numbers in number
% Nlarge = length(longNum); 
% Nsmall = length(shortNum); 
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


%% Add elements of vector by columns

% start timer
tic 
digitVec = sum(myMat(:,:)); % sum all elements in columns

% Account for remainders in vector and shifting values 
for i = length(digitVec):-1:2   
    if (digitVec(1,i) >= 10) %&& (i < length(digitVec)-1)) 
        tempRem = num2str(digitVec(1,i));
        rem = str2double(tempRem(1,1:end-1));
        digit = str2double(tempRem(1,end));
        digitVec(1,i) = digit;
        digitVec(1,i-1) = digitVec(1,i-1)+rem;
    end 
end 
elapsedTime = toc; 

%% Clean Up Answer in vector form
if digitVec(1,1) == 0
myNum = digitVec(1,2:1:end);
else 
    myNum = digitVec; 
end 

out = strrep(strrep(strrep(mat2str(myNum),'[',''),']',''),' ','');

length(out);



end

