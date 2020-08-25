function [normalPts] = whatsMissing(firstVar,secondVar)

if (strcmp(firstVar,'N')==1 || strcmp(firstVar,'M')==1)
    if (strcmp(secondVar,'1')==1)
        normalPts = '23';
    elseif (strcmp(secondVar,'2')==1)
        normalPts = '13';
    elseif (strcmp(secondVar,'3')==1)
        normalPts = '12';
    end
elseif (strcmp(secondVar,'N')==1 || strcmp(secondVar,'M')==1)
    if (strcmp(firstVar,'1')==1)
        normalPts = '23';
    elseif (strcmp(firstVar,'2')==1)
        normalPts = '13';
    elseif (strcmp(firstVar,'3')==1)
        normalPts = '12';
    end
end

end