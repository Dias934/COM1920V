function resFile=one_time_pad_decipher(filename, key)
    vect = file2vector(filename);
    if(length(key)~=length(vect))
        error("key must be the same size as the message")
    end
    decipher=zeros(1,length(vect)); 
    for i=1:1:length(key)
        decipher(i)=vect(i)-key(i);
        decipher(i)=mod(decipher(i),256);
    end
    resFile=strcat("OTPD_",filename);
    vector2file(decipher, resFile);
end

