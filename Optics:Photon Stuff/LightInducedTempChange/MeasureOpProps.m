% Measuring Optical Properties 

clear all;

debug = 1; % switch between materials vs tissue measurments


Tfi = 98.6; % intial tissue temperature in degrees F
dt = 30; % seconds of laser irradiation
Fo = .003;  % initial Fluence Rate/Power/Intensity
r = .001; 

Tci = (Tfi-32)/(1.8); 

if debug == 0
% General Material Optical Properties
g = 0; 
mua = 2; % per cm
mus = 0; 

% Material Properties
p = 1.0; % [g/cm^3] % water density
c = 4.186; % [J/cal] & conversion from calories to Joules




else 
% Tissue Optical Properties & Calculations
g= .9; % anisotropy (measure of forward scattering);
mua = .02; % absorption [cm-1]
mus = 2; % scattering [cm-1] 

% Tissue Material Properties
p = 1.05; % [g/cm^3] % tissue density
c = .85; % [cal/g*C] % specific heat capacity of tissue
f = 4.186; % [J/cal] & conversion from calories to Joules
C = c*f; % conversion to relevant units

end

musp = mus.*(1-g); % reduced scattering coeff.
mut = mua+mus; % total attenuation coeff. (probability of interaction event)
mfp = 1/mut; % mean free path of photon before interaction event
mueff = sqrt(3.*mua.*(mua+musp)); % effective attenuation coeff.
a = mus/(mua+mua); % albedo (fraction of scattered photons)
D = 1./(3.*(mua+musp)); % Diffusion Coefficient

% Probabilities 
P_abs = (1-exp(-mua.*r)); % Probability of photon being absorbed 
P_intx = (1-exp(-mut.*r)); % Probability of photon absorbed or scattered
P_trans = 1-P_intx; % Probability of photon transmitting through a depth r

%% Temperature change from laser heating

% Fluence rate is proportional to power in Watts
F = (Fo/(4*pi.*D*p*C)).*(1./r).*exp(-mueff.*r);  % F = Fluence Rate at r = r1
                                              % Fo = Fluence Rate at r = 0.


TCf = Tci + (dt*(F.*mua)./(p*C));
TFf = TCf.*1.8+32


