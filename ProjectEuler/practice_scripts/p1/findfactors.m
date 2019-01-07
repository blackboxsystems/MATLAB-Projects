% find the factors of a number 

mynum = input('Enter a number to find factors: '); 

count = 0; 
fac = 0;

while count < mynum/2
    count = count + 1;
if mod(mynum,count) ~= 0 
  fac = fac + 1;
end 
end 

fac