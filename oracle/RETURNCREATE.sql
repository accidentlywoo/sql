-- RETURN
-- ���ν������� RETURN���� ������ ���� ����
CREATE OR REPLACE PROCEDURE my_new_job_proc
(p_job_id IN    JOBS.JOB_ID%TYPE,
p_job_title IN  JOBS.JOB_TITLE%TYPE,
p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100
--p_upd_date OUT JOBS.UPDATE_DATE%TYPE
)
IS
    vn_cnt NUMBER := 0;
    vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
    -- 1000 ���� ������ �޽��� ��� �� ���� ������.
  IF p_min_sal<1000 THEN
    DBMS_OUTPUT.PUT_LINE('�ּ� �޿����� 1000 �̻��̿��� �մϴ�.');
    RETURN;
  END IF;
  
  -- ������ job_id�� �ִ��� üũ
  SELECT COUNT(*)
    INTO vn_cnt
    FROM JOBS
   WHERE job_id = p_job_id;
END;