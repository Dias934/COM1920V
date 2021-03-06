function [data, time, En] = Em_NRZ_Uni_Mark(filename, amp, NAm, tBit)
    vect=file2vector(filename);
    bin=de2bi(vect,8)';
    N=6;    %blocks of 6

    %Não é a melhor solução, no entanto não é possivel prever o tamanho do
    %vetor, sem que seja feita a análise dos dados
    encoded=[];
    
    for i=1:6:numel(bin)
        encoded=[encoded Generate_Uni_Block(bin, i, N)];
    end
    En=0;
    time=0: tBit/NAm :numel(encoded)*tBit;
    data=zeros(1, numel(time));
    idx=1;
    mark=0; %mark=0. Se o primeiro bit for 1, a saida do emissor começa com uma amplitude de amp
    for i=1:NAm:numel(data)-1
        if(encoded(idx)==1)
            mark=mod(mark+1,2); %mark vai ser sempre 0 ou 1;  
        end
        data(i:i+NAm)=amp*mark;
        En=En+power(amp*mark,2)*tBit;
        idx=idx+1;
    end
    En=En/numel(bin);
end

