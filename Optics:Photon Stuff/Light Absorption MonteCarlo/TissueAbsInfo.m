%When using the file 'numbers' make sure the first line of the page is left
%blank or else the data on the first line will not be included in our set
%of data 
% clear all;close all;clc;

fid1 = fopen('Hbtxtcc.txt'); % Blood Data
fid2 = fopen('fat_absorptionc.txt'); % Fat Data
fid3 = fopen('H2OAbsorptionc.txt'); % Water Data
    while feof(fid1) == 0 
        
        Hbdata = textscan(fid1,'%f%f%f'); % scan for HB & HBO2 
        Fatdata = textscan(fid2,'%f%f');
        H2Odata = textscan(fid3,'%f%f');                                         
        
    end  
%%
%  Molar Extinction coefficients for blood Oxy and De-oxy Hemoglobin
c = (150)/(64458); %(g/L)/(g/mol) = mol/L = M  % blood concentration
yBlood = [Hbdata{:,1}];yBlood = yBlood'; % convert vector format
Eox = [Hbdata{:,2}];Eox = Eox';
Edox = [Hbdata{:,3}];Edox = Edox';

% Absorption coefficients
muaoxy = log(10)*c.*Eox;
muadoxy = log(10)*c.*Edox;
%%
% Fat Absorption Data
yfat = [Fatdata{:,1}];yfat = yfat';
muafat = [Fatdata{:,2}];muafat = muafat';
%%
% Water(H2O) Absorption Data 
ywater = [H2Odata{:,1}];ywater = ywater';
muawater = [H2Odata{:,2}];muawater = muawater';

% y = 400:1:1098;
%%
% Melanosome Absorption Equation for calculation
ymelanin = 400:1:800;
muamelanosome = (519).*(ymelanin./500).^(-3);


%% Weighted Percentages of Tissue Media
% B = .0035; % Whole Blood prct
% S = .962; % Oxygenated Blood prct of Whole Blood
% W = .214; % H2O prct 
% F = .277; % Fat prct
% % Melanin Range = .0075-.02 
% M = .0075*rand()+.02;


% mua = B*S*muaoxy+B*(1-S)*muadoxy+W*muawater+F*muafat+M1*muamelanosome



%% Create handles for useful Data
handles.yBlood = yBlood; 
handles.yfat = yfat; 
handles.ywater = ywater;
handles.ymelanin = ymelanin;

% Tissue Material Properties
p = 1.05; % [g/cm^3] % tissue density
c = .85; % [cal/g*C] % specific heat capacity of tissue
f = 4.186; % [J/cal] & conversion from calories to Joules
C = c*f; % conversion to relevant units


%%
%Plotting the Data Outputs and 3 points of interest

% figure(1)
% semilogy(yHb,muaoxy,'r-',yHb,muadeoxy,'r:',yfat,muafat,'m',...
%     ywater,muawater,'b-',ymelan,muamelanosome,'g','LineWidth',1);
% xlabel('Wavelength [nm]');
% ylabel('Absorption, mua = [cm-1]');
% title('Biological Tissue Optical Properties')



