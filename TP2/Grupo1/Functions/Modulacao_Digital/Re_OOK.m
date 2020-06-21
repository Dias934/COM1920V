function [resData] = Re_OOK(codL, data, nAm, ampCL)
    resData=zeros(1, numel(data));
    for i=1:nAm:numel(data)-nAm
        if(data(i+1)==0)
            if(codL==1)
                resData(i:i+nAm-1)=-ampCL;
            else
                resData(i:i+nAm-1)=0;
            end
        else
            resData(i:i+nAm-1)=ampCL;
        end
    end
end

