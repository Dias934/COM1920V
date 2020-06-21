function [ret] = Generate_Uni_Block(data, idx, N)
    i=1;
    ret=zeros(1,N);
    count=0;
    while (idx+i-1)<=numel(data) && i<=N
        ret(i)=data(idx+i-1);
        if(ret(i)==0)   %só é necessário bit-stuffing com bit a 0
            count=count+1;
        end
        i=i+1;
    end
    while i<=N
        ret(i)=1;    
        i=i+1;
    end
    if(count==N)
        newRet=zeros(1,N+1);
        newRet(1:N)=ret;
        newRet(N+1)=1;
        ret=newRet;
    end
end

