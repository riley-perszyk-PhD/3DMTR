function [pdbGI,varGI,varI] = pdbResRelatedToX(pbd2pbdG,pbdG2varG,varG2var,pdbResNum)
pdbGI=0;varGI=0;varI=0;

temp = find(pbd2pbdG(1,:)==pdbResNum);
pdbGI = pbd2pbdG(3,temp);
if (isempty(pdbGI))
    return;
end
if (pdbGI == 0)
    return;
end

temp = find(pbdG2varG(1,:)==pdbGI);
varGI = pbdG2varG(3,temp);
if varGI == 0
    return;
end

temp = find(varG2var(1,:)==varGI);
varI = varG2var(3,temp);
if varI == 0
    return;
end

end