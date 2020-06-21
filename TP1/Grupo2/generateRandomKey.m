function key = generateRandomKey(filename)
    len=length(file2vector(filename));    %get the number of characters in a file
    key=int16(255*rand(1,len));           %generate vector of 1xlen with random numbers between 0 and 255
end

