function [resData] = Re_Mod_Aus(codL, data, ampCL, nAm)
    resData=zeros(1, numel(data));
    vtb=ones(1,nAm);                %vetor de tempo de bit
    for i=1:nAm:numel(data)-nAm
        vbit=data(i:i+nAm-1);             %sinal de 1 bit
        [~,En]=Correlator(vtb, vbit);
        if(codL==1)
            if(En>0)
                resData(i:i+nAm-1)=ampCL;
            else
                resData(i:i+nAm-1)=-ampCL;
            end
        else
            if(En>=power(ampCL,2))
                resData(i:i+nAm-1)=ampCL;
            else
                resData(i:i+nAm-1)=0;
            end
        end
    end
end

