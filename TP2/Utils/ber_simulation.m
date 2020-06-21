function [resFile]=ber_simulation(filename, powBer, valBer)
    vect=file2vector(filename);
    bin=de2bi(vect)';
    [message] = message_channel(bin, powBer, valBer);
    resFile=strcat("T_",filename);
    vector2file(bi2de(message'), resFile);
end

