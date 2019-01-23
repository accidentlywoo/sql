/*
CREATE OR REPLACE PROCEDURE my_new_job_proc
(p+job_id IN JOBS.JOB_ID%TYPE,
p_job_title IN  JOBS.JOB_TITLE%TYPE,
p_min_sal IN JOBS.JOB_SALARY%TYPE := 10,
p_max_sal IN JOBS.MAX_SALARY%TYPE := 100,
p_upd_date  OUT JOBS.UPDATE_DATE%TYPE
)
IS
    vn_cnt NUMBER :=0;
    vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
    --동일한 job_id가 있는지 체크
    SELECT COUNT(*)
      INTO vn_cnt
      FROM JOBS
     WHERE job_id = p_job_id;
     
    -- 없으면 INSERT
    IF vn_cnt = 0 THEN
        INSERT INTO JOBS(job_id,  job_title, min_salary, max_salary, create_date, update_date)
                  VALUES(p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
                  
    ELSE -- 있으면 UPDATE
        UPDATE JOBS
            SET job_title = p_job_title,
                min_salary = p_min_sal,
                max_salary = p_max_sal,
                update_date = vn_cur_date
        WHERE job_id = p_job_id;
    END IF;    
    
    -- OUT 매개변수에 일자 할당
    p_upd_date := vn_cur_date;
    
    COMMIT;
END;    
*/
DECLARE
    vd_cur_date  JOBS.UPDATE_DATE%TYPE;
BEGIN
    my_new_job_proc('SM_JOB1','Sample JOB1',2000,6000,vd_cur_date);
    
    DBMS_OUTPUT.PUT_LINE(vn_cur_date);
END; 

CREATE OR REPLACE PROCEDURE my_parameter_test_proc(
    p_var1 VARCHAR,
    p_var2 OUT VARCHAR2,
    p_var3 IN OUT VARCHAR2)
IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('p_var1 value ='||p_varr1');
    DBMS_OUTPUT.PUT_LINE('p_var2 value ='||p_varr2');
    DBMS_OUTPUT.PUT_LINE('p_var3 value ='||p_varr3');

    p_var2 := 'B2';
    p_var3 := 'C2';
END;    


DECLARE
    v_var1 VARCHAR2(10) :=  'A';
    v_var2 VARCHAR2(10) :=  'B';
    v_var3 VARCHAR2(10) :=  'C';
BEGIN
    my_parameter_test_proc (v_var1, v_var2, v_var3);
    
    DBMS_OUTPUT.PUT_LINE('v_var2 value= '|| v_var2);
    DBMS_OUTPUT.PUT_LINE('v_var2 value= '|| v_var3);
END;    






