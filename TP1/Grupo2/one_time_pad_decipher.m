function resFile=one_time_pad_decipher(filename, key)
    %obtain file content
    vect = file2vector(filename);
    if(length(key)~=length(vect))                       %check One time pad constraint
        error("key must be the same size as the message")
    end
    
    %encode
    decipher=zeros(1,length(vect));                %prepare decipher vector
    for i=1:1:length(key)
        decipher(i)=vect(i)-key(i);               %subract file byte with key byte
        decipher(i)=mod(decipher(i),256);           %get the first 8 bits
    end
    
    %write cyphered vector to a file
    resFile=strcat("OTPD_",filename);
    vector2file(decipher, resFile);
end

