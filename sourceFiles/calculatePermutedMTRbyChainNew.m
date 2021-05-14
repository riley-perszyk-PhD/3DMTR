function [results order permutedFactor] = calculatePermutedMTRbyChainNew(pdbData,factorData,allLoc,how,factor)

chains = unique([pdbData.chainID]);
order = [];
maxI = 0;
for c = 1:size(chains,2)
    chainI = ([pdbData.chainID] == chains(c));
    order = [order (randsample(1:sum(chainI),sum(chainI))+maxI)];
    maxI = max(order);
end
results = [];
switch how
    case 'Residues'
%         
%         B = reshape(allLoc,[1,size(allLoc,1),size(allLoc,2)])
%         allLocXYZ=[];
%         for c = 1:size(allLoc,1)
%             allLocXYZ = [allLocXYZ;B];
%         end
        
        allLoc = allLoc(order,:); %%% change the residue order
        %         allDistances = [];
        %         t = tic
        %         for i = 1:size(pdbData,2)
        %             distances = [];
        %             for j = 1:size(pdbData,2)
        %                 distances = [distances norm(allLoc(:,i) - allLoc(:,j))];
        %             end
        %             allDistances = [allDistances; distances];
        %         end
        %         toc(t)
        
%         allDistances = [];
%         %         t = tic
%         for i = 1:size(pdbData,2)
%                 distances = vecnorm((allLoc(i,:) - allLoc(:,:))');
%                 allDistances = [allDistances; distances];
%         end
%         %         toc(t)
        
        
        allDistances = zeros(size(allLoc,1),size(allLoc,1));
        for i = 1:size(allDistances,1)
allDistances(i,:) = vecnorm((allLoc(i,:) - allLoc(:,:))');
        end
        
        %calculate factors
        app.StatusEditField.Value = ['calculating calculating: computing factors']; pause(0.01);
        
        switch factor
            case 'fact_sqrtr'
                fact_sqrtr = 1./sqrt(allDistances);
                fact_sqrtr(isinf(fact_sqrtr)) = 1;
                factors.fact_sqrtr = fact_sqrtr;
            case 'fact_r'
                fact_r = 1./allDistances;
                fact_r(isinf(fact_r)) = 1;
                factors.fact_r = fact_r;
            case 'fact_rr'
                fact_rr = 1./(allDistances.^2);
                fact_rr(isinf(fact_rr)) = 1;
                factors.fact_rr = fact_rr;
            case 'fact_rrrr'
                fact_rrrr = 1./(allDistances.^4);
                fact_rrrr(isinf(fact_rrrr)) = 1;
                factors.fact_rrrr = fact_rrrr;
            case 'fact_t05'
                fact_t05 = allDistances <= 5;
                fact_t05Avgd = 0;
                for i = 1:size(allDistances,2)
                    for j = 1:size(allDistances,1)
                        fact_t05Avgd = fact_t05Avgd + fact_t05(j,i).*allDistances(j,i);
                    end
                end
                fact_t05Avgd = fact_t05Avgd ./ sum(fact_t05,1);
                fact_t05n = sum(fact_t05,1);
                fact_t05Avgn = mean(fact_t05n,2);
                factors.fact_t05 = fact_t05;
                factors.info.fact_t05n = fact_t05n;
                factors.info.fact_t05Avgd = fact_t05Avgd;
                factors.info.fact_t05Avgn = fact_t05Avgn;
            case 'fact_t10'
                fact_t10 = allDistances <= 10;
                fact_t10Avgd = 0;
                for i = 1:size(allDistances,2)
                    for j = 1:size(allDistances,1)
                        fact_t10Avgd = fact_t10Avgd + fact_t10(j,i).*allDistances(j,i);
                    end
                end
                fact_t10Avgd = fact_t10Avgd ./ sum(fact_t10,1);
                fact_t10n = sum(fact_t10,1);
                fact_t10Avgn = mean(fact_t10n,2);
                factors.fact_t10 = fact_t10;
                factors.info.fact_t10n = fact_t10n;
                factors.info.fact_t10Avgd = fact_t10Avgd;
                factors.info.fact_t10Avgn = fact_t10Avgn;
            case 'fact_t15'
                fact_t15 = allDistances <= 15;
                fact_t15Avgd = 0;
                for i = 1:size(allDistances,2)
                    for j = 1:size(allDistances,1)
                        fact_t15Avgd = fact_t15Avgd + fact_t15(j,i).*allDistances(j,i);
                    end
                end
                fact_t15Avgd = fact_t15Avgd ./ sum(fact_t15,1);
                fact_t15n = sum(fact_t15,1);
                fact_t15Avgn = mean(fact_t15n,2);
                factors.fact_t15 = fact_t15;
                factors.info.fact_t15n = fact_t15n;
                factors.info.fact_t15Avgd = fact_t15Avgd;
                factors.info.fact_t15Avgn = fact_t15Avgn;
            case 'fact_t20'
                fact_t20 = allDistances <= 20;
                fact_t20Avgd = 0;
                for i = 1:size(allDistances,2)
                    for j = 1:size(allDistances,1)
                        fact_t20Avgd = fact_t20Avgd + fact_t20(j,i).*allDistances(j,i);
                    end
                end
                fact_t20Avgd = fact_t20Avgd ./ sum(fact_t20,1);
                fact_t20n = sum(fact_t20,1);
                fact_t20Avgn = mean(fact_t20n,2);
                factors.fact_t20 = fact_t20;
                factors.info.fact_t20n = fact_t20n;
                factors.info.fact_t20Avgd = fact_t20Avgd;
                factors.info.fact_t20Avgn = fact_t20Avgn;
            case 'fact_t30'
                fact_t30 = allDistances <= 30;
                fact_t30Avgd = 0;
                for i = 1:size(allDistances,2)
                    for j = 1:size(allDistances,1)
                        fact_t30Avgd = fact_t30Avgd + fact_t30(j,i).*allDistances(j,i);
                    end
                end
                fact_t30Avgd = fact_t30Avgd ./ sum(fact_t30,1);
                fact_t30n = sum(fact_t30,1);
                fact_t30Avgn = mean(fact_t30n,2);
                factors.fact_t30 = fact_t30;
                factors.info.fact_t30n = fact_t30n;
                factors.info.fact_t30Avgd = fact_t30Avgd;
                factors.info.fact_t30Avgn = fact_t30Avgn;
            case 'fact_t40'
                fact_t40 = allDistances <= 40;
                fact_t40Avgd = 0;
                for i = 1:size(allDistances,2)
                    for j = 1:size(allDistances,1)
                        fact_t40Avgd = fact_t40Avgd + fact_t40(j,i).*allDistances(j,i);
                    end
                end
                fact_t40Avgd = fact_t40Avgd ./ sum(fact_t40,1);
                fact_t40n = sum(fact_t40,1);
                fact_t40Avgn = mean(fact_t40n,2);
                factors.fact_t40 = fact_t40;
                factors.info.fact_t40n = fact_t40n;
                factors.info.fact_t40Avgd = fact_t40Avgd;
                factors.info.fact_t40Avgn = fact_t40Avgn;
            case 'fact_wfuc10'
                fact_wfuc10 = exp(-(allDistances.^2)./(2.*(10.^2)));
                fact_wfuc10n = sum(fact_wfuc10,1);
                fact_wfun10Avgn = mean(fact_wfuc10n,2);
                factors.fact_wfuc10 = fact_wfuc10;
            case 'fact_wfuc10sqrt'
                fact_wfuc10sqrt = sqrt(exp(-(allDistances.^2)./(2.*(10.^2))));
                factors.fact_wfuc10sqrt = fact_wfuc10sqrt;
            case 'fact_wfuc05'
                fact_wfuc05 = exp(-(allDistances.^2)./(2.*(5.^2)));
                fact_wfuc05n = sum(fact_wfuc05,1);
                fact_wfun05Avgn = mean(fact_wfuc05n,2);
                factors.fact_wfuc05 = fact_wfuc05;
            case 'fact_wfuc05sqrt'
                fact_wfuc05sqrt = sqrt(exp(-(allDistances.^2)./(2.*(5.^2))));
                factors.fact_wfuc05sqrt = fact_wfuc05sqrt;
            case 'fact_wfuc20'
                fact_wfuc20 = exp(-(allDistances.^2)./(2.*(20.^2)));
                fact_wfuc20n = sum(fact_wfuc20,1);
                fact_wfun20Avgn = mean(fact_wfuc20n,2);
                factors.fact_wfuc20 = fact_wfuc20;
            case 'fact_wfuc20sqrt'
                fact_wfuc20sqrt = sqrt(exp(-(allDistances.^2)./(2.*(20.^2))));
                factors.fact_wfuc20sqrt = fact_wfuc20sqrt;
            case 'fact_c11'
                [fact_c11val fact_c11i] = mink(allDistances,11);
                fact_c11 = boolean(zeros(size(allDistances)));
                for i = 1:size(allDistances,2)
                    for j = 1:size(fact_c11i,1)
                        fact_c11(fact_c11i(j,i),i) = true;
                    end
                end
                factors.fact_c11 = fact_c11;
                factors.info.fact_c11val = fact_c11val;
                factors.info.fact_c11valAvgd = mean(fact_c11val,1);
            case 'fact_c21'
                [fact_c21val fact_c21i] = mink(allDistances,21);
                fact_c21 = boolean(zeros(size(allDistances)));
                for i = 1:size(allDistances,2)
                    for j = 1:size(fact_c21i,1)
                        fact_c21(fact_c21i(j,i),i) = true;
                    end
                end
                factors.fact_c21 = fact_c21;
                factors.info.fact_c21val = fact_c21val;
                factors.info.fact_c21valAvgd =  mean(fact_c21val,1);
            case 'fact_c31'
                [fact_c31val fact_c31i] = mink(allDistances,31);
                fact_c31 = boolean(zeros(size(allDistances)));
                for i = 1:size(allDistances,2)
                    for j = 1:size(fact_c31i,1)
                        fact_c31(fact_c31i(j,i),i) = true;
                    end
                end
                factors.fact_c31 = fact_c31;
                factors.info.fact_c31val = fact_c31val;
                factors.info.fact_c31valAvgd =  mean(fact_c31val,1);
            case 'fact_c15'
                [fact_c15val fact_c15i] = mink(allDistances,15);
                fact_c15 = boolean(zeros(size(allDistances)));
                for i = 1:size(allDistances,2)
                    for j = 1:size(fact_c15i,1)
                        fact_c15(fact_c15i(j,i),i) = true;
                    end
                end
                factors.fact_c15 = fact_c15;
                factors.info.fact_c15val = fact_c15val;
                factors.info.fact_c15valAvgd = mean(fact_c15val,1);
            case 'fact_c25'
                [fact_c25val fact_c25i] = mink(allDistances,25);
                fact_c25 = boolean(zeros(size(allDistances)));
                for i = 1:size(allDistances,2)
                    for j = 1:size(fact_c25i,1)
                        fact_c25(fact_c25i(j,i),i) = true;
                    end
                end
                factors.fact_c25 = fact_c25;
                factors.info.fact_c25val = fact_c25val;
                factors.info.fact_c25valAvgd =  mean(fact_c25val,1);
            case 'fact_c35'
                [fact_c35val fact_c35i] = mink(allDistances,35);
                fact_c35 = boolean(zeros(size(allDistances)));
                for i = 1:size(allDistances,2)
                    for j = 1:size(fact_c35i,1)
                        fact_c35(fact_c35i(j,i),i) = true;
                    end
                end
                factors.fact_c35 = fact_c35;
                factors.info.fact_c35val = fact_c35val;
                factors.info.fact_c35valAvgd =  mean(fact_c35val,1);
            case 'fact_c41'
                [fact_c41val fact_c41i] = mink(allDistances,41);
                fact_c41 = boolean(zeros(size(allDistances)));
                for i = 1:size(allDistances,2)
                    for j = 1:size(fact_c41i,1)
                        fact_c41(fact_c41i(j,i),i) = true;
                    end
                end
                factors.fact_c41 = fact_c41;
                factors.info.fact_c41val = fact_c41val;
                factors.info.fact_c41valAvgd =  mean(fact_c41val,1);
                
            case 'fact_l11'
        tempDistances = allDistances;
        tempDistances([pdbData.chainID] ~= [pdbData.chainID]') = 999;
                [fact_l11val fact_l11i] = mink(tempDistances,11);
                fact_l11 = boolean(zeros(size(tempDistances)));
                for i = 1:size(tempDistances,2)
                    for j = 1:size(fact_l11i,1)
                        fact_l11(fact_l11i(j,i),i) = true;
                    end
                end
                factors.fact_l11 = fact_l11;
                factors.info.fact_l11val = fact_l11val;
                factors.info.fact_l11valAvgd = mean(fact_l11val,1);
            case 'fact_l21'
        tempDistances = allDistances;
        tempDistances([pdbData.chainID] ~= [pdbData.chainID]') = 999;
                [fact_l21val fact_l21i] = mink(tempDistances,21);
                fact_l21 = boolean(zeros(size(tempDistances)));
                for i = 1:size(tempDistances,2)
                    for j = 1:size(fact_l21i,1)
                        fact_l21(fact_l21i(j,i),i) = true;
                    end
                end
                factors.fact_l21 = fact_l21;
                factors.info.fact_l21val = fact_l21val;
                factors.info.fact_l21valAvgd =  mean(fact_l21val,1);
            case 'fact_l31'
        tempDistances = allDistances;
        tempDistances([pdbData.chainID] ~= [pdbData.chainID]') = 999;
                [fact_l31val fact_l31i] = mink(tempDistances,31);
                fact_l31 = boolean(zeros(size(tempDistances)));
                for i = 1:size(tempDistances,2)
                    for j = 1:size(fact_l31i,1)
                        fact_l31(fact_l31i(j,i),i) = true;
                    end
                end
                factors.fact_l31 = fact_l31;
                factors.info.fact_l31val = fact_l31val;
                factors.info.fact_l31valAvgd =  mean(fact_l31val,1);
            case 'fact_l15'
        tempDistances = allDistances;
        tempDistances([pdbData.chainID] ~= [pdbData.chainID]') = 999;
                [fact_l15val fact_l15i] = mink(tempDistances,15);
                fact_l15 = boolean(zeros(size(tempDistances)));
                for i = 1:size(tempDistances,2)
                    for j = 1:size(fact_l15i,1)
                        fact_l15(fact_l15i(j,i),i) = true;
                    end
                end
                factors.fact_l15 = fact_l15;
                factors.info.fact_l15val = fact_l15val;
                factors.info.fact_l15valAvgd = mean(fact_l15val,1);
            case 'fact_l25'
        tempDistances = allDistances;
        tempDistances([pdbData.chainID] ~= [pdbData.chainID]') = 999;
                [fact_l25val fact_l25i] = mink(tempDistances,25);
                fact_l25 = boolean(zeros(size(tempDistances)));
                for i = 1:size(tempDistances,2)
                    for j = 1:size(fact_l25i,1)
                        fact_l25(fact_l25i(j,i),i) = true;
                    end
                end
                factors.fact_l25 = fact_l25;
                factors.info.fact_l25val = fact_l25val;
                factors.info.fact_l25valAvgd =  mean(fact_l25val,1);
            case 'fact_l35'
        tempDistances = allDistances;
        tempDistances([pdbData.chainID] ~= [pdbData.chainID]') = 999;
                [fact_l35val fact_l35i] = mink(tempDistances,35);
                fact_l35 = boolean(zeros(size(tempDistances)));
                for i = 1:size(tempDistances,2)
                    for j = 1:size(fact_l35i,1)
                        fact_l35(fact_l35i(j,i),i) = true;
                    end
                end
                factors.fact_l35 = fact_l35;
                factors.info.fact_l35val = fact_l35val;
                factors.info.fact_l35valAvgd =  mean(fact_l35val,1);
            case 'fact_l41'
        tempDistances = allDistances;
        tempDistances([pdbData.chainID] ~= [pdbData.chainID]') = 999;
                [fact_l41val fact_l41i] = mink(tempDistances,41);
                fact_l41 = boolean(zeros(size(tempDistances)));
                for i = 1:size(tempDistances,2)
                    for j = 1:size(fact_l41i,1)
                        fact_l41(fact_l41i(j,i),i) = true;
                    end
                end
                factors.fact_l41 = fact_l41;
                factors.info.fact_l41val = fact_l41val;
                factors.info.fact_l41valAvgd =  mean(fact_l41val,1);
            case 'fact_sw11'
               for i = 1:size(allDistances,2)
                   curRes = pdbData(1,i).resSeq;
                curChain = pdbData(1,i).chainID;
                w = 11;
                t1 = curRes-((w-1)/2);
                t2 = curRes+((w-1)/2);
                chains = [pdbData.chainID];
                seq = [pdbData.resSeq];
                incl = (chains==curChain & ...
                    seq(order) >= t1 & ...
                    seq(order) <= t2 );
                fact_sw11(incl,i) = true;
                fact_sw11(i,i) = true;
                fact_sw11(i,order(i)) = false;
               end
                factors.fact_sw11 = fact_sw11;
            case 'fact_sw15'
                for i = 1:size(allDistances,2)
                   curRes = pdbData(1,i).resSeq;
                curChain = pdbData(1,i).chainID;
                w = 15;
                t1 = curRes-((w-1)/2);
                t2 = curRes+((w-1)/2);
                chains = [pdbData.chainID];
                seq = [pdbData.resSeq];
                incl = (chains==curChain & ...
                    seq(order) >= t1 & ...
                    seq(order) <= t2 );
                fact_sw15(incl,i) = true;
                fact_sw15(i,i) = true;
                fact_sw15(i,order(i)) = false;
               end
                factors.fact_sw15 = fact_sw15;
            case 'fact_sw21'
                for i = 1:size(allDistances,2)
                   curRes = pdbData(1,i).resSeq;
                curChain = pdbData(1,i).chainID;
                w = 21;
                t1 = curRes-((w-1)/2);
                t2 = curRes+((w-1)/2);
                chains = [pdbData.chainID];
                seq = [pdbData.resSeq];
                incl = (chains==curChain & ...
                    seq(order) >= t1 & ...
                    seq(order) <= t2 );
                fact_sw21(incl,i) = true;
                fact_sw21(i,i) = true;
                fact_sw21(i,order(i)) = false;
               end
                factors.fact_sw21 = fact_sw21;
            case 'fact_sw25'
               for i = 1:size(allDistances,2)
                   curRes = pdbData(1,i).resSeq;
                curChain = pdbData(1,i).chainID;
                w = 25;
                t1 = curRes-((w-1)/2);
                t2 = curRes+((w-1)/2);
                chains = [pdbData.chainID];
                seq = [pdbData.resSeq];
                incl = (chains==curChain & ...
                    seq(order) >= t1 & ...
                    seq(order) <= t2 );
                fact_sw25(incl,i) = true;
                fact_sw25(i,i) = true;
                fact_sw25(i,order(i)) = false;
               end
                factors.fact_sw25 = fact_sw25;
            case 'fact_sw31'
               for i = 1:size(allDistances,2)
                   curRes = pdbData(1,i).resSeq;
                curChain = pdbData(1,i).chainID;
                w = 31;
                t1 = curRes-((w-1)/2);
                t2 = curRes+((w-1)/2);
                chains = [pdbData.chainID];
                seq = [pdbData.resSeq];
                incl = (chains==curChain & ...
                    seq(order) >= t1 & ...
                    seq(order) <= t2 );
                fact_sw31(incl,i) = true;
                fact_sw31(i,i) = true;
                fact_sw31(i,order(i)) = false;
               end
                factors.fact_sw31 = fact_sw31;
            case 'fact_sw35'
               for i = 1:size(allDistances,2)
                   curRes = pdbData(1,i).resSeq;
                curChain = pdbData(1,i).chainID;
                w = 35;
                t1 = curRes-((w-1)/2);
                t2 = curRes+((w-1)/2);
                chains = [pdbData.chainID];
                seq = [pdbData.resSeq];
                incl = (chains==curChain & ...
                    seq(order) >= t1 & ...
                    seq(order) <= t2 );
                fact_sw35(incl,i) = true;
                fact_sw35(i,i) = true;
                fact_sw35(i,order(i)) = false;
               end
                factors.fact_sw35 = fact_sw35;
            case 'fact_sw41'
                for i = 1:size(allDistances,2)
                   curRes = pdbData(1,i).resSeq;
                curChain = pdbData(1,i).chainID;
                w = 41;
                t1 = curRes-((w-1)/2);
                t2 = curRes+((w-1)/2);
                chains = [pdbData.chainID];
                seq = [pdbData.resSeq];
                incl = (chains==curChain & ...
                    seq(order) >= t1 & ...
                    seq(order) <= t2 );
                fact_sw41(incl,i) = true;
                fact_sw41(i,i) = true;
                fact_sw41(i,order(i)) = false;
               end
                factors.fact_sw41 = fact_sw41;
        end
        
        
        
        
        
        %now calc MTR
        if contains(factor,'_t') || contains(factor,'_c') || contains(factor,'_sw') || contains(factor,'_l')
            vMTR = zeros(1,size(pdbData,2));
            allwidth = zeros(1,size(pdbData,2));
            curFac = getfield(factors,factor)';
            for i = 1:size(pdbData,2)
                
                curF = curFac(i,:);
                %for each spherical thresholds, cycle through each residue, adding
                %all counts of E and O var, then calc MTR
                oSSw = sum([pdbData(1,find(curF)).oSS]);
                oMSw = sum([pdbData(1,find(curF)).oMS]);
                eSSw = sum([pdbData(1,find(curF)).eSS]);
                eMSw = sum([pdbData(1,find(curF)).eMS]);
                widthw = sum(curF);
                
                
                mtrw = ( (oMSw/(oMSw+oSSw)) / (eMSw/(eMSw+eSSw)) );
                vMTR(1,i) = mtrw;
                allwidth(1,i) = widthw;
            end
            
        elseif contains(factor,'info')
            
        else
            vMTR = [];
            curFac = getfield(factors,factor)';
            for i = 1:size(pdbData,2)
                mtrTotal = 0;
                weightTotal = 0;
                %for each spherical thresholds, cycle through each residue, adding
                %all counts of E and O var, then calc MTR
                
                curF = curFac(i,:);
                for j = 1:size(curF,2)
                    oSSw = pdbData(j).oSS;
                    oMSw = pdbData(j).oMS;
                    eSSw = pdbData(j).eSS;
                    eMSw = pdbData(j).eMS;
                    mtr = ( (oMSw/(oMSw+oSSw)) / (eMSw/(eMSw+eSSw)) );
                    %handle NAN
                    if isnan(mtr)
                        option = 1;
                        switch option
                            case 1 %don't add it in...
                                
                            case 2 % l'hopital...
                                
                                mtr = ( (1) / (eMSw/(eMSw+eSSw)) );
                                if isnan(mtr)
                                    
                                else
                                    mtrTotal = mtrTotal + mtr*curF(j);
                                    weightTotal = weightTotal + curF(j);
                                end
                                
                        end
                    elseif isempty(mtr)
                        
                    else
                        
                        mtrTotal = mtrTotal + mtr*curF(j);
                        weightTotal = weightTotal + curF(j);
                        
                    end
                end
                mtrw = mtrTotal/weightTotal;
                
                vMTR = [vMTR mtrw];
                vWT = [vWT weightTotal];
                
            end
        end
        results = vMTR;
        permutedFactor = curFac;
    case 'MTR Score'
        if strcmp(factor,'swMTR')
            temp = [pdbData.mtrSW];
            results = temp(order);
        else
            results = factorData.vMTR(order);
            
        permutedFactor = [];
        end
    case 'Factor'
        if contains(factor,'_t') || contains(factor,'_c') || contains(factor,'_sw') || contains(factor,'_l')
            vMTR = zeros(1,size(pdbData,2));
            allwidth = zeros(1,size(pdbData,2));
            curFac = zeros(size(pdbData,2),size(pdbData,2));
            for i = 1:size(pdbData,2)
                curF = getfield(pdbData(i),factor)';
                curF = curF(order);%%%permuted residue order
                curFac(i,:) = curF; 
                %for each spherical thresholds, cycle through each residue, adding
                %all counts of E and O var, then calc MTR
                oSSw = sum([pdbData(1,find(curF)).oSS]);
                oMSw = sum([pdbData(1,find(curF)).oMS]);
                eSSw = sum([pdbData(1,find(curF)).eSS]);
                eMSw = sum([pdbData(1,find(curF)).eMS]);
                widthw = sum(curF);
                
                
                mtrw = ( (oMSw/(oMSw+oSSw)) / (eMSw/(eMSw+eSSw)) );
                vMTR(1,i) = mtrw;
                allwidth(1,i) = widthw;
            end
            
        elseif contains(fNames{k},'info')
            
        else
            vMTR = [];
            for i = 1:size(pdbData,2)
                mtrTotal = 0;
                weightTotal = 0;
                curF = getfield(pdbData(i),factor)';
                curF = curF(order);%%%permuted residue order
                %for each spherical thresholds, cycle through each residue, adding
                %all counts of E and O var, then calc MTR
                
                for j = 1:size(curF,2)
                    oSSw = pdbData(j).oSS;
                    oMSw = pdbData(j).oMS;
                    eSSw = pdbData(j).eSS;
                    eMSw = pdbData(j).eMS;
                    mtr = ( (oMSw/(oMSw+oSSw)) / (eMSw/(eMSw+eSSw)) );
                    %handle NAN
                    if isnan(mtr)
                        option = 1;
                        switch option
                            case 1 %don't add it in...
                                
                            case 2 % l'hopital...
                                
                                mtr = ( (1) / (eMSw/(eMSw+eSSw)) );
                                if isnan(mtr)
                                    
                                else
                                    mtrTotal = mtrTotal + mtr*curF(j);
                                    weightTotal = weightTotal + curF(j);
                                end
                                
                        end
                    elseif isempty(mtr)
                        
                    else
                        
                        mtrTotal = mtrTotal + mtr*curF(j);
                        weightTotal = weightTotal + curF(j);
                        
                    end
                end
                mtrw = mtrTotal/weightTotal;
                
                vMTR = [vMTR mtrw];
                vWT = [vWT weightTotal];
                
            end
        end
        
        results = vMTR;
        
        permutedFactor = curFac;
end



