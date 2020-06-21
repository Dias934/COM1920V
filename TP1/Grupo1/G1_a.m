clear
clc

M=256;  %nº de símbolos possíveis (caracteres da tabela ASCII)
res=entropy_histogram('a','.txt',M);
display(res); % visualizar o resultado obtido da entropia