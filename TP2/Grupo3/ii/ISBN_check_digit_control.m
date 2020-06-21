function ISBN_check_digit_control(number)
    if(length(number)~=13)
        error("Missing digits. Needs 13");
    end
    s=0;
    for i=1:1:12
        if(mod(i,2)==1)
            s=s+(number(i)-'0');
        else
           s=s+(number(i)-'0')*3;
        end
    end
    s=mod(10-s,10);
    if((number(13)-'0')-s~=0)
        disp("Invalid ISBN number");
    else
        disp("Valid ISBN number");
    end
end

