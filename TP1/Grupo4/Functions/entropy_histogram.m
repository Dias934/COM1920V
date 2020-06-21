function [H,nBits] = entropy_histogram(filename)
    vect = file2vector(filename);
    symbols = unique(vect);
    [counts]=histc(vect,symbols);
    nBits=sum(counts)*8;
	frequency=counts./sum(counts);
    H=-sum(frequency.*log2(frequency));
    
    histogram(vect, 256);
    grid on;
    xlabel('Símbolos');
    ylabel('Ocorrências');
    title('Histograma');
end

