function symbol_source(symbs, fmp, M, filename)
    %check constraints
    if(length(symbs)~= length(fmp))      %check if all symbols have an associated probability
        error("symbs and fmp length mismatch");
    end
    if(sum(fmp)~=1)                      %check if the sum of all probabilities is 1
        error("fmp values out of bounds");
    end
    
    %write to file
    fid=fopen(filename, 'wt');
    for i=1:1:length(fmp)
        oc=M*fmp(i);     %calculate the number of occurencies of symbol(i)
        for j=1:1:oc
            fprintf(fid,'%s',symbs(i));   %write to file the symbol(i)
        end
    end   
    fclose(fid);
end

