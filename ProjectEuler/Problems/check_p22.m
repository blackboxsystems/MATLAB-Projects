

%% Compare and check 


[num txt raw] = xlsread('alphabet_fixed.csv'); 

names = reshape(upper(txt),5162,1);

%%

checker = strcmp(names,myABCs)

error = [];
for i = 1:length(checker) 
    if checker(i,1) == 0 
        error = [error i];
    end 
end