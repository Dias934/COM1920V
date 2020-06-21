function [ret] = Generate_Bip_Block(data, idx, N)
    i=1;
    ret=zeros(1,N);
    bit=data(idx);
    count=0;
    while (idx+i-1)<=numel(data) && i<=N
        ret(i)=data(idx+i-1);
        if(ret(i)==bit)
            count=count+1;
        end
        i=i+1;
    end
    while i<=N
        %fill the block with the inverse of the first bit to avoid
        %bit-stuffing
        ret(i)=mod(bit+1,2);    
        i=i+1;
    end
    if(count==N)
        newRet=zeros(1,N+1);
        newRet(1:N)=ret;
        newRet(N+1)=mod(bit+1,2);
        ret=newRet;
    end
end

