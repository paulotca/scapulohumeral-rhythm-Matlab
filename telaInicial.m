function varargout = telaInicial(varargin)
% TELAINICIAL MATLAB code for telaInicial.fig
%      TELAINICIAL, by itself, creates a new TELAINICIAL or raises the existing
%      singleton*.
%
%      H = TELAINICIAL returns the handle to a new TELAINICIAL or the handle to
%      the existing singleton*.
%
%      TELAINICIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TELAINICIAL.M with the given input arguments.
%
%      TELAINICIAL('Property','Value',...) creates a new TELAINICIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before telaInicial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to telaInicial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help telaInicial

% Last Modified by GUIDE v2.5 23-Mar-2017 15:53:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @telaInicial_OpeningFcn, ...
                   'gui_OutputFcn',  @telaInicial_OutputFcn, ...
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

function setM(x)
global M
M = x;

function r = getGlobalM
global M
r = M;

function setM2(x)
global M2
M2 = x;

function r = getGlobalM2
global M2
r = M2;

% --- Executes just before telaInicial is made visible.
function telaInicial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to telaInicial (see VARARGIN)

% Choose default command line output for telaInicial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes telaInicial wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%handles.peaks=peaks(35);
%handles.membrane=membrane;
%[x,y] = meshgrid(-8:.5:8);
%r = sqrt(x.^2+y.^2) + eps;
%sinc = sin(r)./r;
%handles.sinc = sinc;
% Set the current data value.
%handles.current_data = handles.peaks;
%surf(handles.current_data)

% --- Outputs from this function are returned to the command line.
function varargout = telaInicial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botaoInicial.
function botaoInicial_Callback(hObject, eventdata, handles)
%handles.peaks=peaks(35);
%handles.membrane=membrane;
%[x,y] = meshgrid(-8:.5:8);
%r = sqrt(x.^2+y.^2) + eps;
%sinc = sin(r)./r;
%handles.sinc = sinc;
% Set the current data value.
%handles.current_data = handles.peaks;
%surf(handles.current_data)
%P = uigetfile('*.txt');
%mesh(P);
%T = importdata(uigetfile('*.txt'));
%T = uiimport;
%T = uigetfile('*.txt');
%T= uigetfile('*.txt');
[arquivo, caminho]=uigetfile('*.txt');
B=[caminho,arquivo]
%disp(B)
N = importdata(B);
setM(N)
%r = getGlobalM
wh = waitbar(0,'Salvando...');steps = 100;for step = 1:30;waitbar(step / 100);end 
    for step = 30:100;waitbar(step / 100);end
    close(wh)
meshc(handles.grafico , getGlobalM);
set(handles.grafico,'view',[0,-90]);

[arquivo, caminho]=uigetfile('*.txt');
B2=[caminho,arquivo]
%disp(B)
N2 = importdata(B2);
setM2(N2)
%r = getGlobalM
wh = waitbar(0,'Salvando...');steps = 100;for step = 1:30;waitbar(step / 100);end 
    for step = 30:100;waitbar(step / 100);end
    close(wh)
meshc(handles.axes2 , getGlobalM2);
set(handles.axes2,'view',[0,-90]);

% hObject    handle to botaoInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in botaoFInal.
function botaoFInal_Callback(hObject, eventdata, handles)
%set(handles.anguloMov,'String','Heleeeelo World!');
%filename = ('C:\Users\paulotca\Desktop\teste paul\perto.txt ');
%P=importdata(filename);

% meshc(handles.axes2 , getGlobalM2);
% set(handles.axes2,'view',[0,-90]);

% Matt = getGlobalM2;
% contour3(handles.axes2 , Matt);
% set(handles.axes2,'view',[0,-90]);


hold on;

Matt = getGlobalM2;
Matt2=  getGlobalM2;

ValorY=get(handles.omoY,'string');
ValorX=get(handles.omoX,'string');
ValorY=str2double(ValorY);
ValorX=str2double(ValorX);

% posX=Matt.Position(1);
% posY=Matt.Position(2);
% posZ=Matt.Position(3);
x1 = round(ValorY);
y1 = round(ValorX);

ii = x1 - 15;
jj = y1 -15;
iii = x1 +15;
jjj = y1 +15;


Cal1 = zeros(424,512);
Cal1= Cal1*NaN;
Cal2 = zeros(424,512);
Cal2= Cal2*NaN;

valorMaior = 9999;
valorMenor = 1;
MaiorX= 0;
MaiorY=0;
MenorX =0;
MenorY =0;
for j1 = ii:iii
          
    for h1=jj:jjj 
        varx = h1;
        
        if varx==jj
        valorMaior = Matt(j1,h1);
        valorMenor = Matt2(j1,h1);
        else
            if Matt(j1,h1)< valorMaior
                MaiorX=j1;
                MaiorY=h1;
                valorMaior = Matt(j1,h1);
            end
            if Matt2(j1,h1)< valorMenor
                MenorX=j1;
                MenorY=h1;
                valorMenor = Matt2(j1,h1);
            end
        end
    end
    
    %disp(Matt(MaiorX,MaiorY));
%     disp(MaiorX);
%     disp(MaiorY);
    %if MaiorX == 0 || MaiorY == 0
%     if MaiorX ~= 0 & MaiorY ~= 0
        Cal1(MaiorX,MaiorY)= 34;
        
        if MenorY ~= 0
        Cal2(MenorX,MenorY)= 200;
        pri = 1;
        end
%     end
end





mesh(Cal1);
if pri == 1
    mesh(Cal2);
end
view(0,-90);
hold off;
%plot(SALVO_X,SALVO_Y);

%meshc(P)
% hObject    handle to botaoFInal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
set(handles.anguloMov,'String','Hello World!');
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over botaoInicial.
function botaoInicial_ButtonDownFcn(hObject, eventdata, handles)
%set(handles.anguloMov,'String','Hello World!');

% hObject    handle to botaoInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function grafico_ButtonDownFcn(hObject, eventdata, handles)
set(handles.anguloMov,'String','Hello World!');
% hObject    handle to grafico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in buttonAngulo.
function buttonAngulo_Callback(hObject, eventdata, handles)

handle = mesh(getGlobalM)
get(handle)
set(handle,'AlignVertexCenters','on')
get(handle)
%set(handle,'PlotBoxAspectRatio',[1,0.75,0.75])
view(0,-90)

% hObject    handle to buttonAngulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function omoX_Callback(hObject, eventdata, handles)
% hObject    handle to omoX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of omoX as text
%        str2double(get(hObject,'String')) returns contents of omoX as a double


% --- Executes during object creation, after setting all properties.
function omoX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to omoX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function omoX2_Callback(hObject, eventdata, handles)
% hObject    handle to omoX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of omoX2 as text
%        str2double(get(hObject,'String')) returns contents of omoX2 as a double


% --- Executes during object creation, after setting all properties.
function omoX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to omoX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  for i = 1:2,
      
    h = datacursormode;
    set(h,'DisplayStyle','datatip','SnapToData','off');
    %Click = waitforbuttonpress;
    waitforbuttonpress;
    s = getCursorInfo(h);
    if i == 2,
        s.Position(3) = 0;
    end
    %if s.Position(3) == 0
    
        while s.Position(3) == 0
            h = datacursormode;
            set(h,'DisplayStyle','datatip','SnapToData','off');
            waitforbuttonpress;
            s = getCursorInfo(h);
           % if s.Position(3) == 0
            %disp(s.Position(3))
            %disp(i)
            %end
        end
   % else
    posX=s.Position(1);
    posY=s.Position(2);
    posZ=s.Position(3);
    if i == 1
         set(handles.omoX,'String',posX);
         set(handles.omoY,'String',posY);
         x1 = posX;
         y1 = posY;
         z1 = posZ;
         
    else
        set(handles.omoX2,'String',posX);
        set(handles.omoY2,'String',posY);
        x2 = posX;
        y2 = posY;
        z2 = posZ;
        
        %distanciaReal = (( x2^2 + y2^2 + t2^2 )^1/2) - (( x1^2 + y1^2 + t1^2 )^1/2);
        %distanciaReal = (( t2^2 + t1^2 )^0.5);
        %distanciaReal = ( x1*x2  + t1*t2);
        %ang = (( x1*x2 + t1*t2)/((( x2^2  + t2^2 )^0.5) * (( x1^2  + t1^2 )^0.5 )));
        %distanciaReal2 = ((( x2^2 + t2^2 )^0.5) * (( x1^2 + t1^2 )^0.5 ))*ang;
		
		%Zmedia Ã© a media entre os z em vez de pegar o central
        Zmedia = (z1 + z2)/2;
        
		%calculo da porcentagem na regra de 3
        YnaNovaDistancia = (Zmedia*5.39)/1698;
        XnaNovaDistancia = (Zmedia*4.7)/1696;
        
        % b = distancia em pixel entre os pontos, podendo ser tanto para x como para y
        b = ((x1-x2)^2 +(y1-y2)^2 +(z1-z2)^2)^0.5;
        
        %a1 = ((t1^2) - (z1^2))^0.5;
        %a2 = ((t2^2) - (z2^2))^0.5;
        %calcula a distancia em x ou y automaticamente, ele so da a maior distancia horizontal ou vertical
        if ((x1-x2)^2)>((y1-y2)^2)
            distanciaReal = b*XnaNovaDistancia;
        else
            distanciaReal = b*YnaNovaDistancia;
        end
        disp('distanciaReal');
        disp(distanciaReal);
        set(handles.dist,'String',distanciaReal);
        %set(handles.anguloMov,'String',ang);
        
        
        
        
    end
    
    
   % end
 end
 


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = datacursormode;
s = getCursorInfo(h);
pos = s.Position;


% --- Executes on button press in calcularArea.
function calcularArea_Callback(hObject, eventdata, handles)

  for i = 1:2,
    h = datacursormode;
    set(h,'DisplayStyle','datatip','SnapToData','off');
    waitforbuttonpress;
    s = getCursorInfo(h);
    if i == 2,
        s.Position(3) = 0;
    end
    %if s.Position(3) == 0
    
        while s.Position(3) == 0
            h = datacursormode;
            set(h,'DisplayStyle','datatip','SnapToData','off');
            waitforbuttonpress;
            s = getCursorInfo(h);
           % if s.Position(3) == 0
            %disp(s.Position(3))
            %disp(i)
            %end
        end
   % else
    posX=s.Position(1);
    posY=s.Position(2);
    posZ=s.Position(3);
    
    %Calculo da omoplata na primeira posição selecionada
    if i == 1
         set(handles.omoX,'String',posX);
         set(handles.omoY,'String',posY);
         x1 = posX;
         y1 = posY;
         z1 = posZ;
        
         
    else
        set(handles.omoX2,'String',posX);
        set(handles.omoY2,'String',posY);
        x2 = posX;
        y2 = posY;
        z2 = posZ;
        t = x2 - x1;
        
		%Zmedia Ã© a media entre os z em vez de pegar o central
        Zmedia = (z1 + z2)/2;
        
		%calculo da porcentagem na regra de 3
        YnaNovaDistancia = (Zmedia*5.39)/1698;
        XnaNovaDistancia = (Zmedia*4.7)/1696;
        
        % b = distancia em pixel entre os pontos, podendo ser tanto para x como para y
        b = ((x1-x2)^2 +(y1-y2)^2 +(z1-z2)^2)^0.5;
        
        %a1 = ((t1^2) - (z1^2))^0.5;
        %a2 = ((t2^2) - (z2^2))^0.5;
        %calcula a distancia em x ou y automaticamente, ele so da a maior distancia horizontal ou vertical
        if ((x1-x2)^2)>((y1-y2)^2)
            distanciaEntreAsOmoplatas = b*XnaNovaDistancia;
        else
            distanciaEntreAsOmoplatas = b*YnaNovaDistancia;
        end
        
        set(handles.dist,'String',distanciaEntreAsOmoplatas);
       % set(handles.dist,'text11',' Distancia entre as omo');
        
        %set(handles.anguloMov,'String',ang);
        
        %calculo da área
        MatPaProf = getGlobalM;
        
        %calculo para area de 1 coluna x uma linha
        lateralXVolume = 30*XnaNovaDistancia;
        lateralYVolume = 30*YnaNovaDistancia;
        AreaUnitaria = YnaNovaDistancia*XnaNovaDistancia;
        
        %Para a primeira seleção calculando area
        x1 = round(x1) ;
        y1 = round(y1) ;
        
        ii = x1 - 15;
        jj = y1 -15;
        iii = x1 +15;
        jjj = y1 +15;
        q=0;
        w=0;
        Cal1 = zeros(30);
        
        
        for j = ii:iii,
            
            for h=jj:jjj,
                
                if q == 0,
                    q =1;
                    w=1;
                end
                Cal1(q,w)= MatPaProf(j,h)*AreaUnitaria;
                q = q+1;
                w = w+1;
            end   
        end
       
        AreaOmoplata1 = 0;
    
        
        for j = 1:30,
            for h=1:30,
                AreaOmoplata1 = AreaOmoplata1+Cal1(j,h);
            end   
        end
        
        
        set(handles.disOmo1,'String',AreaOmoplata1);
        
        %Para a Segunda seleção calculando area
        x2 = round(x2) ;
        y2 = round(y2) ;
        
        ii = x2 - 15;
        jj = y2 -15;
        iii = x2 +15;
        jjj = y2 +15;
        q=0;
        w=0;
        Cal2 = zeros(30);
        
        
        for j = ii:iii,
            
            for h=jj:jjj,
                
                if q == 0,
                    q =1;
                    w=1;
                end
                Cal2(q,w)= MatPaProf(j,h)*AreaUnitaria;
                q = q+1;
                w = w+1;
            end   
        end
       
        AreaOmoplata2 = 0;
    
        
        for j = 1:30,
            for h=1:30,
                AreaOmoplata2 = AreaOmoplata2+Cal2(j,h);
            end   
        end
        set(handles.disOmo2,'String',AreaOmoplata2);

        
    end
    
    
    
  end
  

    
    
   % end
% hObject    handle to calcularArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function omoY2_Callback(hObject, eventdata, handles)
% hObject    handle to omoY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of omoY2 as text
%        str2double(get(hObject,'String')) returns contents of omoY2 as a double


% --- Executes during object creation, after setting all properties.
function omoY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to omoY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function omoY_Callback(hObject, eventdata, handles)
% hObject    handle to omoY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of omoY as text
%        str2double(get(hObject,'String')) returns contents of omoY as a double


% --- Executes during object creation, after setting all properties.
function omoY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to omoY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
