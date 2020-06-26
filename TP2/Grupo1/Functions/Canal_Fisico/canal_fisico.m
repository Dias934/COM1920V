function [resData] = canal_fisico(EnSin, SNR, data, aten)
    EnB=max(EnSin);
    EnR=EnB/SNR;
    data=aten*data;
    resData=zeros(1,numel(data));
    for i=1: numel(data)
        r=randn();
        integ=fix(r);
        noise=mod(abs(r), abs(integ))*sign(r);
        resData(i)=data(i)+noise*EnR;
    end
end

