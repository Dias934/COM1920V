function [nBits, fileRes, dict] = codFonte(filename,cod)
    dict=[];
    switch (cod)
        case 0
            fileRes=filename;
            fid = fopen(filename);
            fseek(fid, 0, 'eof');
            nBits = ftell(fid)*8;
            fclose(fid);
        case 1
            [nBits, fileRes, dict]=huffman_encode(filename);
        case 2
            [nBits, fileRes]=zip_encode(filename);
    end
end

