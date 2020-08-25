%% Determine the point orientation from bottom to top

function [ptYOrder] = determineYOrder(point1,point2,point3)

if ((point1(1,2) < point2(1,2)) && (point1(1,2) < point3(1,2)))
    if (point2(1,2) < point3(1,2))
        ptYOrder = '123';
    elseif (point3(1,2) < point2(1,2))
        ptYOrder = '132';
    elseif (point2(1,2) == point3(1,2))
        ptYOrder = '1M';
    else
        
    end
elseif ((point2(1,2) < point1(1,2)) && (point2(1,2) < point3(1,2)))
    if (point1(1,2) < point3(1,2))
        ptYOrder = '213';
    elseif (point3(1,2) < point1(1,2))
        ptYOrder = '231';
    elseif (point1(1,2) == point3(1,2))
        ptYOrder = '2M';
    else
        
    end
elseif ((point3(1,2) < point1(1,2)) && (point3(1,2) < point2(1,2)))
    if (point1(1,2) < point2(1,2))
        ptYOrder = '312';
    elseif (point2(1,2) < point1(1,2))
        ptYOrder = '321';
    elseif (point1(1,2) == point2(1,2))
        ptYOrder = '3M';
    else
        
    end
elseif (((point1(1,2) == point2(1,2)) && (point1(1,2) ~= point3(1,2))) || (((point1(1,2) == point3(1,2)) && (point1(1,2) ~= point2(1,2)))) ...
        || ((point2(1,2) == point3(1,2)) && point2(1,2) ~= point3(1,2)))
    if (point1(1,2) == point2(1,2))
        ptYOrder = 'M3';
    elseif (point1(1,2) == point3(1,2))
        ptYOrder = 'M2';
    elseif (point2(1,2) == point3(1,2))
        ptYOrder = 'M1';
    end
elseif ((point1(1,2) == point2(1,2)) && (point1(1,2) == point3(1,2)) && (point2(1,2) == point3(1,2)))
    ptYOrder = 'MM';
end
end

