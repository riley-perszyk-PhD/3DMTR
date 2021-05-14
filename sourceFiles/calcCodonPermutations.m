function [ssVars msVars msAA] = calcCodonPermutations(codon)

ssVars = 0;
msVars = 0;
msAA = [];

codon = upper(codon);

bases = 'ACGT';
res = nt2aa(codon, 'AlternativeStartCodons', false);

for i = 1:3
    
    for j = 1:4
        
        if codon(i) == bases(j)
            continue
        end
        
        tempBase = codon;
        tempBase(i) = bases(j);
        
        tempRes = nt2aa(tempBase, 'AlternativeStartCodons', false);
        if strcmp(tempRes,'*') || strcmp(tempRes,'?')
            continue
        end
        if strcmp(tempRes,res)
            ssVars = ssVars+1;
        else
            msVars = msVars+1;
            msAA = [msAA tempRes];
        end
        
    end
        
end