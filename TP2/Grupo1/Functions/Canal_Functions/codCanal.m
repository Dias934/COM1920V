function [nBits, fileRes] = codCanal(filename, cod)
    switch (cod)
        case 0
            fileRes=filename;
            fid = fopen(fileRes);
            fseek(fid, 0, 'eof');
            nBits = ftell(fid)*8;
            fclose(fid);
        case 1
            fileRes=parity_check_encode(filename);
            fid = fopen(fileRes);
            fseek(fid, 0, 'eof');
            nBits = ftell(fid)*8;
            fclose(fid);
        case 2
            [nBits, fileRes]=hamming_encode(filename);
    end
end

