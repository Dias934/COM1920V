function [data, time] = Em_NRZ_Uni_Mark(filename, amp, NAm, tBit)
    vect=file2vector(filename);
    bin=de2bi(vect)';
    N=6;    %blocks of 6
    
    %Não é a melhor solução, no entanto não é possivel prever o tamanho do
    %vetor, sem que seja feita a análise dos dados
    encoded=[];
    
    for i=1:6:numel(bin)
        encoded=[encoded Generate_Uni_Block(bin, i, N)];
    end
    
    time=0: tBit/NAm :numel(encoded)*tBit;
    data=zeros(1, numel(time));
    idx=1;
    mark=0;
    count=0;
    for i=1:tBit*NAm:numel(data)*tBit-1
        if(encoded(idx)==1)
            mark=mod(mark+1,2);
            data(i:i+tBit*NAm)=amp*mark;
        else
            data(i:i+tBit*NAm)=amp*mark;
        end
        idx=idx+1;
    end
end

