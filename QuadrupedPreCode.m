%% Quadruped Joint Angle Tool
%Takes in .csv files and spits out a

% Uses determineTheta && checkAngle

clear;
clear global;
close force all;
clc;

global S D;

    
S.fh = figure('Units','Pixels','Position',[10 100 500 500],...
'Name','Quadruped Joint Angle Tool','MenuBar','None','Resize','off');
S.tx(1) = uicontrol('Style','Text','Unit','Pixels','Background',...
    get(S.fh,'Color'),'Position',[120 420 250 60],'Fontsize',19,...
    'String',{'Quadruped Joint Angle Tool'},'Fontweight','bold');
S.an1 = annotation('rectangle',[0.2365 0.82 0.50 0.16]);    
S.pb(1) = uicontrol('Style','Pushbutton','Units','Pixels','Position',...
    [15 340 110 40],'Fontsize',10,'FontWeight','bold','String','Load File');
S.tx(2) = uicontrol('Style','Text','Unit','Pixels','Background',[0.75 0.75 0.75],...
    'Position',[130 340 350 40],'Fontsize',12,'String','File Name: ',...
    'HorizontalAlignment','left');
S.tx(3) = uicontrol('Style','Text','Unit','Pixels','Background',get(S.fh,'Color'),...
    'Position',[15 290 100 30], 'String','Select Direction of Movement',...
    'Fontsize', 10);
S.pu(1) = uicontrol('Style','Popupmenu','Units','Pixels','Position',...
    [15 260 110 20],'String',{'Direction List','Auto Detect','Left to Right =>','Right to Left <='});
S.pb(2) = uicontrol('Style','Pushbutton','Units','Pixels','Position',...
    [15 200 110 40],'Fontsize',10,'FontWeight','bold','String','Process Data');
S.pb(3) = uicontrol('Style','Pushbutton','Units','Pixels','Position',...
    [15 140 110 40],'Fontsize',10,'FontWeight','bold','String','Display Graphs');
S.pb(4) = uicontrol('Style','Pushbutton','Units','Pixels','Position',...
    [15 85 110 40],'Fontsize',10,'FontWeight','bold','String','Export Data');
S.ed(2) = uicontrol('Style','Edit','Units','Pixels','Position',[175 85 275 40],...
    'String','Export File Name');
S.pb(5) = uicontrol('Style','Pushbutton','Units','Pixels','Position',...
    [15 30 110 40],'Fontsize',10,'FontWeight','bold','String','Reset');
S.tx(4) = uicontrol('Style','Text','Unit','Pixels','Background',get(S.fh,'Color'),...
    'Position',[200 220 210 100], 'String',{'If center of mass percentage between shoulder and hip',... 
    'is known, check box and enter number below.'},'Fontsize', 10, 'FontWeight','bold');
S.cb(1) = uicontrol('Style','Checkbox','Unit','Pixels','Background',get(S.fh,'Color'),...
    'Position',[200 210 150 20],'Value',0,'String','Center of Mass Known?');
S.ed(1) = uicontrol('Style','Edit','Units','Pixels','Position',[340 200 100 40],...
    'String','Enter CoM Here');
S.an2 = annotation('rectangle',[0.35 0.355 0.55 0.3]); 


set(S.pb(1),'callback',{@pb_call_1,S}); % Load File Button
set(S.pb(2),'callback',{@pb_call_2,S}); % Process Data Button
set(S.pb(3),'callback',{@pb_call_3,S}); % Display Graphs Button

D.dir = 'none';

function [] = pb_call_1(varargin)
global S;
global D;
[FileName, PathName,~] = uigetfile('*.csv');
if FileName == 0
else
    cd(PathName);
    fn = get(S.tx(2),'String'); % Get String Name
    DispFileName = strcat(fn,{'  '},FileName); % Concatenate File name to 'File Name:' String
    set(S.tx(2),'String',DispFileName);
    fid = fopen(FileName,'rt');
    D.data = textscan(fid,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f','Delimiter',',',...
        'HeaderLines',1);
    fclose(fid);
    
end
end

function [] = pb_call_2(varargin)
global D;
global S;
direction = get(S.pu(1),'Value');
CoMknown = get(S.cb(1),'Value');
switch direction
    case 1
        msgbox('Pick auto-detect or an actual direction.','Warning');
        D.dir = 'none';
    case 2
        % Check if point 4 is greater or less than point 5 (shoulder and
        % hips respectively)
        % If no points to use for detection, ask for manual direction or
        % for user to go back into data to fix.
        vec = length(D.data{1,7});
        for i = 1:vec
            val_1 = D.data{1,7}(i,1);
            val_2 = D.data{1,9}(i,1);
            if (~isnan(val_1))
                if (~isnan(val_2))
                    if (val_1 > val_2)
                        D.dir = 'lr';
                        break;
                    elseif (val_2 > val_1)
                        D.dir = 'rl';
                        break;
                    end
                end 
            end
            if (i==vec)
                D.dir = 'none';
                msgbox({'Direction can not be determined from the data imported.'...
                    'Either put the direction in manually or edit the raw data.'},...
                    'Direction Error!');
            end
        end
    case 3
        D.dir = 'lr';
    case 4
        D.dir = 'rl';
    otherwise
end
ptAmount = length(D.data{1,1});
for i = 1:ptAmount
    pt1 = [D.data{1,1}(i), D.data{1,2}(i)];
    pt2 = [D.data{1,3}(i), D.data{1,4}(i)];
    pt3 = [D.data{1,5}(i), D.data{1,6}(i)];
    pt4 = [D.data{1,7}(i), D.data{1,8}(i)];
    pt5 = [D.data{1,9}(i), D.data{1,10}(i)];
    pt6 = [D.data{1,11}(i), D.data{1,12}(i)];
    pt7 = [D.data{1,13}(i), D.data{1,14}(i)];
    pt8 = [D.data{1,15}(i), D.data{1,16}(i)];
    D.angles(i,1) = determineTheta('123',pt1,pt2,pt3);
    
    D.angles(i,2) = determineTheta('234',pt2,pt3,pt4);
    D.angles(i,3) = determineTheta('34N',pt3,pt4);
    
    D.angles(i,4) = determineTheta('N56',pt5,pt6);
    
    D.angles(i,5) = determineTheta('567',pt5,pt6,pt7);
    D.angles(i,6) = determineTheta('678',pt6,pt7,pt8);
    
end

if (CoMknown == 1)
   CoM = get(S.ed(1),'String');
   CoM = str2double(CoM);
   CoM = CoM / 100;
   if strcmp(D.dir,'rl')
       tempX = pt5(1,1) - pt4(1,1);
       CoM_X = pt4(1,1) + (tempX * CoM);
       if pt5(1,2) ~= pt4(1,2)
           tempY = pt5(1,2) - pt4(1,2);
           CoM_Y = pt4(1,2) + (tempY * CoM);
       elseif pt5(1,2) == pt4(1,2)
           CoM_Y = pt4(1,2);
       end
   elseif strcmp(D.dir,'lr')
       tempX = pt4(1,1) - pt5(1,1);
       CoM_X = pt5(1,1) + (tempX * CoM);
       if pt5(1,2) ~= pt4(1,2)
           tempY = pt5(1,2) - pt4(1,2);
           CoM_Y = pt4(1,2) + (tempY * CoM);
       elseif pt5(1,2) == pt4(1,2)
           CoM_Y = pt5(1,2);
       end
   else
   end
   CoMpos = [CoM_X, CoM_Y];
   theta1 = zeros(ptAmount,1);
   theta8 = zeros(ptAmount,1);
   for k = 1:ptAmount
       pt1 = [D.data{1,1}(k), D.data{1,2}(k)];
       pt8 = [D.data{1,15}(k), D.data{1,16}(k)];
       floorCoMa1 = [CoMpos(1,1), pt1(1,2)];
       floorCoMa8 = [CoMpos(1,1), pt8(1,2)];
       a1 = abs(pt1(1,1) - floorCoMa1(1,1));
       a8 = abs(pt8(1,1) - floorCoMa8(1,1));
       b = CoMpos(1,2);
       c1 = sqrt(b^2 + a1^2);
       c8 = sqrt(b^2 + a8^2);
       theta1(k,1) = acosd((a1^2 - b^2 - c1^2)/(-2*b*c1));
       theta8(k,1) = acosd((a8^2 - b^2 - c8^2)/(-2*b*c8));
   end
   ForelimbCoM = theta1;
   HindlimbCoM = theta8;
else
    %Continue?
end

Wrist = D.angles(:,1);
Elbow = D.angles(:,1);
Shoulder = D.angles(:,1);
Hip = D.angles(:,1);
Knee = D.angles(:,1);
Ankle = D.angles(:,1);

for m = 1:ptAmount
    
end

if (CoMknown == 1)
    D.T = table(Wrist,Elbow,Shoulder,Hip,Knee,Ankle,ForelimbCoM,HindlimbCoM);
elseif (CoMknown == 0)
    D.T = table(Wrist,Elbow,Shoulder,Hip,Knee,Ankle);
end
%Write ALL THIS TO .XLSX FILE for EXPORT


% Needs a scaling factor at the end
%matlength = length(Data) - 1;
% scale = 100/matlength;
% xnew = [0:scale:100];
% x= [0:1:100];
% scaledata = interp1(xnew,Data,x);

end

function [] = pb_call_3(varargin)
global D;
if(strcmp(D.dir,'none'))
    
elseif (strcmp(D.dir,'lr'))
    
elseif(strcmp(D.dir,'rl'))
    
end
    
end

function [] = pb_call_4(varargin)

end

function [] = pb_call_5(varargin)

end



