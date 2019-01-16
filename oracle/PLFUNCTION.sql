-- 사용자 정의 함수
/*
CREATE OR  REPLACE FUNCTION 함수이름(매개변수1, 매개변수2,...)
RETURN 데이터타입;
IS[AS]
    변수, 상수 등 선언
BEGIN
    실행부
    
    RETURN 반환값;
[EXCAPTION 
    예외 처리부]    
END [함수 이름];    

CREATE OR REPLACE FUNCTION my_mod(num1 NUMBER, num2 NUMBER)
    RETURN NUMBER   -- 반환 데이터 타입은 NUMBER
    IS
        vn_remainder NUMBER := 0;   -- 반환할 나머지
        vn_quotient NUMBER := 0;    -- 몫
    BEGIN
        vn_quotient := FLOOR(num1 / num2);  -- 피젯수/젯수 결과에서 정수 부분을 걸러 낸다
        vn_remainder := num1 - (num2 * vn_quotient);    -- 나머지= 피젯수-(젯수*몫)
        
    RETURN vn_remainder;
END; 
*/
 /* 함수 호출 
 <매개변수가 없는 함수 호출>
 함수명 혹은 함수명()
 
 <매개변수가 있는 함수 호출>
 함수명(매개변수1,매개변수2,...)
       
 
 SELECT my_mod(14, 3) reminder
  FROM DUAL;
    */     
CREATE OR REPLACE FUNCTION fn_get_country_name(p_country_id NUMBER)
    RETURN VARCHAR2 -- 국가명을 반환하므로 반환 데이터타입은 VARCHAR2
IS
    vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
    SELECT country_name
    INTO vs_country_name
    FROM countries
    WHERE country_id = p_country_id;
    
    RETURN vs_country_name;    
    



















