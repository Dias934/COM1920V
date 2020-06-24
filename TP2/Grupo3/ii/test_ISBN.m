clear all
clc

number='978030640615';
new=ISBN_generate_control_digit(number);
disp(strcat("ISBN= ", new));
ISBN_check_digit_control(new);              %Pass
ISBN_check_digit_control('9780306406517');  %Error
ISBN_check_digit_control('9780306406155');  %Error