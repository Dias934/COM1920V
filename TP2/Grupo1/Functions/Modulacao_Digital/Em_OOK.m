function [resData, Pot] = Em_OOK(data, ampCL, amp, tBit, freq, nAm)
    resData=zeros(1, numel(data));
    Pot=0;%zeros(1, (numel(data)-1) / nAm);
    idx=1;
    for i=1:nAm:numel(data)-nAm
        if(data(i)==ampCL)
            resData(i:i+nAm)=Generate_Sinusoide(tBit, amp, freq, nAm);
            Pot=Pot+power(amp, 2)/2;
        end
        idx=idx+1;
    end
    Pot=Pot/((numel(data)-1) / nAm);
end

