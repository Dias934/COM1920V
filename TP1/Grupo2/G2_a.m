clc
clear

key=generateRandomKey('a.txt');
res=one_time_pad_cipher('a.txt',key);
res=one_time_pad_decipher(res,key);
disp('done')