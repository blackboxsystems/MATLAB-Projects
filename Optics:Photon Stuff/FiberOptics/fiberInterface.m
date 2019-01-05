% Air fiber interface with cladding 

n_atm = 1.000273; % air refractive index
n_water = 1.333;
% fiber properties
n_core = 1.52; 
n_clad = 1.5; 
d_fiber = 8.2e-6; % fiber diameter
r_fiber = d_fiber/2; % fiber radius

% system paramters
f = .03; % focal length in meters
y = 1300e-9; % wavelength of light in meters
d_beam = .012; % incident beam diamter
L_fiber = 1; % length of fiber cable in meters

% Angles and other parameters
NA = sqrt(n_core.^2-n_clad.^2) % Numerical aperature
a_critical = asind(n_clad./n_core) % critical angle of reflection
a_acceptance = asind(NA)
a_divergence_atm = asind(NA/n_atm)
a_div_water = asind(NA/n_water)
% diffraction limited resolution 
r = (1.22.*y.*f)./d_fiber

% Transmission through cable 

Tranmission_Power = 10.^(-(10^2)*.25*L_fiber)

N = L_fiber/(2*r_fiber*tand(a_critical))-(n_clad/(2*n_core*tand(a_critical)))
