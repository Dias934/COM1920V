function [fileRes] = decodCanal(filename, cod)
    switch (cod)
        case 0
            fileRes=filename;
        case 1
            [fileRes]=parity_check_decode(filename);
        case 2
            [fileRes]=hamming_decode_correct(filename);
    end
end

