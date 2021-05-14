function mtr = calculateVariantMTRgenForApp(varExpected,varObserved)

mtr = struct;

for i = 1:size(varExpected,2)
    
    mtr(i).res = varExpected(i).res;
    mtr(i).resGB = varExpected(i).res;
    mtr(i).codon = varExpected(i).codon;
    
    mtr(i).eSSvar = varExpected(i).samesenseVars;
    mtr(i).eMSvar = varExpected(i).missenseVars;
    eSSvar = varExpected(i).samesenseVars;
    eMSvar = varExpected(i).missenseVars;
    
    if i > size(varObserved,2)
        oSSvar = 0;
        oMSvar = 0;
    else
        oSSvar = varObserved(i).samesenseVars;
        oMSvar = varObserved(i).missenseVars;
    end
    if isempty(oMSvar)
        oMSvar = 0;
    end
    if isempty(oSSvar)
        oSSvar = 0;
    end
    mtr(i).oSSvar = oSSvar;
    mtr(i).oMSvar = oMSvar;
    
    mtrValue = ( (oMSvar/(oMSvar+oSSvar)) / (eMSvar/(eMSvar+eSSvar)) );
    mtr(i).mtr = mtrValue;
    
    if isnan(mtrValue)
        mtrValueFixed = ( (1) / (eMSvar/(eMSvar+eSSvar)) );
    else
        mtrValueFixed = mtrValue;
    end
    mtr(i).mtrFx = mtrValueFixed;
end

for i = 1:size(varExpected,2)
    if i>size(varObserved,2)
        break
    end
    mtr(i).resEx = varObserved(i).resID;
end

end