function [RasX RasY] = makeRasterFromBinary(b)
RasX = [];
RasY = [];
for i = 1:size(b,2)
    if b(i)
        RasX = [RasX [i;i]];
        RasY = [RasY [0;1]];
    end
end