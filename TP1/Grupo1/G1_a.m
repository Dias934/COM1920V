clear
clc

M=256;  %n� de s�mbolos poss�veis (caracteres da tabela ASCII)
res=entropy_histogram('a','.txt',M);
display(res); % visualizar o resultado obtido da entropia