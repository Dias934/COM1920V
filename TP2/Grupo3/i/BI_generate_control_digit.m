function [newNumber] = BI_generate_control_digit(number)
    if(length(number)~=8)
        error("Missing digits. Needs 8");
    end
    x=0;
    for i=1:1:8
        x=x+(number(i)-'0')*(9-i+1);
    end
    t=11-mod(x,11)+x;
    b=mod(t-x,11);
    newNumber=strcat(number,num2str(b));
end

