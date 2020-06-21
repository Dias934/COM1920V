function [fileRes] = decodFonte(filename,cod, dict)
    switch (cod)
        case 0
            fileRes=filename;
        case 1
            [fileRes]=huffman_decode(filename, dict);
        case 2
            [fileRes]=zip_decode(filename);
    end
end

