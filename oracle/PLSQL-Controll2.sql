/* FOR문
FOR 인덱스 IN[REVERSE]초깃값.. 최종값
LOOP
    처리문;
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
/*CONTINUE문 : 반복문 내에서 특정 조건에 부합할 때 로직을 건너뛰고 상단의 루프 조건으로
                건너가 루프를 계속 수행할 때 사용된다.
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
/* GOTO문 : 지정하는 라벨로 제어가 넘어간다.

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
/*NULL문 : 아무것도 처리하지 않는 문장. CASE문에서 주로 사용.

IF vn_variable = 'A' THEN
    처리로직1;
ELSIF vn_variable = 'B' THEN
    처리로직2;
    ...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
        처리로직1;
     WHEN vn_variable = 'B' THEN
        처리로직2;
     ...
     ELSE NULL;
END CASE;     
*/


