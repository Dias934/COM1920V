function varargout = SCD_Simulator(varargin)
% SCD_SIMULATOR MATLAB code for SCD_Simulator.fig
%      SCD_SIMULATOR, by itself, creates a new SCD_SIMULATOR or raises the existing
%      singleton*.
%
%      H = SCD_SIMULATOR returns the handle to a new SCD_SIMULATOR or the handle to
%      the existing singleton*.
%
%      SCD_SIMULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCD_SIMULATOR.M with the given input arguments.
%
%      SCD_SIMULATOR('Property','Value',...) creates a new SCD_SIMULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SCD_Simulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SCD_Simulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SCD_Simulator

% Last Modified by GUIDE v2.5 14-Mar-2020 16:27:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SCD_Simulator_OpeningFcn, ...
                   'gui_OutputFcn',  @SCD_Simulator_OutputFcn, ...
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


% --- Executes just before SCD_Simulator is made visible.
function SCD_Simulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SCD_Simulator (see VARARGIN)

% Choose default command line output for SCD_Simulator
handles.output = hObject;


set(handles.codfonteAusencia,'value',1);
set(handles.codcanalAusencia,'value',1);



set(handles.simSCD,'Enable','Off');
set(handles.fileHistogram,'Enable','Off');
set(handles.abrirFileRX,'Enable','Off');
set(handles.cifraTextoClaro,'Enable','Off');
set(handles.cifraCriptograma,'Enable','Off');
set(handles.cifraTextoDecifrado,'Enable','Off');



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SCD_Simulator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SCD_Simulator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openFileTX.
function openFileTX_Callback(hObject, eventdata, handles)
% hObject    handle to openFileTX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile;
file =  filename;
path = pathname;

set(handles.fileHistogram,'Enable','On');
set(handles.simSCD,'Enable','On');




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sairBtn.
function sairBtn_Callback(hObject, eventdata, handles)
% hObject    handle to sairBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
delete(handles.figure1);



% --- Executes on button press in simSCD.
function simSCD_Callback(hObject, eventdata, handles)
% hObject    handle to simSCD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.abrirFileRX,'Enable','On');
set(handles.cifraTextoClaro,'Enable','On');
set(handles.cifraCriptograma,'Enable','On');
set(handles.cifraTextoDecifrado,'Enable','On');




function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
end


% --- Executes on button press in abrirFileRX.
function abrirFileRX_Callback(hObject, eventdata, handles)
% hObject    handle to abrirFileRX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in ficheirobtn.
function ficheirobtn_Callback(hObject, eventdata, handles)
% hObject    handle to ficheirobtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ficheirobtn


% --- Executes on button press in fileHistogram.
function fileHistogram_Callback(hObject, eventdata, handles)
% hObject    handle to fileHistogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in semCifra.
function semCifra_Callback(hObject, eventdata, handles)
% hObject    handle to semCifra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of semCifra


% --- Executes on button press in cifraTextoClaro.
function cifraTextoClaro_Callback(hObject, eventdata, handles)
% hObject    handle to cifraTextoClaro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cifraCriptograma.
function cifraCriptograma_Callback(hObject, eventdata, handles)
% hObject    handle to cifraCriptograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cifraTextoDecifrado.
function cifraTextoDecifrado_Callback(hObject, eventdata, handles)
% hObject    handle to cifraTextoDecifrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function berVal_Callback(hObject, eventdata, handles)
% hObject    handle to berVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of berVal as text
%        str2double(get(hObject,'String')) returns contents of berVal as a double


% --- Executes during object creation, after setting all properties.
function berVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to berVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
