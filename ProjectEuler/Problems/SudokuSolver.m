%% Sudou Problem 
clear all;close all;clc;

Ndigits = 9;
% Sudoku Matrix
sudMat = [0 0 3 0 2 0 6 0 0;...
          9 0 0 3 0 5 0 0 1;...
          0 0 1 8 0 6 4 0 0;...
          0 0 8 1 0 2 9 0 0;...
          7 0 0 0 0 0 0 0 8;...
          0 0 6 7 0 8 2 0 0;...
          0 0 2 6 0 9 5 0 0;...
          8 0 0 2 0 3 0 0 9;...
          0 0 5 0 1 0 3 0 0];

[X Y] = size(sudMat);

dvec = 1:Ndigits; 


%go through matrix and eliminate possible numbers 
 
for i = 1:Ndigits 




