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

% Last Modified by GUIDE v2.5 23-Jun-2020 15:00:12

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


hObject.UserData=struct('XAxisLim',[],...       %limites do eixo X para o modo de janela
                        'Em_CodLin',[],...      %dados à saída do emissor do código de linha
                        'Rec_CodLin',[],...     %dados à entrada do recetor do código de linha
                        'Em_ModDig',[],...      %dados à saída do emissor da modulação digital
                        'Rec_ModDig',[],...     %dados à entrada do recetor da modulação digital
                        'tBit',[],...           %tempo de bit da simulação
                        'NAmostras',[],...      %número de amostras em cada bit da simulação
                        'Time_Vect',[],...      %vetor de tempo
                        'Trans_Type',[],...     %Tipo de transmissão feita
                        'Trans_BER',[],...      %vetor com valores de BER
                        'Trans_SNR',[],...      %vetor com valores de SNR
                        'HistFilename','',...   %ficheiro fonte
                        'RxFile','',...         %ficheiro resultante da simulação
                        'Claro','',...          %ficheiro de texto em claro
                        'Criptograma','',...    %ficheiro com o criptograma
                        'Decifrado','');        %ficheiro com a descodificação
hObject.UserData.Trans_Type=-1;
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
[filename, pathname] = uigetfile;               %obtain file chosen
handles.output.UserData.HistFilename=filename;  %save the name of the file in memory
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

%Buscar o nome do ficheiro a ser transmitido
TxFile=handles.output.UserData.HistFilename;

%Codificação Fonte
fonte=handles.codfonteHuffman.Value + handles.codfonteZIP.Value*2; %fonte= 0 ou 1 ou 2
[nBits, RxFile, dict]=codFonte(TxFile, fonte);

%Apresentação do número de bits resultante da codificação de fonte
handles.codfonteNBits.String=strcat("#bits =  ",num2str(nBits));

%Cifra
handles.output.UserData.Claro=RxFile;
cifra=handles.cifraVern.Value; %cifra= 0 ou 1
key=generateRandomKey(RxFile);
if(cifra>0)
    RxFile=one_time_pad_cipher(RxFile,key);
end
handles.output.UserData.Criptograma=RxFile;

%Codificação Canal
canal=handles.codcanalBitPPar.Value+handles.codcanalH74.Value*2; %canal= 0 ou 1 ou 2
[nBits, RxFile]=codCanal(RxFile, canal);

%Apresentação do número de bits transmitidos após a codificação de canal
handles.codCanalNBits.String=strcat("#bits =  ",num2str(nBits));

%Código de Linha
ampCL=str2double(handles.CodLinAmp.String);
NAm=str2double(handles.NAmostr.String);
tBit=str2double(handles.TBit.String);
handles.output.UserData.tBit=tBit;
handles.output.UserData.NAmostras=NAm;
cod_linha=handles.nrzBE.Value + handles.nrzUE.Value*2; %cod_linha= 0 ou 1 ou 2

[data, time, EnSin]=Em_Codigo_Linha(cod_linha, RxFile, ampCL, NAm, tBit);
handles.output.UserData.Em_CodLin=data;
handles.output.UserData.Time_Vect=time;


%Modulação Digital
modDig=handles.OOK.Value + handles.FSK.Value*2; %modDig= 0 ou 1 ou 2
ampMD=str2double(handles.AmpMD.String);
freqH=str2double(handles.FreqH.String);
freqL=str2double(handles.FreqL.String);
[data, EnSin]=Em_Mod_Dig(modDig, data, ampCL, ampMD, tBit, freqH, freqL, NAm, EnSin);
handles.output.UserData.Em_ModDig=data;

%Valores da BER, simulação da BER e transmissão da mensagem
if(handles.output.UserData.Trans_Type ~= cod_linha + 4*modDig+4)
    handles.output.UserData.Trans_Type=cod_linha + 4*modDig+4;
    handles.output.UserData.Trans_BER=[];
    handles.output.UserData.Trans_SNR=[];
end

aten=str2double(handles.Aten.String);
SNR=str2double(handles.SNR.String);
data=canal_fisico(EnSin, SNR, data, aten);
handles.output.UserData.Trans_SNR=[handles.output.UserData.Trans_SNR SNR];

handles.output.UserData.Rec_ModDig=data;
data=Re_Mod_Dig(modDig, cod_linha, data, freqH, ampMD, ampCL, NAm, tBit);


handles.output.UserData.Rec_CodLin=data;
emit_file=RxFile;
RxFile=Re_Codigo_Linha(cod_linha, emit_file, data, ampCL, NAm);

handles.output.UserData.Trans_BER= calculate_transmition_BER(emit_file, ...
                                                             RxFile,...
                                        handles.output.UserData.Trans_BER);


%Descodificação Canal
[RxFile]=decodCanal(RxFile, canal);

%Decriptografia
if(cifra>0)
    RxFile=one_time_pad_decipher(RxFile,key);
end
handles.output.UserData.Decifrado=RxFile;

%Descodificação Fonte
[RxFile]=decodFonte(RxFile, fonte, dict);

%guarda o ficheiro resultante em memória para puder ser logo aberto e analisado
handles.output.UserData.RxFile=RxFile;

set(handles.abrirFileRX,'Enable','On');
set(handles.cifraTextoClaro,'Enable','On');
set(handles.cifraCriptograma,'Enable','On');
set(handles.cifraTextoDecifrado,'Enable','On');
set(handles.EmButCodLin, 'Enable', 'On');
set(handles.RecButCodLin, 'Enable', 'On');
set(handles.EmButModDig, 'Enable', 'On');
set(handles.RecButModDig, 'Enable', 'On');
handles.BBER.Enable='On';



% --- Executes on button press in abrirFileRX.
function abrirFileRX_Callback(hObject, eventdata, handles)
% hObject    handle to abrirFileRX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output.UserData.HistFilename=handles.output.UserData.RxFile;



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

%Cálculo da entropia, do número de bits e apresentação do histograma
[H,nBits]=entropy_histogram(handles.output.UserData.HistFilename);
handles.checkPortion.Enable='Off';
set(handles.slider, 'Enable', 'Off');
%Apresentação do número de bits e da entropia do ficheiro
handles.HistNumBits.String=strcat("#bits = ",num2str(nBits));
handles.entropiaVal.String=num2str(H);

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
type(handles.output.UserData.Claro)

% --- Executes on button press in cifraCriptograma.
function cifraCriptograma_Callback(hObject, eventdata, handles)
% hObject    handle to cifraCriptograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
type(handles.output.UserData.Criptograma)

% --- Executes on button press in cifraTextoDecifrado.
function cifraTextoDecifrado_Callback(hObject, eventdata, handles)
% hObject    handle to cifraTextoDecifrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
type(handles.output.UserData.Decifrado)


function ValBER_Callback(hObject, eventdata, handles)
% hObject    handle to ValBER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ValBER as text
%        str2double(get(hObject,'String')) returns contents of ValBER as a double


% --- Executes during object creation, after setting all properties.
function ValBER_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ValBER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PowBER_Callback(hObject, eventdata, handles)
% hObject    handle to PowBER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PowBER as text
%        str2double(get(hObject,'String')) returns contents of PowBER as a double


% --- Executes during object creation, after setting all properties.
function PowBER_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PowBER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if(handles.checkPortion.Value>0)
   graph_window(handles.histogramAxes, handles.output.UserData.XAxisLim,...
       handles.output.UserData.Time_Vect, ...
       handles.output.UserData.NAmostras, handles.slider.Value);
end

% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in checkPortion.
function checkPortion_Callback(hObject, eventdata, handles)
% hObject    handle to checkPortion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkPortion
if(handles.checkPortion.Value>0)
   graph_window(handles.histogramAxes, handles.output.UserData.XAxisLim,...
       handles.output.UserData.Time_Vect, ...
       handles.output.UserData.NAmostras, handles.slider.Value);
else
    handles.histogramAxes.XLim=handles.output.UserData.XAxisLim;
end



function TBit_Callback(hObject, eventdata, handles)
% hObject    handle to TBit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TBit as text
%        str2double(get(hObject,'String')) returns contents of TBit as a double


% --- Executes during object creation, after setting all properties.
function TBit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TBit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TBitUnit_Callback(hObject, eventdata, handles)
% hObject    handle to TBitUnit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TBitUnit as text
%        str2double(get(hObject,'String')) returns contents of TBitUnit as a double


% --- Executes during object creation, after setting all properties.
function TBitUnit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TBitUnit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AmpMD_Callback(hObject, eventdata, handles)
% hObject    handle to AmpMD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AmpMD as text
%        str2double(get(hObject,'String')) returns contents of AmpMD as a double


% --- Executes during object creation, after setting all properties.
function AmpMD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AmpMD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FreqH_Callback(hObject, eventdata, handles)
% hObject    handle to FreqH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreqH as text
%        str2double(get(hObject,'String')) returns contents of FreqH as a double


% --- Executes during object creation, after setting all properties.
function FreqH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreqH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CodLinAmp_Callback(hObject, eventdata, handles)
% hObject    handle to CodLinAmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CodLinAmp as text
%        str2double(get(hObject,'String')) returns contents of CodLinAmp as a double


% --- Executes during object creation, after setting all properties.
function CodLinAmp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CodLinAmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAmostr_Callback(hObject, eventdata, handles)
% hObject    handle to NAmostr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAmostr as text
%        str2double(get(hObject,'String')) returns contents of NAmostr as a double


% --- Executes during object creation, after setting all properties.
function NAmostr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAmostr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in EmButModDig.
function EmButModDig_Callback(hObject, eventdata, handles)
% hObject    handle to EmButModDig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(handles.output.UserData.Time_Vect, handles.output.UserData.Em_ModDig);
handles.histogramAxes.YLim=[handles.histogramAxes.YLim(1)-1 handles.histogramAxes.YLim(2)+1];
handles.checkPortion.Enable='On';
set(handles.slider, 'Enable', 'On');
handles.output.UserData.XAxisLim=handles.histogramAxes.XLim;
if(handles.checkPortion.Value>0)
   graph_window(handles.histogramAxes, handles.output.UserData.XAxisLim,...
       handles.output.UserData.Time_Vect,  ...
       handles.output.UserData.NAmostras, handles.slider.Value);
end

% --- Executes on button press in RecButModDig.
function RecButModDig_Callback(hObject, eventdata, handles)
% hObject    handle to RecButModDig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(handles.output.UserData.Time_Vect, handles.output.UserData.Rec_ModDig);
handles.histogramAxes.YLim=[handles.histogramAxes.YLim(1)-1 handles.histogramAxes.YLim(2)+1];
handles.checkPortion.Enable='On';
set(handles.slider, 'Enable', 'On');
handles.output.UserData.XAxisLim=handles.histogramAxes.XLim;
if(handles.checkPortion.Value>0)
   graph_window(handles.histogramAxes, handles.output.UserData.XAxisLim,...
       handles.output.UserData.Time_Vect,  ...
       handles.output.UserData.NAmostras, handles.slider.Value);
end

% --- Executes on button press in EmButCodLin.
function EmButCodLin_Callback(hObject, eventdata, handles)
% hObject    handle to EmButCodLin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(handles.output.UserData.Time_Vect, handles.output.UserData.Em_CodLin);
handles.histogramAxes.YLim=[handles.histogramAxes.YLim(1)-1 handles.histogramAxes.YLim(2)+1];
handles.checkPortion.Enable='On';
set(handles.slider, 'Enable', 'On');
handles.output.UserData.XAxisLim=handles.histogramAxes.XLim;
if(handles.checkPortion.Value>0)
   graph_window(handles.histogramAxes, handles.output.UserData.XAxisLim,...
       handles.output.UserData.Time_Vect,  ...
       handles.output.UserData.NAmostras, handles.slider.Value);
end




% --- Executes on button press in RecButCodLin.
function RecButCodLin_Callback(hObject, eventdata, handles)
% hObject    handle to RecButCodLin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(handles.output.UserData.Time_Vect, handles.output.UserData.Rec_CodLin);
handles.histogramAxes.YLim=[handles.histogramAxes.YLim(1)-1 handles.histogramAxes.YLim(2)+1];
handles.checkPortion.Enable='On';
set(handles.slider, 'Enable', 'On');
handles.output.UserData.XAxisLim=handles.histogramAxes.XLim;
if(handles.checkPortion.Value>0)
   graph_window(handles.histogramAxes, handles.output.UserData.XAxisLim,...
       handles.output.UserData.Time_Vect,  ...
       handles.output.UserData.NAmostras, handles.slider.Value);
end



function FreqL_Callback(hObject, eventdata, handles)
% hObject    handle to FreqL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreqL as text
%        str2double(get(hObject,'String')) returns contents of FreqL as a double


% --- Executes during object creation, after setting all properties.
function FreqL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreqL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FSK.
function FSK_Callback(hObject, eventdata, handles)
% hObject    handle to FSK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FSK
handles.FreqL.Enable='On';



% --- Executes on button press in OOK.
function OOK_Callback(hObject, eventdata, handles)
% hObject    handle to OOK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of OOK
handles.FreqL.Enable='Off';



% --- Executes on button press in AusModDig.
function AusModDig_Callback(hObject, eventdata, handles)
% hObject    handle to AusModDig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AusModDig
handles.FreqL.Enable='Off';




function Aten_Callback(hObject, eventdata, handles)
% hObject    handle to Aten (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Aten as text
%        str2double(get(hObject,'String')) returns contents of Aten as a double


% --- Executes during object creation, after setting all properties.
function Aten_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Aten (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SNR_Callback(hObject, eventdata, handles)
% hObject    handle to SNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SNR as text
%        str2double(get(hObject,'String')) returns contents of SNR as a double


% --- Executes during object creation, after setting all properties.
function SNR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BBER.
function BBER_Callback(hObject, eventdata, handles)
% hObject    handle to BBER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.checkPortion.Enable='Off';
set(handles.slider, 'Enable', 'Off');
plot(handles.output.UserData.Trans_SNR, handles.output.UserData.Trans_BER);