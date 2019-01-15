--chap.8 <PL/SQL>
-- ���� ������ �����Ͻ� ������ ����� ���� PL/SQL�� ����� �����ϴ� ���� �����̴�.
--PL/SQL �ҽ� ���α׷��� �⺻ ������ ����̶�� �ϴµ�, ����� �����, �����, ����ó���η� ����
-- �� ����� �ٽ� �̸� ���� ��ϰ� �̸��� �ִ� ������� ������ �� �ִµ� �����ڿ� ���ϴ� ���� �͸���
-- �Լ�, ���ν���, ��Ű�� ���� ���ڿ� ���Ѵ�. 

--PLSQL��ϱ��� >>

-- �̸�
--IS(AS)
--�����
--BEGIN
--�����
--EXCEPTION
--���� ó����
--END

-- �͸��� 
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
-- ���� �����  ; �ʼ� = �ƴ� ':='���

SET SERVEROUTPUT ON
SET TIMING ON
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
-- ���� 
--  ������ ������Ÿ�� :=�ʱ갪; �ʱⰪ�Ҵ� X -> NULL
-- ������Ÿ�� : �⺻ ������Ÿ�� + BOOLEAN, PLS_INTEGER,BINARY_INTEGER
-- PLS_INTEGER Ÿ���� ���� ������ Ÿ��>>
-- NATURAL : PLS_INTEGER �� ���� ����(0 ����)
-- NATURALN : PLS_INTEGER �� ���� �����ε� NULL �Ҵ� �Ұ�, �ݵ�� ����� �ʱ�ȭ �ʿ�
-- POSITIVE : PLS_INTEGER �� ���(0 ������)
-- POSITIVEN : PLS_INTEGER �� ����ε� NULL �Ҵ� �Ұ�, �ݵ�� ����� �ʱ�ȭ �ʿ�
-- SIGNTYPE : PLS_INTEGER �� -1,0,1
-- SIMPLE_INTEGER: PLS_INTEGER �� NULL�� �ƴ� ���  ��, �ݵ�� ���� �� �ʱ�ȭ �ʿ�

-- ���
-- ����� CONSTANT ������Ÿ�� :=�����;

������ �켱���� >>
** : ����������
+,- : ���, ���� �ĺ� ������
*,/ : ����
+,-,|| : ����, ����, ���ڿ� ���� ������
=,<,>,<=,>=,<>,!=,~=,^=, IS NULL, LIKE, BETWEEN, IN : �� ������
NOT : �� ������
AND : �� ������
OR : �� ������

DECLARE
    a INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a = '||TO_CHAR(a));
END;    

-- �ּ� ����-- ������/**/

--DML
DECLARE
    vs_emp_name VARCHAR2(80);
    vs_dep_name VARCHAR2(80);
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a,
         departments b
    WHERE a.department_id = b.department_id
      AND a.employee_id = 100;
      
    DBMS_OUTPUT.PUT_LINE(vs_emp_name||'-'||vs_dep_name);
END;    
    
-- SELECT ���� INTO���� ��� : ������ ����, ����, ������ Ÿ���� �ݵ�� ������� �Ѵ�.
    
DECLARE
    vs_emp_name employees.emp_name%TYPE;
    vs_dep_name departments.department_name%TYPE;
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a,
         departments b
    WHERE a.department_id = b.department_id
      AND a.employee_id = 100;
      
    DBMS_OUTPUT.PUT_LINE(vs_emp_name||'-'||vs_dep_name);
END;   
-- %TYPE Ű���带 ����ϸ� , ������ ���� Ÿ���� ã�� ���ŷο� �����ϰ� �� ������ Ÿ���� �߸� ������ ���赵 ���� �� �����Ƿ�

-- PRAGMA Ű����
-- �����Ϸ��� ����Ǳ� ����  ó���ϴ� ��ó���� ������ �Ѵ�. 
-- PRAGMA�� ����ϸ� �����Ϸ��� ��Ÿ�� ���ʹ� �ٸ� ����� ������ �����Ѵ�.
-- ��, ������ �� �� ������ ó���϶�� �����Ϸ����� �����ϴ� ������ �Ѵ�.

-- 1. PRAGMA AUTONOMOUS_TRANSACTION
Ʈ����� ó���� ����ϴµ�, �� Ʈ������̳� �ٸ� Ʈ����ǿ� ������ ���� �ʰ� ���������� 
���� ��� ���ο��� �����ͺ��̽��� ������ ��������� COMMIT�̳� ROLLBACK �϶�� ���ø�
�ϴ� ������ �Ѵ�.
-- 2. PRAGMA EXCEPTION_INT(���ܸ�, ���ܹ�ȣ)
����� ���� ���� ó���� �� �� ���Ǵµ�, Ư�� ���ܹ�ȣ�� ����ؼ� �����Ϸ��� �� ���ܸ�
����Ѵٴ� ���� �˸��� ������ �Ѵ�.
-- 3. PRAGMA RESTRICT_REFERECES(���� ���α׷���, �ɼ�)
����Ŭ ��Ű���� ����� �� ������ ������ ��Ű���� ���� ������ ���α׷�(�ַ� �Լ��� ���)
���� �ɼ� ���� ���� Ư�� ������ ������ �� ���ȴ�. ���� ���, RNDS �� �ɼ��� �ָ�
�ش� ���� ���α׷����� ���̺� ������ ������ �����ϰ�, WNDS�ɼ��� �ָ� ���̺� �����͸�
�������� ���Ѵ�.
-- 4. PRAGMA SERIALLY_RESUABLE
��Ű�� �޸� ������ ���� �� �������� ���Ǹ�, ��Ű���� ����� ������ ����  �� �� ȣ��
�� �� �޸𸮸� ������Ų��. �� �� �ɼ���  �����ϸ� ��Ű�� ������ ���� �Ҵ��ϴ��� ���� 
���� ȣ���� ���� �Ҵ��� ���� ���� �޸𸮸� �������� �ش� ������ �ʱ�ȭ ���̳� NULL���� �ȴ�.

-- �� <<�󺧸�>>






