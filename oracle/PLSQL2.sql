
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

    -- ch08_varchar2 ���̺��� ���� ������ ��´�.
    SELECT VAR1
        INTO vs_sql_varchar2
        FROM ch08_varchar2;
    -- PL/SQL ������ 4000BYTE �̻� ũ���� ��
     vs_plsql_varchar2 := vs_sql_varchar2||'-'||vs_sql_varchar2||'-'||vs_sql_varchar2;
     
     -- �� ������ ũ�⸦ ����Ѵ�.
     DBMS_OUTPUT.PUT_LINE('SQL VARCHAR2 ���� : '||LENGTHB(vs_sql_varchar2));
     DBMS_OUTPUT.PUT_LINE('PL/SQL VARCHAR2 ���� : '||LENGTHB(vs_plsql_varchar2));
END;     