function [resFile] = Re_NRZ_Uni_Mark(filename, data, amp, NAm)
    N=6;
    recv=zeros(8,1);
    count=0;
    idx=1;
    mark=0;
    i=1;
    while(i<numel(data))
        if(idx>numel(recv))
            if((numel(data)-i)/NAm<8)
                break;
            end
            recv=[recv zeros(8,1)];
        end
        if(data(i)==mark*amp)
            recv(idx)=0;
            count=count+1;
        else
            recv(idx)=1;
            mark=mod(mark+1,2);
        end
        if(idx~=6 && mod(idx,N)==0)
            if(count==N)
                i=i+NAm;    %ignore bit-stuffing
            end
            count=0; 
        end
        idx=idx+1;
        i=i+NAm;
    end
    resFile=strcat("NRZUM_",filename);
    vector2file(bi2de(recv'), resFile);
end

