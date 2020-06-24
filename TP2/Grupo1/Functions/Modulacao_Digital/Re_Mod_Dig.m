function [resData] = Re_Mod_Dig(modDig, codL, data, freqH, amp, ampCL, nAm, tBit)
    switch modDig
        case 1
            resData=Re_OOK(codL, data, amp, ampCL, nAm, tBit);
        case 2
            resData=Re_FSK(codL, data, freqH, tBit, nAm, amp, ampCL);
        otherwise
            resData=Re_Mod_Aus(codL, data, ampCL, nAm, tBit);
    end
end

