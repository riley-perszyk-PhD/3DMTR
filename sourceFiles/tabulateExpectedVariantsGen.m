function varExpected = tabulateExpectedVariantsGen(g,p,codonShift)

varExpected = struct;
g.pSequence = nt2aa(g.Sequence((1+codonShift):end), 'AlternativeStartCodons', false);
startCodon = strfind(g.pSequence,'M');
g.pSequence = g.pSequence(startCodon:end);
g.Sequence = g.Sequence((((startCodon-1)*3)+1+codonShift):end);


for i = 1:size(g.pSequence,2)
    varExpected(i).res = g.pSequence(i);
    varExpected(i).codon = g.Sequence((((i-1)*3)+1):(i*3));
    
    [varExpected(i).samesenseVars varExpected(i).missenseVars] = calcCodonPermutations(varExpected(i).codon);
    
end