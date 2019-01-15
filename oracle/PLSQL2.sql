
--CREATE TABLE ch08_varchar2(
--VAR1 VARCHAR2(4000));

--INSERT INTO ch08_varchar2(VAR1)
--VALUES('...');

--COMMIT;
SET SERVEROUTPUT ON
SET TIMING ON

DECLARE
    vs_sql_varchar2 VARCHAR2(4000);
    vs_plsql_varchar2 VARCHAR2(32767);
BEGIN

    -- ch08_varchar2 테이블의 값을 변수에 담는다.
    SELECT VAR1
        INTO vs_sql_varchar2
        FROM ch08_varchar2;
    -- PL/SQL 변수에 4000BYTE 이상 크기의 값
     vs_plsql_varchar2 := vs_sql_varchar2||'-'||vs_sql_varchar2||'-'||vs_sql_varchar2;
     
     -- 각 변수의 크기를 출력한다.
     DBMS_OUTPUT.PUT_LINE('SQL VARCHAR2 길이 : '||LENGTHB(vs_sql_varchar2));
     DBMS_OUTPUT.PUT_LINE('PL/SQL VARCHAR2 길이 : '||LENGTHB(vs_plsql_varchar2));
END;     