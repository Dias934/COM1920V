function BI_check_digit_control(number)
    if(length(number)~=9)
        error("Missing digits. Needs 9");
    end
    s=0;
    for i=1:1:8
        s=s+(number(i)-'0')*(9-i+1)+(number(9)-'0');
    end
    if(mod(s,11)~=0)
        disp("Invalid BI number");
    else
        disp("Valid BI number");
    end
end

