--PL/SQL ���
--IF��
--IF ����1 THEN
--   ���� ó��1;
--ELSEIF ����2  THEN
--   ���� ó��2;
-- ...
--ELSE
--   ���� ó��N;
--END IF;
/*
DECLARE
    vn_num1 NUMBER := 1;
    vn_num2 NUMBER := 2;
BEGIN
    IF vn_num1 >= vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1||'�� ū ��');
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2||'�� ū ��');
    END IF;
END;

DECLARE 
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE(10, 120), -1);
    
  SELECT salary
    INTO vn_salary
    FROM employees
   WHERE department_id = vn_department_id
     AND ROWNUM = 1;
  
  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  IF vn_salary BETWEEN 1 AND 3000 THEN
    DBMS_OUTPUT.PUT_LINE('����');
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
    DBMS_OUTPUT.PUT_LINE('�߰�');
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
    DBMS_OUTPUT.PUT_LINE('����');
  ELSE 
    DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END IF;
END;

DECLARE
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
    vn_commission NUMBER := 0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE(10,120), -1);
    
        SELECT salary, commission_pct
          INTO vn_salary, vn_commission
          FROM employees
         WHERE department_id = vn_department_id
           AND ROWNUM = 1;
           
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
    IF vn_commission>0 THEN
        IF vn_commission>0.15 THEN
            DBMS_OUTPUT.PUT_LINE(vn_salary*vn_commission);
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_salary);
    END IF;
END;
*/
/* CASE��
CASE ǥ����
     WHEN ���1 THEN
          ó����1;
     WHEN ���2 THEN
          ó����2;
      ...
     ELSE
          ��Ÿó����;
END CASE;
*/
/* 
DECLARE
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE(10, 120), -1);
    
    SELECT salary
    INTO    vn_salary
    FROM    employees
    WHERE department_id = vn_department_id
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
    CASE WHEN vn_salary BETWEEN 1  AND 3000 THEN
              DBMS_OUTPUT.PUT_LINE('����');
         WHEN vn_salary BETWEEN 3001  AND 6000 THEN
              DBMS_OUTPUT.PUT_LINE('�߰�');
         WHEN vn_salary BETWEEN 6001  AND 10000 THEN
              DBMS_OUTPUT.PUT_LINE('����');
         ELSE
              DBMS_OUTPUT.PUT_LINE('�ֻ���');
         END CASE;
END;
*/
/*
LOOP�� 

LOOP
    ó����;
    EXIT [WHEN ����];
END LOOP;

DECLARE
    VN_BASE_NUM NUMBER := 3;
    VN_CNT NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(VN_BASE_NUM||'*'||VN_CNT||'= '||VN_BASE_NUM*VN_CNT);
        
        VN_CNT := VN_CNT+1;
        
        EXIT WHEN VN_CNT > 9;
     END LOOP;
END;     
*/    

    
    
    
    
    
    
    
    
    
    