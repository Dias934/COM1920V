clear
clc

key=generateRandomKey('a.txt');
res=one_time_pad_cipher('a.txt',key);
res=one_time_pad_decipher(res,key);
testFiles('a.txt',res);

key=generateRandomKey('teste.txt');
res=one_time_pad_cipher('teste.txt',key);
res=one_time_pad_decipher(res,key);
testFiles('teste.txt',res);

key=generateRandomKey('bird.gif');
res=one_time_pad_cipher('bird.gif',key);
res=one_time_pad_decipher(res,key);
testFiles('bird.gif',res);

key=generateRandomKey('lena.bmp');
res=one_time_pad_cipher('lena.bmp',key);
res=one_time_pad_decipher(res,key);
testFiles('lena.bmp',res);