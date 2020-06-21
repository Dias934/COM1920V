function [resData] = Em_OOK(data, ampCL, amp, tBit, freq, nAm)
    resData=zeros(1, numel(data));
    for i=1:nAm:numel(data)-nAm
        if(data(i)==ampCL)
            resData(i:i+nAm)=Generate_Sinusoide(tBit, amp, freq, nAm);
        end
    end
end

