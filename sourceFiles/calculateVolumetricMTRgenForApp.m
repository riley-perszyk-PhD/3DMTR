% function [mtrWS pdbS] = calculateVolumetricMTRgen(mtrAC,mtrBD,structPDB,factors,toPlot,saveFolder,ID)
function mtrWS = calculateVolumetricMTRgenForApp(pdbMTR,factors)

fNames = fieldnames(factors);
mtrWS = struct;
for k = 1:size(fNames,1)
    curFname = fNames{k};
    
    
    if contains(fNames{k},'_t') || contains(fNames{k},'_c') || contains(fNames{k},'_sw') || contains(fNames{k},'_l')
        vMTR = [];
        for i = 1:size(pdbMTR,2)
            curF = getfield(pdbMTR(i),curFname)';
            mtrWS(k).meth = curFname;
            mtrWS(k).factor{i} = curF;
            %for each spherical thresholds, cycle through each residue, adding
            %all counts of E and O var, then calc MTR
            oSSw = 0;
            oMSw = 0;
            eSSw = 0;
            eMSw = 0;
            widthw = 0;
            include = 1;
            if contains(fNames{k},'_sw')
                include = 0;
            end
            for j = 1:size(curF,2)
                if curF(j)
                    oSS = pdbMTR(j).oSS;
                    oMS = pdbMTR(j).oMS;
                    eSS = pdbMTR(j).eSS;
                    eMS = pdbMTR(j).eMS;
                        widthw = widthw +1;
                    
                    if isempty(oSS) || isempty(oMS) || isempty(eSS) || isempty(eMS)
                        
                    else
                        oSSw = oSSw + pdbMTR(j).oSS;
                        oMSw = oMSw + pdbMTR(j).oMS;
                        eSSw = eSSw + pdbMTR(j).eSS;
                        eMSw = eMSw + pdbMTR(j).eMS;
                    end
                end
            end
            mtrw = ( (oMSw/(oMSw+oSSw)) / (eMSw/(eMSw+eSSw)) );
            vMTR = [vMTR mtrw];
            
            mtrWS(k).oSSw(i) = oSSw;
            mtrWS(k).oMSw(i) = oMSw;
            mtrWS(k).eSSw(i) = eSSw;
            mtrWS(k).eMSw(i) = eMSw;
            mtrWS(k).widthw(i) = widthw;
            mtrWS(k).mtrw(i) = mtrw;
        end
        mtrWS(k).vMTR = vMTR;
        
    
    
    
    %For each weight array, go through each reside, add each weighted MTR
    %(figure out what to do with NANs), divide by sum of the weights.
    
    elseif contains(fNames{k},'info')
        
    else
        vMTR = [];
        vWT = [];
        for i = 1:size(pdbMTR,2)
            mtrTotal = 0; 
            weightTotal = 0;
            curF = getfield(pdbMTR(i),curFname)';
            mtrWS(k).meth = curFname;
            mtrWS(k).factor{i} = curF;
            %for each spherical thresholds, cycle through each residue, adding
            %all counts of E and O var, then calc MTR
            
            for j = 1:size(curF,2)
                oSSw = pdbMTR(j).oSS;
                oMSw = pdbMTR(j).oMS;
                eSSw = pdbMTR(j).eSS;
                eMSw = pdbMTR(j).eMS;
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
            
            mtrWS(k).mtrw(i) = mtrw;
            mtrWS(k).mtrTotal(i) = mtrTotal;
            mtrWS(k).weightTotal(i) = weightTotal;
        end
        mtrWS(k).vMTR = vMTR;
        mtrWS(k).vWT = vWT;
    end
    
end