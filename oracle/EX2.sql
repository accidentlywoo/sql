/*
EXCEPTION  WHEN 예외명1 THEN 예외처리구문 1
WHEN 예외명2 THEN 예외처리 구문2
...
WHEN OTHERS THEN 예외처리 구문N;
*/
/*
DECLARE
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10 / 0;
    DBMS_OUTPUT.PUT_LINE('Success!');
END;
제수가 0입니다.

DECLARE
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10/0;
    DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다.');
END;
*/
DECLARE
    vi_num NUMBER :=0;
BEGIN
    ch10_exception_proc;
    DBMS_OUTPUT.PUT_LINE('Success!!');
END;    