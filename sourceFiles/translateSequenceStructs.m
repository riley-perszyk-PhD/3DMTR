function [transSeq,transAlign,numAlign] = translateSequenceStructs(seqOld,SeqNew,opt)
if nargin == 3
    if strcmp(opt,'lookforchunks')
        [score,transAlign,startNumAlignmentVec] = nwalign([seqOld.res],[SeqNew.res],'GapOpen', 35,'ExtendGap', 20);
    elseif strcmp(opt,'local')
        [score,transAlign,startNumAlignmentVec] = nwalign([seqOld.res],[SeqNew.res],'GapOpen', 60,'ExtendGap', 60);
        
        
%         transAlign = multialign({[seqOld.res],[seqOld.res],[SeqNew.res]});
%     [score,transAlign,startNumAlignmentVec] = nwalign([seqOld.res],[SeqNew.res]);
        
    [score,transAlign,startNumAlignmentVec] = nwalign([seqOld.res],[SeqNew.res],'Glocal', true);
    else
    [score,transAlign,startNumAlignmentVec] = nwalign([seqOld.res],[SeqNew.res]);
    end
else
    [score,transAlign,startNumAlignmentVec] = nwalign([seqOld.res],[SeqNew.res],'Glocal', true);
end
% score
transSeq = '';
numAlign = [];
topC = startNumAlignmentVec(1)-1 + seqOld(1).n-1;
botC = startNumAlignmentVec(2)-1 + SeqNew(1).n-1;

for k = size(transAlign,2):-1:1
    if (transAlign(1,k)=='*') || (transAlign(3,k)=='*')
        transAlign(:,k)=[];
    end
end

for k = 1:size(transAlign,2)
    if transAlign(2,k)=='|'
        transSeq = [transSeq transAlign(1,k)];
    else
        if transAlign(1,k)=='-'
        else
            transSeq = [transSeq transAlign(3,k)];
        end
    end
    
    if transAlign(1,k) ~= '-'
        topC = topC + 1;
        numAlign(1,k) = topC;
    end
    if transAlign(3,k) ~= '-'
        botC = botC + 1;
        numAlign(3,k) = botC;
    end
end

end


