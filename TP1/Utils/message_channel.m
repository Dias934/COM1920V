function [message] = message_channel(message,BER,expectedBits)
    if(BER>=0)
        error("Pow of BER must be negative value");
    end
    
    if(expectedBits<=0)
        error("Expected error bits must be greater than 0");
    end
    
    count=0;
    for i=1:1:numel(message)
        for j=1:1:expectedBits
            if(randi(10^(BER*-1))==1)
                message(i)=mod(message(i)+1,2);
                count=count+1;
                break;
            end
        end
    end
    fprintf("errors inserted: %d\n",count);
end

