function [resData] = Re_Mod_Dig(modDig, codL, data, ampCL, nAm)
    switch modDig
        case 1
            resData=Re_OOK(codL, data, nAm, ampCL);
        case 2
            resData=data;
        otherwise
            resData=data;
    end
end

