% Golden Ratio algorithm 
% clear all;close all;clc;

Nits = 10;
% Nits = input('Enter number of iterations to perform: '); 

% phi = (1+sqrt(5))/2;
n = 1;

% Always applys to this format
gvec_i = [n 2.*n];

% create vector to store the numbers
gvec = zeros(1,Nits,length(n));
Ratio = zeros(1,Nits-1,length(n));
% establish first to values to begin algorithm
gvec(1) = gvec_i(1);
gvec(2) = gvec_i(2);


tic;
for i = 3:1:Nits

gvec(i) = gvec(i-1)+gvec(i-2);
Ratio(i-1) = gvec(i)/gvec(i-1); % change to i-2 for normalize

end
elapsedTime = toc

gvec
Ratio

sprintf('%u',uint64(Ratio(1,end)))
% primeFactors(gvec)

% format long
Nend = round(gvec(1,end));
gMag = length(num2str(Nend));

figure(1)
plot(Ratio,'b.-')
% semilogy(1:1:Nits,gvec,'b-');
% xlabel('Iteration number'); 
% ylabel('Value');
hold on




