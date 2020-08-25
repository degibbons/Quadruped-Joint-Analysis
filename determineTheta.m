function [theta] = determineTheta(whatAngle,point1,point2,point3)

skip = 0;
if (isnan(point1(1,1)) || isnan(point1(1,2)) || isnan(point2(1,1)) || isnan(point2(1,2)))
    theta = NaN;
    skip = 1;
elseif (nargin == 4)
    if (isnan(point3(1,1)) || isnan(point3(1,2)))
    theta = NaN;
    skip = 1;
    end
end

if skip == 0
    switch nargin
        case 3
            if (strcmp(whatAngle,'34N'))
                temp1 = [point2(1,1), point1(1,2)];
                a = abs(temp1(1,1) - point1(1,1));
                b = abs(point2(1,2) - temp1(1,2));
                c = sqrt(a^2 + b^2);
            elseif (strcmp(whatAngle,'N56'))
                temp1 = [point1(1,1), point2(1,2)];
                a = abs(point2(1,1) - temp1(1,1));
                b = abs(point1(1,2) - temp1(1,2));
                c = sqrt(a^2 + b^2);
            else
                sprintf('Not Enough Input Arguments to Function')
            end
            theta = acosd((a^2 - b^2 - c^2)/(-2 * b * c));
        case 4
            temp1 = [point1(1,1),point2(1,2)];
            temp2 = [point3(1,1),point2(1,2)];
            
            b = sqrt((abs(point1(1,2) - temp1(1,2)))^2 + (abs(point2(1,1) - temp1(1,1)))^2);
            c = sqrt((abs(point3(1,2) - temp2(1,2)))^2 + (abs(point2(1,1) - temp2(1,1)))^2);
            a = sqrt((abs(point1(1,1) - point3(1,1)))^2 + (abs(point1(1,2) - point3(1,2)))^2);
            
            theta = acosd((a^2 - b^2 - c^2)/(-2 * b * c));
        otherwise
            sprintf('Not Enough Input Arguments to Function')
    end
end
end