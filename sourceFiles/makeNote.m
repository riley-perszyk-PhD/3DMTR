function [sounds,enPhase]=makeNote(Fs,dur,freq,stPhase,harmonics,endOption,chord,mods)
%Fs - sampling freq,dur - duration in sec,freq - note frequency,stPhase - starting phase
%harmonics - vector of harmonics to add, in multiplier of note freq
%,endOption - type of end actions ('' - blunt, 'dampenE' - exp decay, 'dampenL' - linear decay, 'gap' - break)

if nargin<7
    chord = 0;
    
    mods = struct;
    mods.modN = 0;
    mods.F = 0;
    mods.A = 0;
    mods.S = 0;
    mods.Fi = [];
    mods.Ai = [];
    mods.Si = [];
    mods.type = '';
    mods.eq = '';
end
if chord
    Ts=1/Fs;
    t=[0:Ts:((dur)+Ts)];
    if ischar(freq)
        freq = getNote(freq,chord);
    end
    
    
    if mods.F>0
        for i = 1:size(freq,2)
                freqTemp = ones(size(t,1), size(t,2))*freq(i);
            for j = 1:mods.F
                m = mods.eq{mods.Fi(j)};
                eval(['freqTemp = ' m '.* freqTemp;']);
            end
            Fxtemp = sin((2.*pi.*freqTemp.*t)+stPhase);
            if i == 1
                Fx = Fxtemp;
            else
                Fx = Fx+Fxtemp;
            end
        end
        Fx = Fx./max([max(Fx) max(-Fx)]);
    else
        for i = 1:size(freq,2)
            Fxtemp = sin((2.*pi.*freq(i).*t)+stPhase);
            if i == 1
                Fx = Fxtemp;
            else
                Fx = Fx+Fxtemp;
            end
        end
            Fx = Fx./max([max(Fx) max(-Fx)]);
    end
    
    
    
else
    Ts=1/Fs;
    t=[0:Ts:((dur)+Ts)];
    if ischar(freq)
        freq = getNote(freq);
    end
    if mods.F>0
        for i = 1:size(freq,2)
                freqTemp = ones(size(t,1), size(t,2))*freq(i);
            for j = 1:mods.F
                m = mods.eq{mods.Fi(j)};
                eval(['freqTemp = ' m '.* freqTemp;']);
            end
            Fxtemp = sin((2.*pi.*freqTemp.*t)+stPhase);
            if (i == 1) 
                Fx = Fxtemp;
            else
                Fx = Fx+Fxtemp;
            end
        end
        Fx = Fx./max([max(Fx) max(-Fx)]);
        
            
%         Fx = sin((2.*pi.*freqTemp.*t)+stPhase);
    else
        Fx = sin(2*pi*freq*t+stPhase);
    end
end


switch endOption
    case 'gap'
        
        dasFx0 = diff(asin(Fx));
        enPhase = asin(Fx(size(Fx,2)));
        
        if ~isempty(harmonics)
            temp = ones(size(Fx,1),size(Fx,2));
            for i = 1:size(harmonics,2)
                temp2 = sin(2*pi*(freq*harmonics(i))*t);
                temp = temp.*temp2;
            end
            Fx = Fx+(temp.*1);
            fac=max([max(Fx) abs(min(Fx))]);
            Fx = Fx./fac;
            enPhase = asin(Fx(size(Fx,2)));
        end
        
        dasFx = diff(asin(Fx));
        gapXI = round(size(Fx,2)*0.90);
        gapY = Fx(gapXI);
        Fx(gapXI:end) = gapY;
        enPhase = asin(Fx(gapXI));
        if dasFx0>0
            enPhase = -pi()/2 + enPhase;
        end
        
    case 'dampenL'
        if dur > 0.5
            dampenT = [linspace(0,1,Fs*.1) (ones(round(Fs*(dur-.2))+2,1))' linspace(1,0,Fs*.1)];
        else
            dampenT = [1:size(Fx,2)/10 (ones(round(size(Fx,2).*8./10),1).*size(Fx,2)/10)' size(Fx,2)/10:-1:1];
            dampenT = dampenT./max(dampenT);
        end
        Fx = Fx.*dampenT;
        
        dasFx0 = diff(asin(Fx));
        enPhase = asin(Fx(size(Fx,2)));
        
        if ~isempty(harmonics)
            temp = ones(size(Fx,1),size(Fx,2));
            for i = 1:size(harmonics,2)
                temp2 = sin(2*pi*(freq*harmonics(i))*t);
                temp = temp.*temp2;
            end
            Fx = Fx+(temp.*1);
            fac=max([max(Fx) abs(min(Fx))]);
            Fx = Fx./fac;
            dampenT = [1:size(Fx,2)/10 (ones(round(size(Fx,2).*8./10),1).*size(Fx,2)/10)' size(Fx,2)/10:-1:1];
            dampenT = dampenT./max(dampenT);
            Fx = Fx.*dampenT;
            enPhase = asin(Fx(size(Fx,2)));
            
        end
    case 'dampenE'
        dampenT = [linspace(0,1,Fs*.01) (ones(round(Fs*(dur-.02))+2,1))' linspace(1,0,Fs*.01)];
        dampenT = 0.5-cos(dampenT*pi())/2;
        Fx = Fx.*dampenT;
        
        dasFx0 = diff(asin(Fx));
        enPhase = asin(Fx(size(Fx,2)));
        
        if ~isempty(harmonics)
            temp = ones(size(Fx,1),size(Fx,2));
            for i = 1:size(harmonics,2)
                temp2 = sin(2*pi*(freq*harmonics(i))*t);
                temp = temp.*temp2;
            end
            Fx = Fx+(temp.*1);
            fac=max([max(Fx) abs(min(Fx))]);
            Fx = Fx./fac;
            dampenT = [1:size(Fx,2)/10 (ones(round(size(Fx,2).*8./10),1).*size(Fx,2)/10)' size(Fx,2)/10:-1:1];
            dampenT = dampenT./max(dampenT);
            Fx = Fx.*dampenT;
            enPhase = asin(Fx(size(Fx,2)));
        end
        
    otherwise
        
        dasFx = diff(asin(Fx));
        enPhase = asin(Fx(size(Fx,2)));
        if dasFx<0
            enPhase = -pi()/2 + enPhase;
        end
        
        
        if ~isempty(harmonics)
            temp = ones(size(Fx,1),size(Fx,2));
            for i = 1:size(harmonics,2)
                temp2 = sin(2*pi*(freq*harmonics(i))*t);
                temp = temp.*temp2;
            end
            Fx = Fx+(temp.*1);
            fac=max([max(Fx) abs(min(Fx))]);
            Fx = Fx./fac;
            enPhase = asin(Fx(size(Fx,2)));
            if dasFx<0
                enPhase = -pi()/2 + enPhase;
            end
        end
        
        
end



if mods.S>0
    sampling = ones(size(t,1), size(t,2));
    for i = 1:mods.S
        m = mods.eq{mods.Si(i)};
        if i==1
        eval(['samplingtemp = ' m ';'])
        else
            eval(['samplingtemp = ' m '.*samplingtemp;'])
        end
    end
    temp = cumsum(samplingtemp);
    temp2 = cumsum(samplingtemp./max(temp).*size(Fx,2));
    temp3 = resample(Fx,temp2);
    sounds = temp3(1:end-1);
else
    sounds = Fx(1:end-1);
end

if mods.A>0
    amp = ones(size(t,1), size(t,2));
    for i = 1:mods.A
        m = mods.eq{mods.Ai(i)};
        if i==1
        eval(['amptemp = ' m ';']);
        else
            eval(['amptemp = ' m '.*amptemp;']);
        end
    end
    sounds = sounds.*amptemp(1:end-1);
end

