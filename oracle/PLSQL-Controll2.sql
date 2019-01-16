/* FOR��
FOR �ε��� IN[REVERSE]�ʱ갪.. ������
LOOP
    ó����;
END LOOP;

DECLARE
    vn_base_num NUMBER :=3;
BEGIN
    FOR i IN 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num||'*'||i||'= '||vn_base_num*i);
    END LOOP;
END;    

DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN REVERSE 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num||'*'||i||'= '||vn_base_num*i);
    END LOOP;
END;    
*/
/*CONTINUE�� : �ݺ��� ������ Ư�� ���ǿ� ������ �� ������ �ǳʶٰ� ����� ���� ��������
                �ǳʰ� ������ ��� ������ �� ���ȴ�.
DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN 1..9
    LOOP
        CONTINUE WHEN i=5;
        DBMS_OUTPUT.PUT_LINE(vn_base_num||'*'||i||'= '||vn_base_num*i);
    END LOOP;
END;    
*/
/* GOTO�� : �����ϴ� �󺧷� ��� �Ѿ��.

DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    <<third>>
    FOR i IN 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num||'*'||i||'= '||vn_base_num*I);
        IF i = 3 THEN
            GOTO fourth;
        END IF;
    END LOOP;
    <<fourth>>
    vn_base_num := 4;
    FOR i in 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num||'*'||i||'= '||vn_base_num*i);
    END LOOP;
END;    
*/
/*NULL�� : �ƹ��͵� ó������ �ʴ� ����. CASE������ �ַ� ���.

IF vn_variable = 'A' THEN
    ó������1;
ELSIF vn_variable = 'B' THEN
    ó������2;
    ...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
        ó������1;
     WHEN vn_variable = 'B' THEN
        ó������2;
     ...
     ELSE NULL;
END CASE;     
*/


