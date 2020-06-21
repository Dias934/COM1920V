function [newNumber] = ISBN_generate_control_digit(number)
    if(length(number)~=12)
        error("Missing digits. Needs 12");
    end
    s=0;
    for i=1:1:12
        if(mod(i,2)==1)
            s=s+(number(i)-'0');
        else
           s=s+(number(i)-'0')*3;
        end
    end
    s=10-mod(s,10);
    newNumber=strcat(number,num2str(s));
end

