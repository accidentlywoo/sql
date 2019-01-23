/*
SELECT my_mod(14, 3) reminder
FROM DUAL;
*/
DECLARE
    v_var1 VARCHAR2(10) := 'A';
    v_var2 VARCHAR2(10) := 'B';
    v_var3 VARCHAR2(10) := 'C';
BEGIN
    my_parameter_test_proc(v_var1, v_var2, v_var3);
    
    DBMS_OUTPUT.PUT_LINE('v_var2 value ='|| v_var2);
    DBMS_OUTPUT.PUT_LINE('v_var3 value ='|| v_var3);
END;    