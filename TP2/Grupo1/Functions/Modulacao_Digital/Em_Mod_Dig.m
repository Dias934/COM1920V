function [resData, resEn] = Em_Mod_Dig(modDig, data, ampCL, amp, tBit, freqH, freqL, nAm, En)
    switch modDig
        case 1
            [resData, resEn]=Em_OOK(data, ampCL, amp, tBit, freqH, nAm);
        case 2
            [resData, resEn]=Em_FSK(data, ampCL, amp, tBit, freqH, freqL, nAm);
        otherwise
            resData=data;
            resEn=En;
    end
end

