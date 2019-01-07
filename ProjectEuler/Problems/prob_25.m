%% Problem 25 

% Hence the first 12 terms will be:
% 
% F1 = 1
% F2 = 1
% F3 = 2
% F4 = 3
% F5 = 5
% F6 = 8
% F7 = 13
% F8 = 21
% F9 = 34
% F10 = 55
% F11 = 89
% F12 = 144
% The 12th term, F12, is the first term to contain three digits.
% 
% What is the index of the first term in the Fibonacci sequence to
% contain 1000 digits?


%% Implementation 


n = 1;
% Initial fibonacci sequence
Fibvec = [1 2];


index = 2;
while length(num2str(Fibvec(index))) < 1000 

Fibvec(index+1) = Fibvec(index)+Fibvec(index-1);
index = index + 1;

end

index 
Fibvec(1,end)