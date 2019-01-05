% Grab relevant information from wavelength entry in LightCarlo GUI 

LightData = get(handles.uitable3,'Data');
y = str2num(LightData{1,1}); 


%% Blood Coeffs. 

len = length(yBlood);
% Debug for wavelength match in data 
% if no exact match we must interpolate values
dbug = mod(y,2); % checks for uneven entry for relevant data; 

if dbug == 0
   
for i = 1:len
    if y == yBlood(1,i)
        pos = i
        mua_oxy = muaoxy(1,i)
        mua_doxy = muadoxy(1,i)
    else 
        pos = 0;
    end 
end 


else % Interpolate Algorithm to find positions
    for i = 1:len
         if y > yBlood(1,i)  
             pos = i;
         end 
    end 

% INTERPOLATE VALUES
mua1 = muaoxy(1,pos);
mua0 = muaoxy(1,pos-1); 
yo = yBlood(1,pos-1);
y1 = yBlood(1,pos);
            
    mua_oxy = mua0+((mua1-mua0)/(y1-yo))*(y-yo)
    
mua1 = muadoxy(1,pos);
mua0 = muadoxy(1,pos-1); 
yo = yBlood(1,pos-1);
y1 = yBlood(1,pos);

    mua_doxy = mua0+((mua1-mua0)/(y1-yo))*(y-yo)
 
end 

mua_blood = mua_oxy+mua_doxy;


%% Water Coeffs. 
len = length(ywater);

if dbug == 0 % use from above since data follows same format
    for i = 1:len
    if y == ywater(1,i)
        pos = i
        mua_water = muawater(1,i)
    else 
        pos = 0;
    end 
end 


else % Interpolate Algorithm to find positions
    for i = 1:len
         if y > ywater(1,i)  
             pos = i;
         end 
    end 

    % INTERPOLATE VALUES
mua1 = muawater(1,pos);
mua0 = muawater(1,pos-1); 
yo = ywater(1,pos-1);
y1 = ywater(1,pos);
            
    mua_water = mua0+((mua1-mua0)/(y1-yo))*(y-yo);
%     fprintf('muawater = %3.7f ',mua_water);
end       
            
           
%% Fat Coeffs. 
% No need for interpolation as wavelength data increases by 1nm

len = length(yfat);

for i = 1:len 
    if y == yfat(1,i) 
        pos = i; 
    end 
end 

mua_fat = muafat(1,pos)


%% Melanin Coeffs. 
% No need for interpolation as wavelength data increases by 1nm

len = length(ymelanin); 

for i = 1:len 
    if y == ymelanin(1,i) 
        pos = i; 
    end 
end 

mua_melanin = muamelanosome(1,pos);


            
            