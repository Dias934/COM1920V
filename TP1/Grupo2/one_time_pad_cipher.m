function [resFile]=one_time_pad_cipher(filename, key)
    %obtain file content
    vect = file2vector(filename);
    if(length(key)~=length(vect))                       %check One time pad constraint
        error("key must be the same size as the message")
    end
    
    %encode
    cipher=zeros(1,length(vect));               %prepare cipher vector
    for i=1:1:length(key)
        cipher(i)=vect(i)+key(i);               %sum file byte with key byte     
        cipher(i)=mod(cipher(i),256);           %get the first 8 bits
    end
    
    %write cyphered vector to a file
    resFile=strcat("OTPC_",filename);
    vector2file(cipher, resFile);
end

