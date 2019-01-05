%simulation of photon absorption in sample
clear all;

%define some parameters
N=100000;
ma = 1.5; %1/cm

%initial results
x=zeros(1,N);

%calc travel distance for each photon
for i=1:N
    x(i) = -1/ma*log(1-rand);   
end

% plot(x,'.');
% xlabel('Photon index');
% ylabel('absorption location');

%calculate histogram
bin_num =1000;
[I, bin] = hist(x, bin_num);

%normalize data
bin_size = (max(x)-min(x))/bin_num;
I=I/N/bin_size;

%plot histogram
plot(bin, I, '.')
xlabel('Distance (cm)');
ylabel('Number of photon absorbed');

%curve fitting with exponential function: 
fit_Eq = @(a,x) a(1)*exp(-a(2)*x);
a = lsqcurvefit(fit_Eq, [0; 0], bin, I);
title(sprintf('Fitting results: %.2f*exp(-%.2f*x)',a(1),a(2)));
hold on;
fplot(@(x) fit_Eq(a,x), [min(x), max(x)], 'r');