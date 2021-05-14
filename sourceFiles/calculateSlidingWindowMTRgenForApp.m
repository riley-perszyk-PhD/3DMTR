function [mtrSW vec vecFx corVec curFactI] = calculateSlidingWindowMTRgenForApp(mtr,wind)

mtrSW = mtr;
vec = [];
vecFx = [];
corVec = [];
residueChecking = struct;

curFactI = zeros(size(mtr,1),wind);

for i = 1:size(mtr,2)
    %     mtrSW(i).res = mtr(i).res;
       
    eSS = 0;
    eMS = 0;
    oSS = 0;
    oMS = 0;
    
    if i <= (wind/2)
        for j = 1:(i+floor(wind/2))
            eSS = eSS +mtr(j).eSSvar;
            eMS = eMS +mtr(j).eMSvar;
            oSS = oSS +mtr(j).oSSvar;
            oMS = oMS +mtr(j).oMSvar;
            curFactI(i,j) = j;
        end
        width = size( 1:(i+floor(wind/2)) ,2);
    elseif i >= (size(mtr,2) - (wind/2))
        for j = (i-floor(wind/2)):size(mtr,2)
            eSS = eSS +mtr(j).eSSvar;
            eMS = eMS +mtr(j).eMSvar;
            oSS = oSS +mtr(j).oSSvar;
            oMS = oMS +mtr(j).oMSvar;
            curFactI(i,j) = j;
        end
        width = size( (i-floor(wind/2)):size(mtr,2) ,2);
    else
        for j = (i-floor(wind/2)):floor(i+(wind/2))
            eSS = eSS +mtr(j).eSSvar;
            eMS = eMS +mtr(j).eMSvar;
            oSS = oSS +mtr(j).oSSvar;
            oMS = oMS +mtr(j).oMSvar;
            curFactI(i,j) = j;
        end
        width = size( (i-floor(wind/2)):floor(i+(wind/2)) ,2);
    end
    mtrSW(i).width = width;
    mtrValue = ( (oMS/(oMS+oSS)) / (eMS/(eMS+eSS)) );
    vec = [vec mtrValue];
    mtrSW(i).mtrSW = mtrValue;
    %     mtrSW(i).mtr = mtr(i).mtr;
    mtrSW(i).eSSsw = eSS;
    mtrSW(i).eMSsw = eMS;
    mtrSW(i).oSSsw = oSS;
    mtrSW(i).oMSsw = oMS;
    mtrSW(i).eSS = mtr(i).eSSvar;
    mtrSW(i).eMS = mtr(i).eMSvar;
    mtrSW(i).oSS = mtr(i).oSSvar;
    mtrSW(i).oMS = mtr(i).oMSvar;
    mtrSW(i).resN = i;
    
    
    mtrFxValue = mtr(i).mtrFx;
    vecFx = [vecFx mtrFxValue];
    
    residueChecking(i).geneRes = mtr(i).res;
    residueChecking(i).gnomADres = mtr(i).resEx;
    if ~isempty(residueChecking(i).gnomADres) && ~isempty(residueChecking(i).geneRes)
        %                     residueChecking(i).geneRes;
        if strcmp(aminolookup(residueChecking(i).geneRes),residueChecking(i).gnomADres)
            residueChecking(i).correct = 1;
            corVec = [corVec 1];
        else
            residueChecking(i).correct = 0;
            corVec = [corVec 0];
        end
    else
        corVec = [corVec .5];
    end
    
end

%             if toPlot
%                 fig = figure; hold on;
%                 stairs(vec)
%                 axis tight
%                 ylim([-.05 1.25])
%
%                 title(['Sliding Window - ' num2str(wind) ' residues - ' ID]);
%                 fig.Renderer = 'painters';
%                 print(fig,[saveFolder '\' ID '-SlidingWindow' num2str(wind) '.png'],'-dpng','-r900');
%                 %     saveas(fig,[saveFolder '\' ID '-SlidingWindow' num2str(wind) '.pdf'],'pdf');
%                 %     saveas(fig,[saveFolder '\' ID '-SlidingWindow' num2str(wind) '.eps'],'epsc');
%                 close
%                 fig = figure; hold on;
%                 stairs(vecFx)
%                 axis tight
%                 ylim([-.05 1.25])
%
%                 title(['Individual Fixed MTR - ' num2str(wind) ' residues - ' ID]);
%                 fig.Renderer = 'painters';
%                 print(fig,[saveFolder '\' ID '-IndividualFixedMTR' num2str(wind) '.png'],'-dpng','-r900');
%                 %     saveas(fig,[saveFolder '\' ID '-SlidingWindow' num2str(wind) '.pdf'],'pdf');
%                 %     saveas(fig,[saveFolder '\' ID '-SlidingWindow' num2str(wind) '.eps'],'epsc');
%                 close
%
%                 fig = figure; hold on;
%                 plot(corVec)
%
%                 title(['Residue Alignment - GnomAD v GeneBank - ' ID]);
%                 fig.Renderer = 'painters';
%                 print(fig,[saveFolder '\' ID '-swResidueAlignment-GnomADgenebank.png'],'-dpng','-r900');
%                 close
%             end



end