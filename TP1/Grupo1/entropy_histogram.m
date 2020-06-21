function [H] = entropy_histogram(filename, extension, interval)
    %read file content
    vect = file2vector(strcat(filename,extension)); %vector of file content 
    symbols =unique(vect);                          %vector of symbols used on the file
    
    %calculation of entropy
    [counts]=histc(vect,symbols);                   %nº of occurrencies of each symbol
	p=counts./sum(counts);                          %probability of each symbol
    H=-sum(p.*log2(p));                             %calculation of entropy
    
    %plot the histogram and all the useful information
	fig=figure('Name',strcat(filename,extension));
    histogram(vect, interval);
    grid on;
    xlabel('Símbolos');
    ylabel('Ocorrências');
    title('Histograma');
    annotation('textbox', [0.75, 0.75, 0.1, 0.1], 'String', "H(X)= " + H)
    
    %save the figure with the histogram to a file (documentation porpuses).
    str=strcat(filename,"_",strip(extension,'left','.'));
    saveas(fig,str,'png');
end

