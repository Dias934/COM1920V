clear
clc

M=[100 1000 10000];

symbols=['A' 'E' 'I' 'O' 'U']; %dado normal 
fmp1=[1/5 1/5 1/5 1/5 1/5];
fmp2=[14/50 17/50 10/50 7/50 2/50];
interval=ones(1,10);
for j=1:1:5
    interval(1+(j-1)*2:2+(j-1)*2)=[double(symbols(j)) double(symbols(j))+1];
end
for i=1:1:3
   symbol_source(symbols,fmp1,M(i),strcat('test_D_P1_idx_',int2str(i),'.txt'));
   entropy_histogram(strcat('test_D_P1_idx_',int2str(i)),'.txt',interval);
   symbol_source(symbols,fmp2,M(i),strcat('test_D_P2_idx_',int2str(i),'.txt'));
   entropy_histogram(strcat('test_D_P2_idx_',int2str(i)),'.txt',interval);
end