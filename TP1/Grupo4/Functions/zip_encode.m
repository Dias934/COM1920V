function [nBits, resultFile] = zip_encode(filename)
    resultFile=strcat("zip_",filename);
    zip(resultFile,filename);
    if(~contains(resultFile,".zip"))
        resultFile=strcat(resultFile,".zip");
    end
    fid = fopen(resultFile);
    fseek(fid, 0, 'eof');
    nBits = ftell(fid)*8;
    fclose(fid);
end

