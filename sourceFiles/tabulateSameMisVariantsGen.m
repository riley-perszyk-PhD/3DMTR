function [varObserved varSeq] = tabulateSameMisVariantsGen(gnomAD,useAlleleCount)

varObserved = struct;

try
    annotation = gnomAD.Annotation;
catch
    annotation = gnomAD.VEPAnnotation;
end
try
    consequence = gnomAD.Consequence;
catch
    consequence = gnomAD.HGVSConsequence;
end
if useAlleleCount
    alleleCount = gnomAD.AlleleCount;
else
    alleleCount = ones(size(gnomAD.AlleleCount));
end

for i = 1:size(gnomAD,1)
    if strcmp(annotation{i},'missense_variant') %|| strcmp(annotation{i},'stop_gained')
        resN = str2num(consequence{i}(6:end-3));
        resID = consequence{i}(3:5);
        varObserved(resN).resID = resID;
        if isfield(varObserved(resN),'missenseVars')
            if isempty(varObserved(resN).missenseVars)
                varObserved(resN).missenseVars = alleleCount(i);
            else
                varObserved(resN).missenseVars = varObserved(resN).missenseVars + alleleCount(i);
            end
        else
            varObserved(resN).missenseVars = alleleCount(i);
        end
    elseif strcmp(annotation{i},'synonymous_variant')
        resN = str2num(consequence{i}(6:end-3));
        resID = consequence{i}(3:5);
        varObserved(resN).resID = resID;
        if isfield(varObserved(resN),'samesenseVars')
            if isempty(varObserved(resN).samesenseVars)
                varObserved(resN).samesenseVars = alleleCount(i);
            else
                varObserved(resN).samesenseVars = varObserved(resN).samesenseVars + alleleCount(i);
            end
        else
            varObserved(resN).samesenseVars = alleleCount(i);
        end
    else
        
    end
    
end

varSeq=struct;
for i = 1:size(varObserved,2)
    varSeq(i).n=i;
    if ~isempty(varObserved(i).resID)
        varSeq(i).res=aminolookup(varObserved(i).resID);
    else
        varSeq(i).res='X';
    end
end