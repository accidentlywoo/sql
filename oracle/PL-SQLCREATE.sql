/*
CREATE OR REPLACE FUNCTION my_mod(num1 NUMBER, num2 NUMBER)
    RETURN NUMBER
IS
    vn_remainder NUMBER := 0;
    vn_quotient NUMBER := 0;
BEGIN
    vn_quotient := FLOOR(num1/num2);
    vn_remainder := num1- (num2*vn_quotient);
    
    RETURN vn_remainder;
END;  
*/
CREATE OR REPLACE PROCEDURE my_parameter_test_proc(
    p_var1        VARCHAR2,
    p_var2 OUT    VARCHAR2,
    p_var3 IN OUT VARCHAR2)
IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('p_var1 value = '|| p_var1);
    DBMS_OUTPUT.PUT_LINE('p_var2 value = '|| p_var2);
    DBMS_OUTPUT.PUT_LINE('p_var3 value = '|| p_var3);
    
    p_var2 := 'B2';
    p_var2 := 'C2';
END;    