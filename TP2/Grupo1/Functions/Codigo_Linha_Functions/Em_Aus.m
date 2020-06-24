%convert vector of bits to a vector of digital signals
function [data, time, En] = Em_Aus(filename, amp, NAm, tBit)
    vect=file2vector(filename);
    bin=de2bi(vect)';
    En=zeros(1, numel(bin));
    time=0: tBit/NAm :numel(bin)*tBit;
    data=zeros(1, numel(time));
    idx=1;
    for i=1:NAm:numel(data)-1
        if(bin(idx)==1)
            data(i:i+NAm)=amp;
            En(idx)=power(amp,2)*tBit;
        else
            data(i:i+NAm)=0;
        end
        idx=idx+1;
    end
end

