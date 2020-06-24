function [data, time, En] = Em_NRZ_Bip_Abs(filename, amp, NAm, tBit)
    vect=file2vector(filename);
    bin=de2bi(vect)';
    N=6;    %blocks of 6
    
    %Não é a melhor solução, no entanto não é possivel prever o tamanho do
    %vetor, sem que seja feita a análise dos dados
    encoded=[];
    
    for i=1:6:numel(bin)
        encoded=[encoded Generate_Bip_Block(bin, i, N)];
    end
    
    % 0:(tBit*10^tBitUnit)/NAm:numel(encoded)*tBit;<- para qualquer unidade
    % de tempo, mas ocupa muita memória, por isso o mínimo de tempo de bit
    %será 1 ms
    En=zeros(1,numel(encoded));
    time=0: tBit/NAm :numel(encoded)*tBit;
    data=zeros(1, numel(time));
    idx=1;
    for i=1:NAm:numel(data)-1
        if(encoded(idx)==1)
            data(i:i+NAm)=amp;
            En(idx)=power(amp,2)*tBit;
        else
            data(i:i+NAm)=-amp;
            En(idx)=power(-1*amp,2)*tBit;
        end
        idx=idx+1;
    end
end
