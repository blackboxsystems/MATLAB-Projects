%% Problem 18

% By starting at the top of the triangle below and moving to adjacent 
% numbers on the row below, the maximum total from top to bottom is 23.
% 
% 3
% 7 4
% 2 4 6
% 8 5 9 3
% 
% That is, 3 + 7 + 4 + 9 = 23.
% 
% Find the maximum total from top to bottom of the triangle below:
% 
% 75
% 95 64
% 17 47 82
% 18 35 87 10
% 20 04 82 47 65
% 19 01 23 75 03 34
% 88 02 77 73 07 63 67
% 99 65 04 28 06 16 70 92
% 41 41 26 56 83 40 80 70 33
% 41 48 72 33 47 32 37 16 94 29
% 53 71 44 65 25 43 91 52 97 51 14
% 70 11 33 28 77 73 17 78 39 68 17 57
% 91 71 52 38 17 14 91 43 58 50 27 29 48
% 63 66 04 68 89 53 67 30 73 16 69 87 40 31
% 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
% 
% NOTE: As there are only 16384 routes, it is possible to solve this problem 
% by trying every route. However, Problem 67, is the same challenge with a 
% triangle containing one-hundred rows; it cannot be solved by brute force, 
% and requires a clever method! ;o)


%% Implementation 

% use data structure as the pasted version above.  Will want to use a .txt
% file for larger problems and so the algorithm will include this
% possibility. 
% Ruling: 
% the adjacent numbers for any position i in the jth row, the 
% possible neighbors are i and i+1 in the jth+1 row ONLY 

% Try algorithm from the bottom up approach and seek max number


tdata = importdata('TriangleMaxPath.txt'); 
tdata = tdata'; 

% base size 
BASE = 15;
X = BASE;
Y = X; 
Nelms = (X*Y)/2; % number of number containing elements

% initialize square matrix to hold triagular number elements
myOriginalMatrix = zeros(Y,X);
path = cumsum(1:Y);

% add triangular number elements to matrix
for i = 2:1:Y  
    myOriginalMatrix(i,1:i) = tdata(1,(path(1,i-1)+1):path(1,i));
end

myOriginalMatrix(1,1) = tdata(1,1);
t = myOriginalMatrix;

a = zeros(size(t));

a(length(t),:) = t(15,:);   %  We are making a new matrix to store the sums, but the first row needs to have the values from the given triangle otherwise it won't have any values to call for the first loop iteration i=14

tic

for i = 14:-1:1
    for j = 1:i
        
        a(i,j) = t(i,j) + max(a(i+1,j),a(i+1,j+1));
        
    end
end

toc

fprintf('The largest sum is %.0d\n',a(1,1))






