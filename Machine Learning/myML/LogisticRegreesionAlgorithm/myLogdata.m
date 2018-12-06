%% My data for logistic regression 

data = load('ex2data1.txt');

X = data(:,1:2);
y = data(:,end);

plot(X,y,'b.')