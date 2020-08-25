%% Determine what orientation the points are in to determine next steps

%NEED TO BREAK DOWN INTO FURTHER FUNCTIONS FOR EASIER EDITING AND MISTAKE
%HANDLING!!!

function [ptCase] = determinePointOrientation(ptXOrder,ptYOrder,direction,jointAngle)

%Joint Angle is 1 to 6 from front wrist to back ankle

xLength = length(ptXOrder);
yLength = length(ptYOrder);

if (xLength == 3)
    firstX = ptXOrder(1);
    secondX = ptXOrder(2);
    thirdX = ptXOrder(3);
elseif (xLength == 2)
    firstX = ptXOrder(1);
    secondX = ptXOrder(2);
    normalPts = whatsMissing(firstX,secondX);
elseif (xLength == 1)
    
end

if (yLength == 3)
    firstY = ptYOrder(1);
    secondY = ptYOrder(2);
    thirdY = ptYOrder(3);
elseif (yLength == 2)
    firstY = ptYOrder(1);
    secondY = ptYOrder(2);
    normalPts = whatsMissing(firstY,secondY);
elseif (yLength == 1)
    msgbox("Something has gone wrong with the data. Re-examine and try again")
end

orientX = -1;
orientY = -1;
jointCase = -1;

if xLength == 3
    if  (strcmp(firstX,'1') && strcmp(secondX,'2') && strcmp(thirdX,'3'))
        orientX = 1;
    elseif (strcmp(firstX,'3') && strcmp(secondX,'2') && strcmp(thirdX,'1'))
        orientX = 2;
    elseif (strcmp(firstX,'1') && strcmp(secondX,'3') && strcmp(thirdX,'2'))
        orientX = 3;
    elseif (strcmp(firstX,'3') && strcmp(secondX,'1') && strcmp(thirdX,'2'))
        orientX = 4;
    elseif (strcmp(firstX,'2') && strcmp(secondX,'1') && strcmp(thirdX,'3'))
        orientX = 5;
    elseif (strcmp(firstX,'2') && strcmp(secondX,'3') && strcmp(thirdX,'1'))
        orientX = 6;
    end
elseif xLength == 2
    if (strcmp(firstX,'1') && strcmp(secondX,'N'))
        orientX = 7;
    elseif (strcmp(firstX,'2') && strcmp(secondX,'N'))
        orientX = 8;
    elseif (strcmp(firstX,'3') && strcmp(secondX,'N'))
        orientX = 9;
    elseif (strcmp(firstX,'N') && strcmp(secondX,'1'))
        orientX = 10;
    elseif (strcmp(firstX,'N') && strcmp(secondX,'2'))
        orientX = 11;
    elseif (strcmp(firstX,'N') && strcmp(secondX,'3'))
        orientX = 12;
    elseif (strcmp(firstX,'N') && strcmp(secondX,'N'))
        orientX = 13;
    end
end

if yLength == 3
    if  (strcmp(firstY,'3') && strcmp(secondY,'2') && strcmp(thirdY,'1'))
        orientY = 1;
    elseif (strcmp(firstY,'1') && strcmp(secondY,'2') && strcmp(thirdY,'3'))
        orientY = 2;
    elseif (strcmp(firstY,'2') && strcmp(secondY,'1') && strcmp(thirdY,'3'))
        orientY = 3;
    elseif (strcmp(firstY,'2') && strcmp(secondY,'3') && strcmp(thirdY,'1'))
        orientY = 4;
    elseif (strcmp(firstY,'1') && strcmp(secondY,'3') && strcmp(thirdY,'2'))
        orientY = 5;
    elseif (strcmp(firstY,'3') && strcmp(secondY,'1') && strcmp(thirdY,'2'))
        orientY = 6;
    end
elseif yLength == 2
    if (strcmp(firstY,'1') && strcmp(secondY,'M'))
        orientY = 7;
    elseif (strcmp(firstY,'2') && strcmp(secondY,'M'))
        orientY = 8;
    elseif (strcmp(firstY,'3') && strcmp(secondY,'M'))
        orientY = 9;
    elseif (strcmp(firstY,'M') && strcmp(secondY,'1'))
        orientY = 10;
    elseif (strcmp(firstY,'M') && strcmp(secondY,'2'))
        orientY = 11;
    elseif (strcmp(firstY,'M') && strcmp(secondY,'3'))
        orientY = 12;
    elseif (strcmp(firstY,'M') && strcmp(secondY,'M'))
        orientY = 13;
    end
end

% DOUBLE CHECK N AND M ORIENTATIONS (OUT OF ORDER???)

% 1 = Fine As Is
% 2 = Check Slopes to determine scenario
% 3 = Angle Greater Than 180
% 4 = Negative Angle
% 5 = Exactly 180 degrees

if strcmp(direction,'rl')
    switch orientX
        case 1 % X = 123
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = 2;
                        case 2
                            ptCase = 2;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 2;
                        case 6
                            ptCase = 2;
                        otherwise
                            ptCase = 'Joint Angle Not Valid';
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = 2;
                        case 2
                            ptCase = 2;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 2;
                        case 6
                            ptCase = 2;
                        otherwise
                            ptCase = 'Joint Angle Not Valid';
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = 1;
                        case 2
                            ptCase = 1;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; %Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; %Does not matter
                        case 5
                            ptCase = 3;
                        case 6
                            ptCase = 1;
                        otherwise
                            ptCase = 'Joint Angle Not Valid';
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = 1;
                        case 2
                            ptCase = 1;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 3;
                        case 6
                            ptCase = 1;
                        otherwise
                            ptCase = 'Joint Angle Not Valid';                            
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = 3;
                        case 2
                            ptCase = 3;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 3;
                        case 6
                            ptCase = 1;
                        otherwise
                            ptCase = 'Joint Angle Not Valid';
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = 3;
                        case 2
                            ptCase = 3;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 3;
                        case 6
                            ptCase = 1;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = 3;
                        case 2
                            ptCase = 3;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5 
                            ptCase = 3;
                        case 6
                            ptCase = 1;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = 1;
                        case 2
                            ptCase = 1;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 1;
                        case 6
                            ptCase = 3;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = 3;
                        case 2
                            ptCase = 3;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 3;
                        case 6
                            ptCase = 1;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = 1;
                        case 2
                            ptCase = 1;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 1;
                        case 6
                            ptCase = 3;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = 3;
                        case 2
                            ptCase = 3;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 3;
                        case 6
                            ptCase = 1;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = 1;
                        case 2
                            ptCase = 1;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 1;
                        case 6
                            ptCase = 3;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = 5;
                        case 2
                            ptCase = 5;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 5;
                        case 6
                            ptCase = 5;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 2 % X = 321
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = 2;
                        case 2
                            ptCase = 2;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = 2;
                        case 6
                            ptCase = 2;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 3 % X = 132
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 4 % X = 312
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 5 % X = 213
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 6 % X = 231
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 4 % Should never be encountered, should always be N
                            ptCase = NaN; % Does not matter
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 7 % X = 1N
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 8 % X = 2N
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 9 % X = 3N
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 10 % X = N1
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 11 % X = N2
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 12 % X = N3
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
        case 13 % X = NN
            switch orientY
                case 1 % Y = 321
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 2 % Y = 123
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 3 % Y = 213
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 4 % Y = 231
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 5 % Y = 132
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 6 % Y = 312
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 7 % Y = 1M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 8 % Y = 2M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 9 % Y = 3M
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 10 % Y = M1
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 11 % Y = M2
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 12 % Y = M3
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
                case 13 % Y = MM
                    switch jointAngle
                        case 1
                            ptCase = ;
                        case 2
                            ptCase = ;
                        case 3
                            ptCase = ;
                        case 4
                            ptCase = ;
                        case 5
                            ptCase = ;
                        case 6
                            ptCase = ;
                        otherwise
                            ptCase = 'Joint Angle Not Valid'; 
                    end
            end
    end
    
    % NEED TO COPY FROM ABOVE AND THEN EDIT FOR DIRECTION!
elseif strcmp(direction,'lr')
    switch orientX
        case 1
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 2
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 3
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 4
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 5
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 6
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 7
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 8
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 9
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 10
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 11
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 12
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
        case 13 % X = NN
            switch orientY
                case 1
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 2
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 3
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 4
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 5
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 6
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 7
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 8
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 9
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 10
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 11
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 12
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
                case 13
                    switch jointAngle
                        case 1
                        case 2
                        case 3
                        case 4
                        case 5
                        case 6
                        otherwise
                    end
            end
    end
else
    
end



end