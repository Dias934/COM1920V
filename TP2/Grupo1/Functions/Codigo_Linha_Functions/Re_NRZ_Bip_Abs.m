function [resFile] = Re_NRZ_Bip_Abs(filename, data, amp, NAm)
    N=6;
    recv=zeros(8,1);
    count=0;
    idx=1;
    bit=0;
    for i=1:NAm:numel(data)
        if(idx>numel(recv))
            if((numel(data)-i)/NAm<8)
                break;
            end
            recv=[recv zeros(8,1)];
        end
        if(data(i)==amp)
            recv(idx)=1;
        else
            recv(idx)=0;
        end
        if(mod(idx-1,N)==0)
            if(count==N)
                i=i+NAm;    %ignore bit-stuffing
            end
            bit=recv(idx);
            count=1;
        elseif(recv(idx)==bit)
            count=count+1;
        end
        idx=idx+1;
    end
    resFile=strcat("NRZBA_",filename);
    vector2file(bi2de(recv'), resFile);
end

