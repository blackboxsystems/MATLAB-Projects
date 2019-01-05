function varargout = LightCarlo(varargin)
% LIGHTCARLO MATLAB code for LightCarlo.fig
%      LIGHTCARLO, by itself, creates a new LIGHTCARLO or raises the existing
%      singleton*.
%
%      H = LIGHTCARLO returns the handle to a new LIGHTCARLO or the handle to
%      the existing singleton*.
%
%      LIGHTCARLO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIGHTCARLO.M with the given input arguments.
%
%      LIGHTCARLO('Property','Value',...) creates a new LIGHTCARLO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LightCarlo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LightCarlo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LightCarlo

% Last Modified by GUIDE v2.5 23-Oct-2014 00:40:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LightCarlo_OpeningFcn, ...
                   'gui_OutputFcn',  @LightCarlo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LightCarlo is made visible.
function LightCarlo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LightCarlo (see VARARGIN)

% Choose default command line output for LightCarlo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LightCarlo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LightCarlo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in RunSim.
function RunSim_Callback(hObject, eventdata, handles)
% hObject    handle to RunSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Grab Handles
dx = handles.dx;
cfac = handles.cfac; 

dx = dx*cfac; % use conversion foctar for length in cm

% Grab Data from Tables
Data = get(handles.uitable2,'Data');
LightData = get(handles.uitable3,'Data');
LayerData = get(handles.uitable6,'Data');

% Check for Data entry
for i = 1:4
    if isempty(Data{i,1}) 
        Data{i,1} = '0'; % establish zeros if run without user input
    end 
end 
for j = 1:2 
    if isempty(LightData{j,1}) 
        LightData{j,1} = '0'; 
    end 
end 
for k = 1:3 
    if isempty(LayerData{k,1}) 
        LayerData{k,1} = '0'; 
    end 
end 

% Grab Inputs from Cell Matrix in GUI
mua = (Data{1,1}); % absorption coeff.
mus = str2num(Data{2,1}); % scattering coeff.
g = str2num(Data{3,1}); % Anisotropy (tissue = .85-1](highly scattering!!)
Nphotons = str2num(Data{4,1}); % Initial number of photons entering media. 
y = str2num(LightData{1,1});
Po = str2num(LightData{2,1}); 

set(handles.uitable2,'Data',Data)
set(handles.uitable3,'Data',LightData)
set(handles.uitable6,'Data',LayerData)
    
% Calculate Optical Properties 
musp = mus*(1-g); % reduced scattering coeff.
mut = mua+mus; % total attenuation coeff. (probability of interaction event)
mfp = 1./mut; % mean free path of photon before interaction event
mueff = sqrt(3.*mua.*(mua+musp)); % effective attenuation coeff.
a = mus./(mua+mus); % albedo (fraction of scattered photons)
D = 1./(3.*(mua+musp)); % Diffusion Coefficient
dp = 1./mueff; % penetration depth ins scattering media 

% Get Temperature,time,and Depth
Tff = str2num(LayerData{1,1}); % final temperature in farehnheit
dt = str2num(LayerData{2,1}); % time
dy = str2num(LayerData{3,1}); % depth
Tfskin = 98.6; % average body temp
Tcskin = (Tfskin-32)/(1.8);


p = 1.05; % [g/cm^3] % tissue density
c = .85; % [cal/g*C] % specific heat capacity of tissue
f = 4.186; % [J/cal] & conversion from calories to Joules
C = c*f; % conversion to relevant units

%% Calculate Temp, Time and Depth

% Fluence rate is proportional to power in Watts
if Tff == 0 % if solving for Temperature
Fo = Po;
F = (Fo/(4*pi.*D*p*C)).*(1./dy).*exp(-mueff.*dy);  % F = Fluence Rate at r = r1
                                              % Fo = Fluence Rate at r = 0.


TCf = Tcskin + (dt*(F.*mua)./(p*C)); % final temp in Celcius
Tff = TCf.*1.8+32; % final temp in Fahrenheit.

elseif dt == 0 % if solving for time 
    Fo = Po;
    Tcf = (Tff-32)/1.8;
    dT = Tcf - Tcskin;
    dt = (4*pi*dT*D*p*c.*dy.*exp(mueff.*dy))./(Fo*mua);
end
    
LayerData{1,1} = Tff; 
LayerData{2,1} = dt; 
    
    
% Probabilities 
P_abs = (1-exp(-mua*dx)); % Probability of photon being absorbed 
P_scat = (1-exp(-mus*dx)); % Probability of photon being scattered
P_flu = (1-exp(-mueff*dx)); % fluence rate probability of photons
P_intx = (1-exp(-mut*dx)); % Probability of photon absorbed or scattered
P_trans = (1-P_intx); % Probability of photon transmitting through a depth r


% Number of photons scattered/absorbed 
Nlive = floor(P_trans*Nphotons); % Number of photons that pass through media
Nabs = floor(P_abs*Nphotons); 
Nscat = floor(P_scat*Nphotons); 
Nintx = floor(P_intx*Nphotons); 

%time required to produce N photons at laser power P.

% Assign Updated Measurements to Cell Matrix table in GUI
Data{5,1} = '# Absorbed';Data{5,2} = Nabs;
Data{6,1} = '# Scattered';Data{6,2} = Nscat;
Data{7,1} = '# Interactions';Data{7,2} = Nintx;
Data{8,1} = '# Transmitted';Data{8,2} = Nlive;
Data{9,1} = 'Penetration Depth';Data{9,2} = dp;
Data{10,1} = 'Mean Free Path';Data{10,2} = mfp;
set(handles.uitable2,'Data',Data)
set(handles.uitable6,'Data',LayerData)


guidata(hObject,handles); 


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.mbtn)
    set(handles.set_unit,'String','m');
    cfac = 100;
elseif (hObject == handles.cmbtn) 
    set(handles.set_unit,'String','cm');
    cfac = 1;
elseif (hObject == handles.mmbtn) 
    set(handles.set_unit,'String','mm'); 
    cfac = .1;
else 
    set(handles.set_unit,'String','um');
    cfac = .0001;
end
    
handles.cfac = cfac;
    
dx = str2num(get(handles.depthedit,'String'))

handles.dx = dx;

guidata(hObject,handles);
    


% --- Executes on button press in getProps.
function getProps_Callback(hObject, eventdata, handles)
% hObject    handle to getProps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Extract Optical Property Data of Blood,Water,Fat,Melanin
TissueAbsInfo; 

% Caculate Coeffs. from input wavelength and Data
GrabProperties;

% Display Properties at given wavelength 
Props = get(handles.uitable4,'Data');
Props{1,1} = mua_blood;
Props{1,2} = mua_oxy;Props{1,3} = mua_doxy; 
Props{1,4} = mua_fat; 
Props{1,5} = mua_melanin;
Props{1,6} = mua_water;

set(handles.uitable4,'Data',Props)

guidata(hObject,handles); 


% --- Executes on button press in genwtavgs.
function genwtavgs_Callback(hObject, eventdata, handles)
% hObject    handle to genwtavgs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Tissue = get(handles.uitable4,'Data');

B = str2num(Tissue{2,1});
S = str2num(Tissue{2,2});
Tissue{2,3} = num2str(1-S); 
F = str2num(Tissue{2,4});
M = str2num(Tissue{2,5});
W = str2num(Tissue{2,6});

% set(handles.uitable4,'Data',Tissue)
TotalWeight = B*S+B*(1-S)+F+M+W
set(handles.uitable4,'Data',Tissue)

% Get Data again after refreshing
Tissue = get(handles.uitable4,'Data');

mua_oxy = Tissue{1,2};
mua_doxy = Tissue{1,3}; 
mua_fat = Tissue{1,4}; 
mua_melanin = Tissue{1,5}; 
mua_water = Tissue{1,6};

b1 = B*S*(mua_oxy);
b2 = B*(1-S)*(mua_doxy);
fat = F*mua_fat;
water = W*mua_water;
melanin = M*mua_melanin;

mua_w = b1+b2+fat+water+melanin;


Tissue{4,1} = mua_w;
% Update Cell MAtrix for Weighted Average
set(handles.uitable4,'Data',Tissue)

% Update uitable2 for wieghted mua 
Data = get(handles.uitable2,'Data');
Data{1,1} = mua_w; 
set(handles.uitable2,'Data',Data);

guidata(hObject,handles); 


%% Remaining Functions
% --- Executes on button press in Debug.
function Debug_Callback(hObject, eventdata, handles)
% hObject    handle to Debug (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles 
keyboard;



function depthedit_Callback(hObject, eventdata, handles)
% hObject    handle to depthedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of depthedit as text
%        str2double(get(hObject,'String')) returns contents of depthedit as a double


% --- Executes during object creation, after setting all properties.
function depthedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to depthedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
