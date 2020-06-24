function [resData] = Re_OOK(codL, data, amp, ampCL, nAm, tBit)
    resData=zeros(1, numel(data));
    vtb=0:tBit/nAm:tBit;                %vetor de tempo de bit
    vtb=vtb(1:end-1);
    for i=1:nAm:numel(data)-nAm
        vbit=data(i:i+nAm-1);             %sinal de 1 bit
        [~,En]=Correlator(vtb, abs(vbit));
        bit=round((2*En/tBit));
        if(bit >= amp)
            resData(i:i+nAm-1)=ampCL;
        else
            if(codL==1)
                resData(i:i+nAm-1)=-ampCL;
            else
                resData(i:i+nAm-1)=0;
            end
        end
    end
end

