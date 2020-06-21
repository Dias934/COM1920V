function [len, fileRes] = hamming_encode(filename)
    vect=file2vector(filename);
    bin=de2bi(vect,8)';
    
    enc=zeros(7,numel(bin)/4);
    
    len=numel(enc);
    idx=1;
    for i=1:7:len
        enc(i:i+3)=bin(idx:idx+3);
        enc(i+4)=mod(enc(i+1)+enc(i+2)+enc(i+3),2);
        enc(i+5)=mod(enc(i)+enc(i+1)+enc(i+3),2);
        enc(i+6)=mod(enc(i)+enc(i+2)+enc(i+3),2);
        idx=idx+4;
    end
    fileRes=strcat("H74C_",filename);
    vector2file(bi2de(enc'),fileRes);
end

