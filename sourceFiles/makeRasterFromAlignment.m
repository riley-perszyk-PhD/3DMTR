function [RasCX RasCY RasWX RasWY] = makeRasterFromAlignment(align)

correctRes = [];
wrongRes = [];
for i = 1:size(align,2)
    if align(1,i) == align(3,i)
        correctRes = [correctRes 1];
        wrongRes = [wrongRes 0];
    else
        if (align(1,i) == 'X' || align(3,i) == 'X') || (align(1,i) == '-' || align(3,i) == '-')
            correctRes = [correctRes 0];
            wrongRes = [wrongRes 0];
            continue;
        end
        correctRes = [correctRes 0];
        wrongRes = [wrongRes 1];
    end
end
[RasCX RasCY] = makeRasterFromBinary(correctRes);
[RasWX RasWY] = makeRasterFromBinary(wrongRes);