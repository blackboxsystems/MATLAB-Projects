%% Neural Network Universal Algorithm 

im = uint8(randi(255,100,100,3));
imshow(im);
% Normalize image 
im = im./255;
%  do not include bias values
P = [3 3 1]; % s values
Nlayers = length(P);


K = P(1,end)


theta = struct('a1',[],'a2',[])

    theta.a1 = zeros(P(1,2),P(1,1)+1)
    theta.a2 = zeros(P(1,3),P(1,2)+1)

% create X data
x1 = sum(sum(im(:,:,1))); 
x2 = sum(sum(im(:,:,2)));
x3 = sum(sum(im(:,:,3))); 

X = [1;x1;x2;x3];

z2 = theta.a1*X;
a2 = sigmoid(z2);
z3 = theta.a2'*a2';
a3 = sigmoid(z3)
% add intercept term





