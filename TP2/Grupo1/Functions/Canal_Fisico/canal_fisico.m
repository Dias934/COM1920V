function [resData] = canal_fisico(EnSin, SNR, data, aten, nAm)
    EnR=EnSin(1)/SNR;
    data=aten*data;
    resData=zeros(1,numel(data));
    idx=1;
    for i=1: numel(data)
        if(i ~= 2 && mod(i,nAm)==2)
            idx=idx+1;
            EnR=EnSin(idx)/SNR;
        end
        r=randn();
        integ=fix(r);
        noise=mod(abs(r), abs(integ))*sign(r);
        resData(i)=data(i)+noise*EnR;
    end
end

