function resData = Generate_Sinusoide(tBit, amp, freq, nAm)
    t=0:tBit/nAm:tBit;
    resData=amp*cos(2*pi*freq*t);
end

