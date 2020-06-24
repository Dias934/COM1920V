function [c,C] = Correlator(x, ref)
    c = x .* ref;
    C = sum(c);
end

