
CREATE OR REPLACE PROCEDURE ch10_no_exception_proc
IS
    vi_num NUMBER :=0;
BEGIN
    vi_num := 10/0;
    DBMS_OUTPUT.PUT_LINE('Success!');
END;    
/*    
CREATE OR REPLACE PROCEDURE ch10_exception_proc
IS
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10/0;
    DBMS_OUTPUT.PUT_LINE('Success!');
    
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류가 발생하였습니다.');
END;    
왜 한페이지에 한개만 만들수있을까? 개 불편하네
  */  