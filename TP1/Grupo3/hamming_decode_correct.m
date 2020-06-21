function fileRes=hamming_decode_correct(filename)
    encoded=de2bi(file2vector(filename),8)';
    
    encoded_m=encoded(1:4,:);
    decoded=zeros(8,floor(numel(encoded_m)/8));
    
    idx=1;
    for i=1:8:numel(encoded)
        error=mod(encoded(i+4)+encoded(i+1)+encoded(i+2)+encoded(i+3),2)*4;
        error=error+mod(encoded(i+5)+encoded(i)+encoded(i+1)+encoded(i+3),2)*2;
        error=error+mod(encoded(i+6)+encoded(i)+encoded(i+2)+encoded(i+3),2);
        switch(error)
            case 3
                encoded_m(idx)=mod(encoded_m(idx)+1,2); %correct m0
            case 5
                encoded_m(idx+2)=mod(encoded_m(idx+2)+1,2); %correct m2
            case 6
                encoded_m(idx+1)=mod(encoded_m(idx+1)+1,2); %correct m1
            case 7
                encoded_m(idx+3)=mod(encoded_m(idx+3)+1,2); %correct m3
        end
        decoded(idx:idx+3)=encoded_m(idx:idx+3);
        idx=idx+4;
    end
    fileRes=strcat("H74D_",filename);
    vector2file(bi2de(decoded'),fileRes);
end

