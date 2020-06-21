clear all
clc

res=parity_check_encode('a.txt');
res=ber_simulation(res,-3,5);
res=parity_check_decode(res);
testFiles('a.txt',res);