%% Problem 9 

% A Pythagorean triplet is a set of three natural numbers,
% a < b < c, for which,
% 
% a2 + b2 = c2
% For example, 32 + 42 = 9 + 16 = 25 = 52.
% 
% There exists exactly one Pythagorean triplet for which a + b + c = 1000.
% Find the product abc.


%% Insights


% Use Euclid formula to solve 
% a = m^2-n^2  |  b = 2mn  |  c = m^2+n^2

% substituting into equation a+b+c = 1000 we get:
% m(m+n)=500

% m and n must be coprime (only share a common factor of 1);


%% Implementation 

% We need to find m and n, we are constrained to a logical set of parameter 
% values

mvec = 1:25; 
nvec = 1:25; 

savedNums = []; % save numbers (m & n) if solution exists
count = 0; % count number of solutions

% cycle through nvec until we have exhausted each value from mvec with the 
% current value of nvec
for i = 1:length(nvec)
    for j = 1:length(mvec) 
   
        tempVal = mvec(1,j)*(mvec(1,j)+nvec(1,i)) 
        
        if tempVal == 500 % check to see if solution exists
            count  = count + 1; % count up number of solutions found
            savedNums(count,1:2) = [mvec(1,j) nvec(1,i)]
        end      
        
    end 
end

savedNums

% check if coprime 
% 20 and 5 are both coprime because 5 is not a factor of itself, therefore
% the integer 1 is the only shared factor between the two


% plug into equation
m = savedNums(1,1);
n = savedNums(1,2);

a = m^2-n^2;
b = 2*m*n; 
c = m^2+n^2;

myVal = a + b + c;

%% Answer
myAns = a*b*c




