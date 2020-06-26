function [resFile] = Re_NRZ_Bip_Abs(filename, data, amp, NAm)
    N=6;
    recv=zeros(8,1);
    count=1;
    idx=1;
    bit=-1;
    i=1;
    while(i<numel(data))
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
        if(bit==-1)
            bit=recv(idx);
        elseif(recv(idx)==bit)
            count=count+1;
        end
        if(idx~=1 && mod(idx,N)==0)
            if(count==N)
                i=i+NAm;    %ignore bit-stuffing
            end
            bit=-1;
            count=1;
        end
        idx=idx+1;
        i=i+NAm;
    end
    resFile=strcat("NRZBA_",filename);
    vector2file(bi2de(recv'), resFile);
end

