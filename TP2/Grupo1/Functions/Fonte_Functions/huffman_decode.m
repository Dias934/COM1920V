function [fileRes] = huffman_decode(filename, dict)
    vect=file2vector(filename);
    res=huffmandeco(vect,dict);
    fileRes=strcat("HufD_",filename);
    vector2file(res,fileRes);
end

