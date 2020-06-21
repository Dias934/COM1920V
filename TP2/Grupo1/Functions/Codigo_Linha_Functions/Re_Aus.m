function [fileRes] = Re_Aus(filename, data, amp, NAm)
    recv=zeros(8,1);
    idx=1;
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
        idx=idx+1;
    end
    fileRes=strcat("CLA_",filename);
    vector2file(bi2de(recv'), fileRes);
end

