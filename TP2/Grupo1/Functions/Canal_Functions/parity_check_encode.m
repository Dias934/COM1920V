function [fileRes] = parity_check_encode(filename)
    vect=file2vector(filename);
    bin=de2bi(vect)'; %Transposed because of MATLAB linear indexation
    
    len=numel(bin); %number of elements in the matrix bin
    size=floor(len/7)*8; %
    if(mod(len,7)>0)
        size=size+8; %in case there is a message block that has less than 7 bits
    end
    encoded=zeros(8,size/8);    %prepare the encoding matrix
    
    idx=1; 
    for i=1:7:len
        if(len-i>7)
            encoded(idx:idx+7)=bin(i:i+7);
        else
            encoded(idx:idx+len-i)=bin(i:len);
        end
        encoded(idx+7)=mod(sum(encoded(idx:idx+6)),2); %same thing as using xor from bit 1 to 7 and save the result on the 8th bit
        idx=idx+8;
    end
    
    fileRes=strcat("ParC_",filename);
    vector2file(bi2de(encoded'),fileRes);
end