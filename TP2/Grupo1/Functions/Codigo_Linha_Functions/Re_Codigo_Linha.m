function [fileRes]=Re_Codigo_Linha(cod_linha, RxFile, data, amp, NAm)
    switch(cod_linha)
        case 1
            [fileRes]=Re_NRZ_Bip_Abs(RxFile, data, amp, NAm);
        case 2
            [fileRes]=Re_NRZ_Uni_Mark(RxFile, data, amp, NAm);
        otherwise
            [fileRes]=Re_Aus(RxFile, data, amp, NAm);
    end
end

