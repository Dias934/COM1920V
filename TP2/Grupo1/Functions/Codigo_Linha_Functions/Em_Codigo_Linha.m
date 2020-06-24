function [data, time, En]=Em_Codigo_Linha(cod_linha, RxFile, amp, NAm, tBit)
    switch(cod_linha)
        case 1
            [data, time, En]=Em_NRZ_Bip_Abs(RxFile, amp, NAm, tBit);
        case 2
            [data, time, En]=Em_NRZ_Uni_Mark(RxFile, amp, NAm, tBit);
        otherwise
            [data, time, En]=Em_Aus(RxFile, amp, NAm, tBit);
    end
end

