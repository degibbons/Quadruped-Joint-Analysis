%% Determine the point order from left to right

function [ptXOrder] = determineXOrder(point1,point2,point3)
if ((point1(1,1) < point2(1,1)) && (point1(1,1) < point3(1,1)))
    if (point2(1,1) < point3(1,1))
        ptXOrder = '123';
    elseif (point3(1,1) < point2(1,1))
        ptXOrder = '132';
    elseif (point2(1,1) == point3(1,1))
        ptXOrder = '1N';
    else
        
    end
elseif ((point2(1,1) < point1(1,1)) && (point2(1,1) < point3(1,1)))
    if (point1(1,1) < point3(1,1))
        ptXOrder = '213';
    elseif (point3(1,1) < point1(1,1))
        ptXOrder = '231';
    elseif (point1(1,1) == point3(1,1))
        ptXOrder = '2N';
    else
        
    end
elseif ((point3(1,1) < point1(1,1)) && (point3(1,1) < point2(1,1)))
    if (point1(1,1) < point2(1,1))
        ptXOrder = '312';
    elseif (point2(1,1) < point1(1,1))
        ptXOrder = '321';
    elseif (point1(1,1) == point2(1,1))
        ptXOrder = '3N';
    else
        
    end
elseif (((point1(1,1) == point2(1,1)) && (point1(1,1) ~= point3(1,1))) || (((point1(1,1) == point3(1,1)) && (point1(1,1) ~= point2(1,1)))) ...
        || ((point2(1,1) == point3(1,1)) && point2(1,1) ~= point3(1,1)))
    if (point1(1,1) == point2(1,1))
        ptXOrder = 'N3';
    elseif (point1(1,1) == point3(1,1))
        ptXOrder = 'N2';
    elseif (point2(1,1) == point3(1,1))
        ptXOrder = 'N1';
    end
elseif ((point1(1,1) == point2(1,1)) && (point1(1,1) == point3(1,1)) && (point2(1,1) == point3(1,1)))
    ptXOrder = 'NN';
end
end