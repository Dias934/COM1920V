function [nBits, fileRes, dict] = huffman_encode(filename)
    vect = file2vector(filename);
    symbols = unique(vect);
    [counts]=histc(vect,symbols);
    % Probabilidades dos símbolos.
    p = counts./sum(counts);    
    
    dict = huffmandict(symbols,p);
    enc=huffmanenco(vect,dict);
    nBits=length(enc);
    fileRes=strcat("HufC_",filename);
    
    vector2file(enc,fileRes);
end

