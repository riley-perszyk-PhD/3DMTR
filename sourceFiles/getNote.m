function freq = getNote(note,chord)
if nargin < 2
    chord = 0;
end

switch note
    case {'C0'}
        freq = 16.35;
        if chord
            freq = [freq getNote('E0',0)];
            freq = [freq getNote('G0',0)];
        end
        
    case {'C0s','D0f'}
        freq = 17.32;
        if chord
            freq = [freq getNote('F0',0)];
            freq = [freq getNote('G0s',0)];
        end
        
    case {'D0'}
        freq = 18.35;
        if chord
            freq = [freq getNote('F0s',0)];
            freq = [freq getNote('A0',0)];
        end
        
    case {'D0s','E0f'}
        freq = 19.45;
        if chord
            freq = [freq getNote('G0',0)];
            freq = [freq getNote('A0s',0)];
        end
        
    case {'E0'}
        freq = 20.6;
        if chord
            freq = [freq getNote('G0s',0)];
            freq = [freq getNote('B0',0)];
        end
        
    case {'F0'}
        freq = 21.83;
        if chord
            freq = [freq getNote('A0',0)];
            freq = [freq getNote('C1',0)];
        end
        
    case {'F0s','G0f'}
        freq = 23.12;
        if chord
            freq = [freq getNote('A0s',0)];
            freq = [freq getNote('C1s',0)];
        end
        
    case {'G0'}
        freq = 24.5;
        if chord
            freq = [freq getNote('B0',0)];
            freq = [freq getNote('D1',0)];
        end
        
    case {'G0s','A0f'}
        freq = 25.96;
        if chord
            freq = [freq getNote('C1',0)];
            freq = [freq getNote('D1s',0)];
        end
        
    case {'A0'}
        freq = 27.5;
        if chord
            freq = [freq getNote('C1s',0)];
            freq = [freq getNote('E1',0)];
        end
        
    case {'A0s','B0f'}
        freq = 29.14;
        if chord
            freq = [freq getNote('D1',0)];
            freq = [freq getNote('F1',0)];
        end
        
    case {'B0'}
        freq = 30.87;
        if chord
            freq = [freq getNote('D1s',0)];
            freq = [freq getNote('F1s',0)];
        end
        
    case {'C1'}
        freq = 32.7;
        if chord
            freq = [freq getNote('E1',0)];
            freq = [freq getNote('G1',0)];
        end
        
    case {'C1s','D1f'}
        freq = 34.65;
        if chord
            freq = [freq getNote('F1',0)];
            freq = [freq getNote('G1s',0)];
        end
        
    case {'D1'}
        freq = 36.71;
        if chord
            freq = [freq getNote('F1s',0)];
            freq = [freq getNote('A1',0)];
        end
        
    case {'D1s','E1f'}
        freq = 38.89;
        if chord
            freq = [freq getNote('G1',0)];
            freq = [freq getNote('A1s',0)];
        end
        
    case {'E1'}
        freq = 41.2;
        if chord
            freq = [freq getNote('G1s',0)];
            freq = [freq getNote('B1',0)];
        end
        
    case {'F1'}
        freq = 43.65;
        if chord
            freq = [freq getNote('A1',0)];
            freq = [freq getNote('C2',0)];
        end
        
    case {'F1s','G1f'}
        freq = 46.25;
        if chord
            freq = [freq getNote('A1s',0)];
            freq = [freq getNote('C2s',0)];
        end
        
    case {'G1'}
        freq = 49;
        if chord
            freq = [freq getNote('B1',0)];
            freq = [freq getNote('D2',0)];
        end
        
    case {'G1s','A1f'}
        freq = 51.91;
        if chord
            freq = [freq getNote('C2',0)];
            freq = [freq getNote('D2s',0)];
        end
        
    case {'A1'}
        freq = 55;
        if chord
            freq = [freq getNote('C2s',0)];
            freq = [freq getNote('E2',0)];
        end
        
    case {'A1s','B1f'}
        freq = 58.27;
        if chord
            freq = [freq getNote('D2',0)];
            freq = [freq getNote('F2',0)];
        end
        
    case {'B1'}
        freq = 61.74;
        if chord
            freq = [freq getNote('D2s',0)];
            freq = [freq getNote('F2s',0)];
        end
        
    case {'C2'}
        freq = 65.41;
        if chord
            freq = [freq getNote('E2',0)];
            freq = [freq getNote('G2',0)];
        end
        
    case {'C2s','D2f'}
        freq = 69.3;
        if chord
            freq = [freq getNote('F2',0)];
            freq = [freq getNote('G2s',0)];
        end
        
    case {'D2'}
        freq = 73.42;
        if chord
            freq = [freq getNote('F2s',0)];
            freq = [freq getNote('A2',0)];
        end
        
    case {'D2s','E2f'}
        freq = 77.78;
        if chord
            freq = [freq getNote('G2',0)];
            freq = [freq getNote('A2s',0)];
        end
        
    case {'E2'}
        freq = 82.41;
        if chord
            freq = [freq getNote('G2s',0)];
            freq = [freq getNote('B2',0)];
        end
        
    case {'F2'}
        freq = 87.31;
        if chord
            freq = [freq getNote('A2',0)];
            freq = [freq getNote('C3',0)];
        end
        
    case {'F2s','G2f'}
        freq = 92.5;
        if chord
            freq = [freq getNote('A2s',0)];
            freq = [freq getNote('C3s',0)];
        end
        
    case {'G2'}
        freq = 98;
        if chord
            freq = [freq getNote('B2',0)];
            freq = [freq getNote('D3',0)];
        end
        
    case {'G2s','A2f'}
        freq = 103.83;
        if chord
            freq = [freq getNote('C3',0)];
            freq = [freq getNote('D3s',0)];
        end
        
    case {'A2'}
        freq = 110;
        if chord
            freq = [freq getNote('C3s',0)];
            freq = [freq getNote('E3',0)];
        end
        
    case {'A2s','B2f'}
        freq = 116.54;
        if chord
            freq = [freq getNote('D3',0)];
            freq = [freq getNote('F3',0)];
        end
        
    case {'B2'}
        freq = 123.47;
        if chord
            freq = [freq getNote('D3s',0)];
            freq = [freq getNote('F3s',0)];
        end
        
    case {'C3'}
        freq = 130.81;
        if chord
            freq = [freq getNote('E3',0)];
            freq = [freq getNote('G3',0)];
        end
        
    case {'C3s','D3f'}
        freq = 138.59;
        if chord
            freq = [freq getNote('F3',0)];
            freq = [freq getNote('G3s',0)];
        end
        
    case {'D3'}
        freq = 146.83;
        if chord
            freq = [freq getNote('F3s',0)];
            freq = [freq getNote('A3',0)];
        end
        
    case {'D3s','E3f'}
        freq = 155.56;
        if chord
            freq = [freq getNote('G3',0)];
            freq = [freq getNote('A3s',0)];
        end
        
    case {'E3'}
        freq = 164.81;
        if chord
            freq = [freq getNote('G3s',0)];
            freq = [freq getNote('B3',0)];
        end
        
    case {'F3'}
        freq = 174.61;
        if chord
            freq = [freq getNote('A3',0)];
            freq = [freq getNote('C4',0)];
        end
        
    case {'F3s','G3f'}
        freq = 185;
        if chord
            freq = [freq getNote('A3s',0)];
            freq = [freq getNote('C4s',0)];
        end
        
    case {'G3'}
        freq = 196;
        if chord
            freq = [freq getNote('B3',0)];
            freq = [freq getNote('D4',0)];
        end
        
    case {'G3s','A3f'}
        freq = 207.65;
        if chord
            freq = [freq getNote('C4',0)];
            freq = [freq getNote('D4s',0)];
        end
        
    case {'A3'}
        freq = 220;
        if chord
            freq = [freq getNote('C4s',0)];
            freq = [freq getNote('E4',0)];
        end
        
    case {'A3s','B3f'}
        freq = 233.08;
        if chord
            freq = [freq getNote('D4',0)];
            freq = [freq getNote('F4',0)];
        end
        
    case {'B3'}
        freq = 246.94;
        if chord
            freq = [freq getNote('D4s',0)];
            freq = [freq getNote('F4s',0)];
        end
        
    case {'C4'}
        freq = 261.63;
        if chord
            freq = [freq getNote('E4',0)];
            freq = [freq getNote('G4',0)];
        end
        
    case {'C4s','D4f'}
        freq = 277.18;
        if chord
            freq = [freq getNote('F4',0)];
            freq = [freq getNote('G4s',0)];
        end
        
    case {'D4'}
        freq = 293.66;
        if chord
            freq = [freq getNote('F4s',0)];
            freq = [freq getNote('A4',0)];
        end
        
    case {'D4s','E4f'}
        freq = 311.13;
        if chord
            freq = [freq getNote('G4',0)];
            freq = [freq getNote('A4s',0)];
        end
        
    case {'E4'}
        freq = 329.63;
        if chord
            freq = [freq getNote('G4s',0)];
            freq = [freq getNote('B4',0)];
        end
        
    case {'F4'}
        freq = 349.23;
        if chord
            freq = [freq getNote('A4',0)];
            freq = [freq getNote('C5',0)];
        end
        
    case {'F4s','G4f'}
        freq = 369.99;
        if chord
            freq = [freq getNote('A4s',0)];
            freq = [freq getNote('C5s',0)];
        end
        
    case {'G4'}
        freq = 392;
        if chord
            freq = [freq getNote('B4',0)];
            freq = [freq getNote('D5',0)];
        end
        
    case {'G4s','A4f'}
        freq = 415.3;
        if chord
            freq = [freq getNote('C5',0)];
            freq = [freq getNote('D5s',0)];
        end
        
    case {'A4'}
        freq = 440;
        if chord
            freq = [freq getNote('C5s',0)];
            freq = [freq getNote('E5',0)];
        end
        
    case {'A4s','B4f'}
        freq = 466.16;
        if chord
            freq = [freq getNote('D5',0)];
            freq = [freq getNote('F5',0)];
        end
        
    case {'B4'}
        freq = 493.88;
        if chord
            freq = [freq getNote('D5s',0)];
            freq = [freq getNote('F5s',0)];
        end
        
    case {'C5'}
        freq = 523.25;
        if chord
            freq = [freq getNote('E5',0)];
            freq = [freq getNote('G5',0)];
        end
        
    case {'C5s','D5f'}
        freq = 554.37;
        if chord
            freq = [freq getNote('F5',0)];
            freq = [freq getNote('G5s',0)];
        end
        
    case {'D5'}
        freq = 587.33;
        if chord
            freq = [freq getNote('F5s',0)];
            freq = [freq getNote('A5',0)];
        end
        
    case {'D5s','E5f'}
        freq = 622.25;
        if chord
            freq = [freq getNote('G5',0)];
            freq = [freq getNote('A5s',0)];
        end
        
    case {'E5'}
        freq = 659.25;
        if chord
            freq = [freq getNote('G5s',0)];
            freq = [freq getNote('B5',0)];
        end
        
    case {'F5'}
        freq = 698.46;
        if chord
            freq = [freq getNote('A5',0)];
            freq = [freq getNote('C6',0)];
        end
        
    case {'F5s','G5f'}
        freq = 739.99;
        if chord
            freq = [freq getNote('A5s',0)];
            freq = [freq getNote('C6s',0)];
        end
        
    case {'G5'}
        freq = 783.99;
        if chord
            freq = [freq getNote('B5',0)];
            freq = [freq getNote('D6',0)];
        end
        
    case {'G5s','A5f'}
        freq = 830.61;
        if chord
            freq = [freq getNote('C6',0)];
            freq = [freq getNote('D6s',0)];
        end
        
    case {'A5'}
        freq = 880;
        if chord
            freq = [freq getNote('C6s',0)];
            freq = [freq getNote('E6',0)];
        end
        
    case {'A5s','B5f'}
        freq = 932.33;
        if chord
            freq = [freq getNote('D6',0)];
            freq = [freq getNote('F6',0)];
        end
        
    case {'B5'}
        freq = 987.77;
        if chord
            freq = [freq getNote('D6s',0)];
            freq = [freq getNote('F6s',0)];
        end
        
    case {'C6'}
        freq = 1046.5;
        if chord
            freq = [freq getNote('E6',0)];
            freq = [freq getNote('G6',0)];
        end
        
    case {'C6s','D6f'}
        freq = 1108.73;
        if chord
            freq = [freq getNote('F6',0)];
            freq = [freq getNote('G6s',0)];
        end
        
    case {'D6'}
        freq = 1174.66;
        if chord
            freq = [freq getNote('F6s',0)];
            freq = [freq getNote('A6',0)];
        end
        
    case {'D6s','E6f'}
        freq = 1244.51;
        if chord
            freq = [freq getNote('G6',0)];
            freq = [freq getNote('A6s',0)];
        end
        
    case {'E6'}
        freq = 1318.51;
        if chord
            freq = [freq getNote('G6s',0)];
            freq = [freq getNote('B6',0)];
        end
        
    case {'F6'}
        freq = 1396.91;
        if chord
            freq = [freq getNote('A6',0)];
            freq = [freq getNote('C7',0)];
        end
        
    case {'F6s','G6f'}
        freq = 1479.98;
        if chord
            freq = [freq getNote('A6s',0)];
            freq = [freq getNote('C7s',0)];
        end
        
    case {'G6'}
        freq = 1567.98;
        if chord
            freq = [freq getNote('B6',0)];
            freq = [freq getNote('D7',0)];
        end
        
    case {'G6s','A6f'}
        freq = 1661.22;
        if chord
            freq = [freq getNote('C7',0)];
            freq = [freq getNote('D7s',0)];
        end
        
    case {'A6'}
        freq = 1760;
        if chord
            freq = [freq getNote('C7s',0)];
            freq = [freq getNote('E7',0)];
        end
        
    case {'A6s','B6f'}
        freq = 1864.66;
        if chord
            freq = [freq getNote('D7',0)];
            freq = [freq getNote('F7',0)];
        end
        
    case {'B6'}
        freq = 1975.53;
        if chord
            freq = [freq getNote('D7s',0)];
            freq = [freq getNote('F7s',0)];
        end
        
    case {'C7'}
        freq = 2093;
        if chord
            freq = [freq getNote('E7',0)];
            freq = [freq getNote('G7',0)];
        end
        
    case {'C7s','D7f'}
        freq = 2217.46;
        if chord
            freq = [freq getNote('F7',0)];
            freq = [freq getNote('G7s',0)];
        end
        
    case {'D7'}
        freq = 2349.32;
        if chord
            freq = [freq getNote('F7s',0)];
            freq = [freq getNote('A7',0)];
        end
        
    case {'D7s','E7f'}
        freq = 2489.02;
        if chord
            freq = [freq getNote('G7',0)];
            freq = [freq getNote('A7s',0)];
        end
        
    case {'E7'}
        freq = 2637.02;
        if chord
            freq = [freq getNote('G7s',0)];
            freq = [freq getNote('B7',0)];
        end
        
    case {'F7'}
        freq = 2793.83;
        if chord
            freq = [freq getNote('A7',0)];
            freq = [freq getNote('C8',0)];
        end
        
    case {'F7s','G7f'}
        freq = 2959.96;
        if chord
            freq = [freq getNote('A7s',0)];
            freq = [freq getNote('C8s',0)];
        end
        
    case {'G7'}
        freq = 3135.96;
        if chord
            freq = [freq getNote('B7',0)];
            freq = [freq getNote('D8',0)];
        end
        
    case {'G7s','A7f'}
        freq = 3322.44;
        if chord
            freq = [freq getNote('C8',0)];
            freq = [freq getNote('D8s',0)];
        end
        
    case {'A7'}
        freq = 3520;
        if chord
            freq = [freq getNote('C8s',0)];
            freq = [freq getNote('E8',0)];
        end
        
    case {'A7s','B7f'}
        freq = 3729.31;
        if chord
            freq = [freq getNote('D8',0)];
            freq = [freq getNote('F8',0)];
        end
        
    case {'B7'}
        freq = 3951.07;
        if chord
            freq = [freq getNote('D8s',0)];
            freq = [freq getNote('F8s',0)];
        end
        
    case {'C8'}
        freq = 4186.01;
        if chord
            freq = [freq getNote('E8',0)];
            freq = [freq getNote('G8',0)];
        end
        
    case {'C8s','D8f'}
        freq = 4434.92;
        if chord
            freq = [freq getNote('F8',0)];
            freq = [freq getNote('G8s',0)];
        end
        
    case {'D8'}
        freq = 4698.63;
        if chord
            freq = [freq getNote('F8s',0)];
            freq = [freq getNote('A8',0)];
        end
        
    case {'D8s','E8f'}
        freq = 4978.03;
        if chord
            freq = [freq getNote('G8',0)];
            freq = [freq getNote('A8s',0)];
        end
        
    case {'E8'}
        freq = 5274.04;
        if chord
            freq = [freq getNote('G8s',0)];
            freq = [freq getNote('B8',0)];
        end
        
    case {'F8'}
        freq = 5587.65;
        if chord
            freq = [freq getNote('A8',0)];
            freq = [freq getNote('C8',0).*2];
        end
        
    case {'F8s','G8f'}
        freq = 5919.91;
        if chord
            freq = [freq getNote('A8s',0)];
            freq = [freq getNote('C8s',0).*2];
        end
        
    case {'G8'}
        freq = 6271.93;
        if chord
            freq = [freq getNote('B8',0)];
            freq = [freq getNote('D8',0).*2];
        end
        
    case {'G8s','A8f'}
        freq = 6644.88;
        if chord
            freq = [freq getNote('C8',0).*2];
            freq = [freq getNote('D8s',0).*2];
        end
        
    case {'A8'}
        freq = 7040;
        if chord
            freq = [freq getNote('C8s',0).*2];
            freq = [freq getNote('E8',0).*2];
        end
        
    case {'A8s','B8f'}
        freq = 7458.62;
        if chord
            freq = [freq getNote('D8',0).*2];
            freq = [freq getNote('F8',0).*2];
        end
        
    case {'B8'}
        freq = 7902.13;
        if chord
            freq = [freq getNote('D8s',0).*2];
            freq = [freq getNote('F8s',0).*2];
        end
        
    otherwise
        freq =0.0;
end


