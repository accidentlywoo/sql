--chap.8 <PL/SQL>
-- 실제 복잡한 비지니스 로직을 만드는 것은 PL/SQL을 사용해 구현하는 것이 보통이다.
--PL/SQL 소스 프로그램의 기본 단위를 블록이라고 하는데, 블록은 선언부, 실행부, 예외처리부로 구성
-- 이 블록은 다시 이름 없는 블록과 이름이 있는 블록으로 구분할 수 있는데 ㅅ전자에 속하는 것이 익명블록
-- 함수, 프로시저, 패키지 등이 후자에 속한다. 

--PLSQL블록구조 >>

-- 이름
--IS(AS)
--선언부
--BEGIN
--실행부
--EXCEPTION
--예외 처리부
--END

-- 익명블록 
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
-- 변수 선언시  ; 필수 = 아닌 ':='사용

SET SERVEROUTPUT ON
SET TIMING ON
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
-- 변수 
--  변수명 데이터타입 :=초깃값; 초기값할당 X -> NULL
-- 데이터타입 : 기본 데이터타입 + BOOLEAN, PLS_INTEGER,BINARY_INTEGER
-- PLS_INTEGER 타입의 하위 데이터 타입>>
-- NATURAL : PLS_INTEGER 중 음수 제외(0 포함)
-- NATURALN : PLS_INTEGER 중 음수 제외인데 NULL 할당 불가, 반드시 선언시 초기화 필요
-- POSITIVE : PLS_INTEGER 중 양수(0 미포함)
-- POSITIVEN : PLS_INTEGER 중 양수인데 NULL 할당 불가, 반드기 선언시 초기화 필요
-- SIGNTYPE : PLS_INTEGER 중 -1,0,1
-- SIMPLE_INTEGER: PLS_INTEGER 중 NULL이 아닌 모든  값, 반드시 선언 시 초기화 필요

-- 상수
-- 상수명 CONSTANT 데이터타입 :=상수값;

연산자 우선순위 >>
** : 제곱연산자
+,- : 양수, 음수 식별 연산자
*,/ : 곱셈
+,-,|| : 덧셈, 뺄셈, 문자열 연결 연산자
=,<,>,<=,>=,<>,!=,~=,^=, IS NULL, LIKE, BETWEEN, IN : 비교 연산자
NOT : 논리 연산자
AND : 논리 연산자
OR : 논리 연산자

DECLARE
    a INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a = '||TO_CHAR(a));
END;    

-- 주석 한줄-- 여러줄/**/

--DML
DECLARE
    vs_emp_name VARCHAR2(80);
    vs_dep_name VARCHAR2(80);
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a,
         departments b
    WHERE a.department_id = b.department_id
      AND a.employee_id = 100;
      
    DBMS_OUTPUT.PUT_LINE(vs_emp_name||'-'||vs_dep_name);
END;    
    
-- SELECT 절에 INTO절을 사용 : 변수의 순서, 개수, 데이터 타입을 반드시 맞춰줘야 한다.
    
DECLARE
    vs_emp_name employees.emp_name%TYPE;
    vs_dep_name departments.department_name%TYPE;
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a,
         departments b
    WHERE a.department_id = b.department_id
      AND a.employee_id = 100;
      
    DBMS_OUTPUT.PUT_LINE(vs_emp_name||'-'||vs_dep_name);
END;   
-- %TYPE 키워드를 사용하면 , 일일이 변수 타입을 찾는 번거로움도 제거하고 ㄷ ㅔ이터 타입을 잘못 선언할 위험도 없앨 수 있으므로

-- PRAGMA 키워드
-- 컴파일러가 실행되기 전에  처리하는 전처리기 역할을 한다. 
-- PRAGMA를 사용하면 컴파일러는 런타임 떄와는 다른 결과를 내도록 동작한다.
-- 즉, 컴파일 할 떄 뭔가를 처리하라고 컴파일러에게 지시하는 역할을 한다.

-- 1. PRAGMA AUTONOMOUS_TRANSACTION
트랜잭션 처리를 담당하는데, 주 트랜잭션이나 다른 트랜잭션에 영향을 받지 않고 독립적으로 
현재 블록 내부에서 데이터베이스에 가해진 변경사항을 COMMIT이나 ROLLBACK 하라는 지시를
하는 역할을 한다.
-- 2. PRAGMA EXCEPTION_INT(예외명, 예외번호)
사용자 정의 예외 처리를 할 때 사용되는데, 특정 예외번호를 명시해서 컴파일러에 이 예외를
사용한다는 것을 알리는 역할을 한다.
-- 3. PRAGMA RESTRICT_REFERECES(서브 프로그램명, 옵션)
오라클 패키지를 사용할 때 선언해 놓으면 패키지에 속한 ㅂ서브 프로그램(주로 함수에 사용)
에서 옵션 값에 따라 특정 동작을 제한할 때 사용된다. 예를 들어, RNDS 란 옵션을 주면
해당 서브 프로그램에서 테이블 데이터 쿼리를 제한하고, WNDS옵션을 주면 테이블 데이터를
조작하지 못한다.
-- 4. PRAGMA SERIALLY_RESUABLE
패키지 메모리 관리를 쉽게 할 목적으로 사용되며, 패키지에 선언된 변수에 대해  한 번 호출
된 후 메모리를 해제시킨다. 즉 이 옵션을  설정하면 패키지 변수에 값을 할당하더라도 다음 
번에 호출할 때는 할당한 값에 대한 메모리를 해제시켜 해당 변수는 초기화 값이나 NULL값이 된다.

-- 라벨 <<라벨명>>






