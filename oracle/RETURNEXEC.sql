EXEC my_new_job_proc('SM_JOB1','Sample JOB1',999,6000);

DECLARE
    emp_name VARCHAR2(80); -- 변수선언
BEGIN
    emp_name := 'hong'; -- 갱신할 값 할당
    
    UPDATE employees
       SET emp_name = emp_name -- 위에서 할당한 값으로 갱신하려 했지만, 오라클은 변수가 아닌 컬럼명으로 인지함
     WHERE employee_id = 100;
     
     SELECT emp_name
       INTO emp_name
       FROM employees
      WHERE employee_id = 100;
      
      DBMS_OUTPUT.PUT_LINE(emp_name);
 END;  