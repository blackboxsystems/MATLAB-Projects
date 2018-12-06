% getAnyData.m 
clear all;close all;clc;

% load data
data = load('ex1data2.txt');

% format and parse data 
[Xnorm y m n] = setDataMulti(data);


% theta from normal equation
optitheta = normalEqn(Xnorm, y);
hyp1 = optitheta'*Xnorm';


%% PLOT
figure
if n > 1
for i = 2:1:n+1


% subplot(2,2,i);
plot(Xnorm(:,i),y,'r.')
hold on 
plot(Xnorm(:,i),hyp1,'b-');
xlabel('Whole Fruit weight');
ylabel('Edible Fruit weight');


end

else 
    figure(1)
plot(Xnorm(:,2),y,'r.')
hold on 
plot(Xnorm(:,2),hyp1,'b-');
xlabel('Whole Fruit weight');
ylabel('Edible Fruit weight');
end
