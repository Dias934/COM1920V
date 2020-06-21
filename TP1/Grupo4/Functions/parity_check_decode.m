function [fileRes]=parity_check_decode(filename)
    vect=de2bi(file2vector(filename))'; %get file content and transform to a binary matrix
    message=vect(1:7,:); %get the message from the matrix ignoring the parity bit
    
    decoded=zeros(8,floor(numel(message)/8)); %prepare the decoded message
    count=0; %error count
    
    for i=1:8:numel(vect)
        if(mod(sum(vect(i:i+6)),2)~=vect(i+7))
            count=count+1;
            fprintf('error at block %d.\n',uint32(i/8)+1);
        end
        if(i+7<numel(message))
            decoded(i:i+7)=message(i:i+7);
        end
    end
    
    fprintf('%d errors found.\n',count);
    fileRes=strcat("ParD_",filename);
    vector2file(bi2de(decoded'),fileRes);
end

