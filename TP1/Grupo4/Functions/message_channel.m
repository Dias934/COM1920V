function [message, count] = message_channel(message,BER,nBits)
    if(BER>=0)
        error("BER value must be negative value");
    end
    count=0;
    for i=1:1:numel(message)
        for j=1:1:nBits
            if(randi(10^(BER*-1))==1)
                message(i)=mod(message(i)+1,2);
                count=count+1;
                break;
            end
        end
    end
end

