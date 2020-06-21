function testFiles(filename1, filename2)
    vect1 = file2vector(filename1);
    vect2 = file2vector(filename2);
    if(length(vect1) ~= length(vect2))
        error('Files with different lengths. Not the same!');
    end
    for i=1:1:length(vect1)
        if(vect1(i) ~= vect2(i))
            error('Error at character %d -> expected: %d, actual %d',i, vect1(i), vect2(i));
        end
    end
    disp("Passed");
end

