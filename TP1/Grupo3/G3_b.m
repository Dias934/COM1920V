clear all
clc

[n,res]=hamming_encode("a.txt");
res=ber_simulation(res,-2,5);
[res]=hamming_decode_correct(res);
testFiles('a.txt',res);