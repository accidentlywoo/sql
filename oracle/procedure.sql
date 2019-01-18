-- ���ν���
/*
*�Լ��� Ư�� ������ ������ �� ������� ��ȯ������ ���ν����� Ư���� ������ ó���ϱ⸸�ϰ�
*��ȯ���� ���� ���� ���α׷��̴�.
*/
/*
CREATE OR REPLACE PROCEDURE ���ν����̸�
    (�Ű�������1[IN|OUT|IN OUT] ������Ÿ��[:= ����Ʈ ��],
     �Ű�������2[IN|OUT|IN OUT] ������Ÿ��[:= ����Ʈ ��],
     ...
    )
IS[AS]
    ����, ��� �� ����
BEGIN
    �����
[EXCEPTION
    ���� ó����]    
END [���ν��� �̸�];
*/
/*
�Ű����� : IN�� �Է�, OUT�� ���, IN OUT�� �Է°� ����� ���ÿ� �Ѵ�.
��ð� ������ DEFAULT�� IN�Ű��������� ���Ѵ�.OUT �Ű������� ���ν��� ������ ������ ó�� ��,
�ش� �Ű������� ���� �Ҵ��� ���ν��� ȣ�� �κп��� �� ���� ������ �� �ִ�.
�׸��� IN �Ű��������� ����Ʈ�� ������ �����ϴ�.
*/
CREATE OR REPLACE PROCEDURE my_new_job_proc
(p_job_id IN JOBS.JOB_ID%TYPE,
p_job_title IN JOBS.JOB_TITLE%TYPE,
p_min_sal IN JOBS.MIN_SALARY%TYPE,
p_max_sal IN JOBS.MAX_SALARY%TYPE)
IS

BEGIN
    INSERT INTO JOBS(job_id, job_title, min_salary, max_salary, create_date, update_date)
    VALUES( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
    
    COMMIT
END;

GRANT EXECUTE ON my_new_job_proc TO ORA_USER;

EXEC my_new_job_proc('SM_JOB1','Sample JOB1', 1000,5000);

select * from jobs where job_id = 'SM_JOB1';

CREATE OR REPLACE PROCEDURE my_new_job_proc
(p_job_id IN JOBS.JOB_ID%TYPE,
p_job_title IN JOBS.JOB_TITLE%TYPE,
p_min_sal IN JOBS.MIN_SALARY%TYPE,
p_max_sal IN JOBS.MAX_SALARY%TYPE)
IS
    vn_cnt NUMBER := 0;
BEGIN
    -- ������ job_id �� �ִ��� üũ
    SELECT COUNT(*)
      INTO vn_cnt
      FROM JOBS
     WHERE job_id = p_job_id;

    -- ������ INSERT
    IF vn_cnt = 0 THEN
        INSERT INTO JOBS (job_id, job_title, min_salary, max_salary, create_date, update_date)
                VALUES (p_job_id, p_job_title, p_min_sal, p_max_sal,SYSDATE, SYSDATE);
    ELSE -- ������ 
        UPDATE JOBS
            SET job_title = p_job_title,
                min_salary = p_min_Sal,
                max_salary = p_max_sal,
                update_date = SYSDATE
            WHERE job_id = p_job_id;
    END IF;
    COMMIT;
END;    

EXEC my_new_job_proc('SM_JOB1','Sample JOB1',2000, 6000);

SELECT * FROM jobs WHERE job_id = 'SM_JOB1';
/*
���ν��� ���� 2
EXEC Ȥ�� EXECUTE ���ν�����(�Ű�����1 => �Ű�����1 ��,
                             �Ű�����2 => �Ű�����2 ��, ...);
*/

EXECUTE my_new_job_proc 
    (p_job_id => 'SM_JOB1', p_job_title=>'Sample JOB1', p_min_sal=>2000,p_max_sal=>7000);

SELECT * FROM jobs  WHERE job_id = 'SM_JOB1';

-- �Ű����� ����Ʈ �� ����
-- ���ν����� ������ ���� �ݵ�� �Ű������� ������ ���� ���� ������ �����Ͽ��� �Ѵ�.
--���� �Ű����� ���� �����ϸ� ������ ���� ������ �߻��Ѵ�.

EXECUTE my_new_job_proc ('SM_JOB1', 'Sample JOB1'); 
--���� �߻� : ȣ�� �� �μ��� ������ ������ �߸��Ǿ����ϴ�.
CREATE OR REPLACE PROCEDURE my_new_job_proc
(p_job_id IN JOBS.JOB_ID%TYPE,
p_job_title IN JOBS.JOB_TITLE%TYPE,
p_min_sal IN JOBS.MIN_SALARY%TYPE:=10,
p_max_sal IN JOBS.MAX_SALARY%TYPE:=100)
IS
...
...

EXECUTE my_new_job_proc ('SM_JOB1', 'Sample JOB1'); 

SELECT * FROM jobs WHERE job_id = 'SM_JOB1';

CREATE OR REPLACE PROCEDURE my_new_job_proc
(
p_job_id IN JOBS.JOB_ID%TYPE,
p_job_title IN JOBS.JOB_TITLE%TYPE,
p_min_sal IN JOBS.MIN_SALARY%TYPE:=10,
p_max_sal IN JOBS.MAX_SALARY%TYPE:=100
)
IS
    vn_cnt NUMBER :=0;
    vn_cur_date  JOBS.UPDATE_DATE%TYPE:=SYSDATE;
BEGIN
    -- ������ job_id�� �ִ��� üũ
    SELECT COUNT(*)
      INTO vn_cnt
      FROM JOBS
     WHERE job_id = p_job_id;
     
    -- ������ INSERT
    IF vn_cnt = 0 THEN
        INSERT INTO JOBS(job_id, job_title,min_salary,max_salary,create_date,update_date)
                  VALUES(p_job_id,p_job_title,p_min_sal,p_max_sal,vn_cur_date,vn_cur_date);
                  
    ELSE -- ������ UPDATE
        UPDATE JOBS
            SET job_title = p_job_title,
                min_salary = p_min_sal,
                max_salary = p_max_sal,
                update_date = vn_cur_date
            WHERE job_id = p_job_id;
    END IF;
    
    -- OUT �Ű������� ���� �Ҵ�
    p_upd_date := vn_cur_date;
    
    COMMIT;
END;  







