-- 프로시져
/*
*함수는 특정 연산을 수행한 뒤 결과값을 반환하지만 프로시저는 특정한 로직을 처리하기만하고
*반환값이 없는 서브 프로그램이다.
*/
/*
CREATE OR REPLACE PROCEDURE 프로시저이름
    (매개변수명1[IN|OUT|IN OUT] 데이터타입[:= 디폴트 값],
     매개변수명2[IN|OUT|IN OUT] 데이터타입[:= 디폴트 값],
     ...
    )
IS[AS]
    변수, 상수 등 선언
BEGIN
    실행부
[EXCEPTION
    예외 처리부]    
END [프로시저 이름];
*/
/*
매개변수 : IN은 입력, OUT은 출력, IN OUT은 입력과 출력을 동시에 한다.
명시가 없으면 DEFAULT로 IN매개변수임을 뜻한다.OUT 매개변수는 프로시저 내에서 로직을 처리 후,
해당 매개변수에 값을 할당해 프로시저 호출 부분에서 이 값을 참조할 수 있다.
그리고 IN 매개변수에는 디폴트값 설정이 가능하다.
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
    -- 동일한 job_id 가 있는지 체크
    SELECT COUNT(*)
      INTO vn_cnt
      FROM JOBS
     WHERE job_id = p_job_id;

    -- 없으면 INSERT
    IF vn_cnt = 0 THEN
        INSERT INTO JOBS (job_id, job_title, min_salary, max_salary, create_date, update_date)
                VALUES (p_job_id, p_job_title, p_min_sal, p_max_sal,SYSDATE, SYSDATE);
    ELSE -- 있으면 
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
프로시저 실행 2
EXEC 혹은 EXECUTE 프로시저명(매개변수1 => 매개변수1 값,
                             매개변수2 => 매개변수2 값, ...);
*/

EXECUTE my_new_job_proc 
    (p_job_id => 'SM_JOB1', p_job_title=>'Sample JOB1', p_min_sal=>2000,p_max_sal=>7000);

SELECT * FROM jobs  WHERE job_id = 'SM_JOB1';

-- 매개변수 디폴트 값 설정
-- 프로시저를 실행할 때는 반드시 매개변수의 개수에 맞춰 값을 전달해 실행하여야 한다.
--만약 매개변수 값을 누락하면 다음과 같이 오류가 발생한다.

EXECUTE my_new_job_proc ('SM_JOB1', 'Sample JOB1'); 
--에러 발생 : 호출 시 인수의 개수나 유형이 잘못되었습니다.
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
    -- 동일한 job_id가 있는지 체크
    SELECT COUNT(*)
      INTO vn_cnt
      FROM JOBS
     WHERE job_id = p_job_id;
     
    -- 없으면 INSERT
    IF vn_cnt = 0 THEN
        INSERT INTO JOBS(job_id, job_title,min_salary,max_salary,create_date,update_date)
                  VALUES(p_job_id,p_job_title,p_min_sal,p_max_sal,vn_cur_date,vn_cur_date);
                  
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







