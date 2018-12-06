function [ out,elapsedTime ] = multiplyLargeNumbers( numberA, numberB )
%% multiplyLargeNumbers multiplies a number by another number where both inputs
% are in STRING FORMAT


% Ndigits = 1024;
% numberA = strrep(num2str(randi(9,1,Ndigits)),' ','');
% numberB = strrep(num2str(randi(9,1,Ndigits)),' ','');

% format long
% checker = num2str(str2num(intAstr)*str2num(intBstr))

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

numberLengths = [Nsmall Nlarge];

% preinitialize vector to store integers of the 2 numbers for
% multiplication
Mat = zeros(2,Nlarge); % hold numbers for multiplication

% store numbers in matrix
for i = 1:Nlarge 
    Mat(1,i) = str2num(longNum(1,i));
end 

startPos = Nlarge - Nsmall; % start index position for smaller number(2nd) 
for i = 1:Nsmall 
    Mat(2,startPos+i) = str2num(shortNum(1,i));
end 

%% Calculation by Multiplication (uses method done by paper & pencil)
count = 0;
tempStore = zeros(1,Nlarge+Nsmall-1); % stored digits

% timer start
tic;
for i = Nlarge:-1:startPos+1
    count = count + 1; % increment placeholder position for multiple digit number products
    for j = Nlarge:-1:1 
        tempVal = Mat(2,i)*Mat(1,j); % multiply numbers
            if count == 1 
                tempStore(count,j-count+Nsmall) = tempVal; % store product in column at decimal position
            else 
                tempStore(1,j-count+Nsmall) = tempStore(1,j-count+Nsmall)+tempVal;
            end
    end 
end

%% Add numbers and carry remainders 
% tempStore;
for i = length(tempStore):-1:1    
    if sum(tempStore(:,i)) >= 10  && i > 1 % if sum >= 10
        tempRem = num2str(sum(tempStore(:,i)));                          % sum digits in number position
        tempStore(1,i-1) = tempStore(1,i-1)+str2double(tempRem(1,1:end-1)); % store REMAINDER digits in previous column
        tempStore(1,i) = str2double(tempRem(1,end));                        % store PRIMARY DIGITS as placeholder for number
    else 
        tempStore(1,i) = sum(tempStore(:,i));
    end       
end 
elapsedTime = toc;
myNum = tempStore(1,:);

%% put number answer into string format 

% concatinate vector form of number into cellarray for viewing based on
% length of answer.

out = strrep(strrep(strrep(mat2str(tempStore),'[',''),']',''),' ','');
% finalLength = length(out);



end

