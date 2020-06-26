function [resData, Pot] = Em_FSK(data, ampCL, amp, tBit, freqH, freqL, nAm)
    resData=zeros(1, numel(data));
    Pot=0;
    idx=1;
    for i=1:nAm:numel(data)-nAm
        if(data(i)==ampCL)
            resData(i:i+nAm)=Generate_Sinusoide(tBit, amp, freqH, nAm);
        else
            resData(i:i+nAm)=Generate_Sinusoide(tBit, amp, freqL, nAm);
        end
        Pot=Pot+power(amp, 2)/2;
        idx=idx+1;
    end
    Pot=Pot/((numel(data)-1) / nAm);
end

