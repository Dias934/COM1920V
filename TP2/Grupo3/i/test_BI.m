clear all
clc

number='14410838';
new=BI_generate_control_digit(number);
disp(strcat("BI= " ,new));
BI_check_digit_control(new);            %Pass
BI_check_digit_control('144108830');    %Error
BI_check_digit_control('144108390');    %Error