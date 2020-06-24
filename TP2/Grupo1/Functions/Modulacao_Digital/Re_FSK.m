function [resData] = Re_FSK(codL, data, freqH, tBit, nAm, amp, ampCL)
    resData=zeros(1, numel(data));
    vtb=0:tBit/nAm:tBit;                %vetor de tempo de bit
    vtb=vtb(1:end-1);
    sigH=cos(2*pi*freqH*vtb);
    for i=1:nAm:numel(data)-nAm
        vbit=data(i:i+nAm-1);             %sinal de 1 bit
        [~,En]=Correlator(sigH, vbit);
        bit=round((2*En/tBit));
        if(bit >= power(freqH, 2))
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

