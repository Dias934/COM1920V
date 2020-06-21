clear
clc

filenames=["a";"alice29";"arj241a";"bird";"cp";"lena";"lena";"lena";"Person";"progc";"watermark"];
extensions=[".txt";".txt";".exe";".gif";".htm";".bmp";".jpg";".zip";".java";".c";".cs";];
M=255;
for i=1:1:length(filenames)
   res=entropy_histogram(filenames(i),extensions(i), M);
   disp(res);
end


