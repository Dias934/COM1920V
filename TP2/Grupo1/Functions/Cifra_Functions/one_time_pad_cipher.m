function resFile=one_time_pad_cipher(filename, key)
    vect = file2vector(filename);
    if(length(key)~=length(vect))
        error("key must be the same size as the message")
    end
    cipher=zeros(1,length(vect));
    for i=1:1:length(key)
        cipher(i)=vect(i)+key(i);
        cipher(i)=mod(cipher(i),256);
    end
    resFile=strcat("OTPC_",filename);
    vector2file(cipher, resFile);
end

