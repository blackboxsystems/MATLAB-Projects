function Rd = DiffuseReflectance(mua,rmus,r)
g = .9;
mua = 5;
rmus = 10;
r = 0:.001:1;

mus = rmus./(1-g);  %Reduced scattering coefficient.  Diffusion of photons in a step size of 1/rmus.
mut = mua+mus;  %total attenuation coefficient.  (total amount of interaction)
a = mus./mut;  %probability of a photon being scattering.
mfp = 1./mut;  %mean free path a photon travels before an interaction event (absorption or scattering)
mueff = sqrt(3.*mua.*(mua+rmus));  %effective attenuation rate for highly scattering media
pd = 1./mueff;  %penetraion depth
D = 1./(3.*(mua+rmus));

%Fluence Rate Calculation
Fo = 1; %Initial Intensity at point light source
  %Optical Diffusion Coefficient 
z1 = 1./(mua+rmus);
z2 = z1+4*D;

p1 = sqrt(r.^2+z1.^2);
p2 = sqrt(r.^2+z2.^2);
  
Rd = ((z1./(4.*pi)).*(1./p1.^2).*exp(-mueff.*p1)).*(mueff+1./p1)+...
    ((z2./(4.*pi)).*(1./p2.^2).*exp(-mueff.*p2)).*(mueff+1./p2);

plot(r,Rd);
end 


