/*
EXCEPTION  WHEN ���ܸ�1 THEN ����ó������ 1
WHEN ���ܸ�2 THEN ����ó�� ����2
...
WHEN OTHERS THEN ����ó�� ����N;
*/
/*
DECLARE
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10 / 0;
    DBMS_OUTPUT.PUT_LINE('Success!');
END;
������ 0�Դϴ�.

DECLARE
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10/0;
    DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�.');
END;
*/
DECLARE
    vi_num NUMBER :=0;
BEGIN
    ch10_exception_proc;
    DBMS_OUTPUT.PUT_LINE('Success!!');
END;    