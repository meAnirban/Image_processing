function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 25-Oct-2016 21:28:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_OutputFcn, ...
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


% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in axes1.
function rgb_Callback(hObject, eventdata, handles)
global rgb 
[a b]=uigetfile('*.*','All Files');
rgb=imread([b a]);
imshow(rgb,'parent',handles.axes1);
%%for green gray_image
global g
g=rgb;
g=rgb(:,:,2);
imshow(g,'parent',handles.green);
%%for red gray_image
global r
r=rgb;
r=rgb(:,:,1);
imshow(r,'parent',handles.red);
%%for blue gray_image
global b
b=rgb;
b=rgb(:,:,3);
imshow(b,'parent',handles.blue);





% --- Executes on button press in mean.
function mean_Callback(hObject, eventdata, handles)
% hObject    handle to mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g
g=double(g);
[row col]=size(g);
meanG=sum(g(:))/(row*col);
 set(handles.text3,'string',num2str(meanG));
 
global r
 r=double(r);
meanR=sum(r(:))/(row*col);
set(handles.text5,'string',num2str(meanR));

global b
b=double(b);
meanB=sum(b(:))/(row*col);
set(handles.text4,'string',num2str(meanB));

% Hint: get(hObject,'Value') returns toggle state of mean

% --- Executes on button press in median.
function median_Callback(hObject, eventdata, handles)
% hObject    handle to median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r
[row col]=size(r);
 E=sort(r(:));
 num=round((row*col)/2);

 if( (mod(row,2)==0) || (mod(col,2)==0) )
     medianR=(E(num)+E(num+1))/2;
    
 else
     medianR=E(num);
 end
set(handles.text6,'string',num2str(medianR));

global g
 F=sort(g(:));
 if( (mod(row,2)==0) || (mod(col,2)==0) )
     medianG=(F(num)+F(num+1))/2;
    
 else
     medianG=F(num);
 end
set(handles.text7,'string',num2str(medianG));

global b
 H=sort(b(:));
 if( (mod(row,2)==0) || (mod(col,2)==0) )
     medianB=(H(num)+H(num+1))/2;
    
 else
     medianB=H(num);
 end
set(handles.text8,'string',num2str(medianB));


% Hint: get(hObject,'Value') returns toggle state of median


% --- Executes on button press in mode.
function mode_Callback(hObject, eventdata, handles)
% hObject    handle to mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r
X=reshape(r,[],1);
 min1R=min(X);
 max1R=max(X);
 D=hist(X,min1R:max1R);
 D1=find(D==max(D));
 modeR=D1(1)+min1R-1;
 set(handles.text9,'string',num2str(modeR));
 
 global g
Y=reshape(g,[],1);
 min1G=min(Y);
 max1G=max(Y);
 A=hist(Y,min1G:max1G);
 A1=find(A==max(A));
 modeG=A1(1)+min1G-1;
 set(handles.text10,'string',num2str(modeG));
 
 global b
Z=reshape(b,[],1);
 min1B=min(Z);
 max1B=max(Z);
 I=hist(Z,min1B:max1B);
 I1=find(I==max(I));
 modeB=I1(1)+min1B-1;
 set(handles.text11,'string',num2str(modeB));
% Hint: get(hObject,'Value') returns toggle state of mode


% --- Executes on button press in standrddev.
function standrddev_Callback(hObject, eventdata, handles)
% hObject    handle to standrddev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global r
[row col]=size(r);
r=double(r);
meanR=sum(r(:))/(row*col);
diffR=(r-meanR).^2;
sumVARR=sum(diffR(:));
varR=sumVARR/(row*col);
stdR=sqrt(varR);
set(handles.text12,'string',num2str(stdR));

global g
g=double(g);
meanG=sum(g(:))/(row*col);
diffG=(g-meanG).^2;
sumVARG=sum(diffG(:));
varG=sumVARG/(row*col);
stdG=sqrt(varG);
set(handles.text13,'string',num2str(stdG));

global b
b=double(b);
meanB=sum(b(:))/(row*col);
diffB=(b-meanB).^2;
sumVARB=sum(diffB(:));
varB=sumVARB/(row*col);
stdB=sqrt(varB);
set(handles.text14,'string',num2str(stdB));

% Hint: get(hObject,'Value') returns toggle state of standrddev


% --- Executes on button press in var.
function var_Callback(hObject, eventdata, handles)
% hObject    handle to var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r
[row col]=size(r);
r=double(r);
meanR=sum(r(:))/(row*col);
diffR=(r-meanR).^2;
sumVARR=sum(diffR(:));
varR=sumVARR/(row*col);
set(handles.text15,'string',num2str(varR));

global g
g=double(g);
meanG=sum(g(:))/(row*col);
diffG=(g-meanG).^2;
sumVARG=sum(diffG(:));
varG=sumVARG/(row*col);
set(handles.text16,'string',num2str(varG));

global b
b=double(b);
meanB=sum(b(:))/(row*col);
diffB=(b-meanB).^2;
sumVARB=sum(diffB(:));
varB=sumVARB/(row*col);
set(handles.text17,'string',num2str(varB));

% Hint: get(hObject,'Value') returns toggle state of var


% --- Executes on button press in skew.
function skew_Callback(hObject, eventdata, handles)
% hObject    handle to skew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r
[row col]=size(r);
nop=(row*col);
r=double(r);
meanRS=sum(r(:))/nop;
diffRS=(r-meanRS).^2;
sumVARRS=sum(diffRS(:));
varRS=sumVARRS/nop;
stdRS=sqrt(varRS);
nmtrRS=(r-meanRS).^3;
sumRS=sum(nmtrRS(:));
skewR=sumRS/(nop*((stdRS)^3));
set(handles.text18,'string',num2str(skewR));


global g
g=double(g);
meanGS=sum(g(:))/nop;
diffGS=(g-meanGS).^2;
sumVARGS=sum(diffGS(:));
varGS=sumVARGS/nop;
stdGS=sqrt(varGS);
nmtrGS=(g-meanGS).^3;
sumGS=sum(nmtrGS(:));
skewG=sumGS/(nop*((stdGS)^3));
set(handles.text19,'string',num2str(skewG));

global b
b=double(b);
meanBS=sum(b(:))/nop;
diffBS=(b-meanBS).^2;
sumVARBS=sum(diffBS(:));
varBS=sumVARBS/nop;
stdBS=sqrt(varBS);
nmtrBS=(b-meanBS).^3;
sumBS=sum(nmtrBS(:));
skewB=sumBS/(nop*((stdBS)^3));
set(handles.text20,'string',num2str(skewB));

% Hint: get(hObject,'Value') returns toggle state of skew


% --- Executes on button press in kurt.
function kurt_Callback(hObject, eventdata, handles)
% hObject    handle to kurt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global r
[row col]=size(r);
nop=(row*col);
r=double(r);
meanRK=sum(r(:))/nop;
diffRK=(r-meanRK).^2;
sumVARRK=sum(diffRK(:));
varRK=sumVARRK/nop;
nmtrRK=(r-meanRK).^4;
sumRK=sum(nmtrRK(:));
kurtR=sumRK/(nop*((varRK)^2));
set(handles.text21,'string',num2str(kurtR));


global g
g=double(g);
meanGK=sum(g(:))/nop;
diffGK=(g-meanGK).^2;
sumVARGK=sum(diffGK(:));
varGK=sumVARGK/nop;
nmtrGK=(g-meanGK).^4;
sumGK=sum(nmtrGK(:));
kurtG=sumGK/(nop*((varGK)^2));
set(handles.text22,'string',num2str(kurtG));

global b
b=double(b);
meanBK=sum(b(:))/nop;
diffBK=(b-meanBK).^2;
sumVARBK=sum(diffBK(:));
varBK=sumVARBK/nop;
nmtrBK=(b-meanBK).^4;
sumBK=sum(nmtrBK(:));


kurtB=sumBK/(nop*((varBK)^2));
set(handles.text23,'string',num2str(kurtB));

% Hint: get(hObject,'Value') returns toggle state of kurt


% --- Executes on button press in pushbutton4.


% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global It25

adaptive()
axes(handles.axes9);
imshow(It25);

function [Image]=adaptive( )
global rgb
global It25

rgb=rgb2gray(rgb);
It25=blkproc(rgb,[25,25],@adapt);
%It10=blkproc(rgb,[10,10],@adapt);
%It5=blkproc(rgb,[5,5],@adapt);


function [y]=adapt(x)
if(std2(x)<1)
    y=ones(size(x,1),size(x,2));
else
    y=im2bw(x,graythresh(x));
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global It10

adaptive1()
axes(handles.axes9);
imshow(It10);

function [Image1]=adaptive1( )
global rgb
global It10


rgb=rgb2gray(rgb);
It10=blkproc(rgb,[10,10],@adapt1);



function [w]=adapt1(v)
if(std2(v)<1)
    w=ones(size(v,1),size(v,2));
else
    w=im2bw(v,graythresh(v));
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global It5

adaptive2()
axes(handles.axes9);
imshow(It5);

function [Image2]=adaptive2( )
global rgb
global It5

rgb=rgb2gray(rgb);
It5=blkproc(rgb,[5,5],@adapt2);


function [z]=adapt2(u)
if(std2(u)<1)
    z=ones(size(u,1),size(u,2));
else
    z=im2bw(u,graythresh(u));
end
