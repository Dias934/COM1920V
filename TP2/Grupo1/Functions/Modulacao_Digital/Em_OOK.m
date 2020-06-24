function [resData, Pot] = Em_OOK(data, ampCL, amp, tBit, freq, nAm)
    resData=zeros(1, numel(data));
    Pot=zeros(1, (numel(data)-1) / nAm);
    idx=1;
    for i=1:nAm:numel(data)-nAm
        if(data(i)==ampCL)
            resData(i:i+nAm)=Generate_Sinusoide(tBit, amp, freq, nAm);
            Pot(idx)=power(amp, 2)/2;
        end
        idx=idx+1;
    end
end

