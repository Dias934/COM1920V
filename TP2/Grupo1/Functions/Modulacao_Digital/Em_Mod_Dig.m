function [resData] = Em_Mod_Dig(modDig, data, ampCL, amp, tBit, freqH, freqL, nAm)
    switch modDig
        case 1
            resData=Em_OOK(data, ampCL, amp, tBit, freqH, nAm);
        case 2
            resData=Em_FSK(data, ampCL, amp, tBit, freqH, freqL, nAm);
        otherwise
            resData=data;
    end
end

