function [T_BER] = calculate_transmition_BER(emit_file, recv_file, BER_vect)
    vect=file2vector(emit_file);
    bin_emit=de2bi(vect,8)';
    vect=file2vector(recv_file);
    bin_recv=de2bi(vect,8)';
    count=0;
    for i=1:numel(bin_recv)
        if(i>numel(bin_emit))
            break;
        end
        if(bin_emit(i)~=bin_recv(i))
            count=count+1;
        end
    end
    count=count+abs(numel(bin_recv)-numel(bin_emit));
    BER=count/numel(bin_emit);
    T_BER=[BER_vect BER];
end

