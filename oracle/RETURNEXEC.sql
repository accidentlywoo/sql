EXEC my_new_job_proc('SM_JOB1','Sample JOB1',999,6000);

DECLARE
    emp_name VARCHAR2(80); -- ��������
BEGIN
    emp_name := 'hong'; -- ������ �� �Ҵ�
    
    UPDATE employees
       SET emp_name = emp_name -- ������ �Ҵ��� ������ �����Ϸ� ������, ����Ŭ�� ������ �ƴ� �÷������� ������
     WHERE employee_id = 100;
     
     SELECT emp_name
       INTO emp_name
       FROM employees
      WHERE employee_id = 100;
      
      DBMS_OUTPUT.PUT_LINE(emp_name);
 END;  