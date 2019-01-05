% Fresnel law of reflection 


n1 = 1.00;
n2 = 1.333; 
ain = 45; % incident angle in degrees 

aout = asind(n1.*sind(ain)./n2)

a = sind(ain-aout).^2;A = sind(ain+aout).^2; 
b = tand(ain-aout).^2;B = tand(ain+aout).^2; 

% angled incidence  
Rinc = abs((1/2)*(a/A+b/B)).^2 

% Normal (90degree) incidence with surface axis 

Rnorm = ((n1-n2)/(n1+n2)).^2

Ratio = Rinc/Rnorm