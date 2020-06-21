function key = generateRandomKey(filename)
    l=length(file2vector(filename));
    key=int16(255*rand(1,l));
end

