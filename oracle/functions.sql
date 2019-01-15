-- Function
-- ABS(n) 절대값
select abs(10), abs(-10), abs(-10.123)
from dual;

-- CEIL(n) 반올림하여 정수만듬과 
select ceil(10.123), ceil(10.541), ceil(11.01)
from dual;

-- FLOOR(n)반내림하여 정수
select floor(10.123), floor(10.541),floor(11.001)
from dual;

-- Round(n,i) :소숫점 기준i=1번째에서 반올림 default 0 
select round(10.154),round(10.541),round(11.001)
from dual;

select round(10.143,1), round(10.154,2), round(10.154,3)
from dual;

select round(0,3),round(115.115, -1), round(115.155, -2)
from dual;
-- Trunc(n1,n2) 반내림
select trunc(115.115), trunc(115.155,1),trunc(115.155,2),trunc(115.115,-2)
from dual;

-- Power(n2,n1) n2를 n1제곱한 결과 n2^n1 n2가 음수일떄 n1은 정수만 가능
select power(3,2), power(3,3),power(3,3.0001) from dual;

select power(-3,3.0001) from dual;
-- Sqrt(n) n의 제곱근을 반환한다. 루트값
select sqrt(2), sqrt(5) from dual;

-- MOD(n2,n1) n2를 n1을 나눈 나머지 값
-- n2-n1*floor(n2/n1)
select mod(19,4), mod(19.123, 4.2) from dual;

-- REMAINDER(n2,n2)
-- n2-n1*round(n2/n1)
select remainder(19,4), remainder(19.123,4.2)
from dual;

-- exp(n) e의 n제곱 값을 반환
select exp(2), ln(2.173), log(10,100) from dual;
-- LN(n) 로그 함수, 밑수가 e 
-- LOG(n2, n1) 로그함수 n2를 밑수로, n1을 로그값으로 반환

-- 문자 함수
-- inicap(char) 첫 문자는 대문자 나머지는 소문자
select initcap('never say goodbey'), initcap('never6say*good가bye') from dual;

-- lower(char) 모든 문자를 소문자로 반환 -- upper(char) 모든 문자 대문자
select lower('never say goodbey'), upper('never say goodbye') from dual;

-- concat(char1, cha2), substr(char, pos, len)
select concat('I Have','A Dream'), 'I Have'||'A Dream' from dual;

-- Substrb(char,pos,len) pos는 char문자열의 맨끝자리 기준 위치값,len은 길이, 생략되면 pos기준으로 전부 삭제
select substr('ABCDEFG',1,4), substr('ABCDEFG',-1,4) from dual;


-- ltrim(char, set) 매개변수로 들어온 char 문자열에서 set으로 지정된 문자열을 왼쪽부터 정리한다.

-- rtrim(char, set) ~ 오른쪽에서 부터 정리한다.
select Ltrim('ABCDEFGABC','ABC'),
       Ltrim('가나다라','가'),
       Rtrim('ABCDEFGABC','ABC'),
       Rtrim('가나다라','라')
from dual;

-- 맨 왼쪽, 맨 오른쪽에 set값이 없으면 문자열 전체를 반환한다. 주로 좌우 공백제거에 사용한다.
select ltrim('가나다라마','나'),rtrim('가나다라마','나') from dual;

-- lpad(expr1, n, expr2), rpad(expr1,n,expr2)
-- expr2 문자열로 n자리수만큼 채운다. expr2생략시 default는 공백
create table ex4_1(
    phone_num varchar2(30)
);

select * from ex4_1;
drop table ex4_1;

insert into ex4_1 values('111-1111');
insert into ex4_1 values('111-2222');
insert into ex4_1 values('111-3333');

select lpad(phone_num,12,'(02)') from ex4_1;
-- 오-왼
select rpad(phone_num,12,'(02)') from ex4_1;

-- replace(char, search_str, replace_str)
select replace('나는 너를 모르는데 너는 나를 알겠는가?','나','너') from dual;
 -- rtrim/ltrim보다 replace를 활용해서 공백 처리를 하자!
 select Ltrim('  ABC DEF '),
        Rtrim('  ABC DEF '),
        replace('  ABC DEF ',' ','')
from dual;        
-- translate(expr, from_str,to_str) from_str, to_str 문자하나씩 맵핑하여 처리
select replace('나는 너를 모르는데 너는 나를 알겠는가?','나는','너를') AS rep,
        translate('나는 너를 모르는데 너는 나를 알겠는가?','나는','너를') AS trn
from dual;      

-- insert(str, substr, pos, occur)
select instr('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약') AS instr1,
        instr('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5) AS instr2,
        instr('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5, 2) AS instr3
from dual;

-- length(chr)문자열 갯수 -- lengthb(chr) 문자열 바이트 수
select length('대한민국'),
       lengthb('대한민국')
from dual;

-- 날짜 함수
-- sysdate, systimestamp
select sysdate, systimestamp
from dual;

--add_months(date, integer) interger 만큼의 월을 더한 날짜가 찍힌다.
select add_months(sysdate, 1), add_months(sysdate, -1) from dual;

-- months_between(date1,date2)
select months_between(sysdate, add_months(sysdate, 1)) mon1,
        months_between(add_months(sysdate,1),sysdate) mon2 from dual;
        
-- last_day(date)
select last_day(sysdate) from dual;

--round(date, format) 반올림, trunc(date, format) 내림
select sysdate, round(sysdate, 'month'), trunc(sysdate,'month') from dual;

-- next_day(date,char)
select next_day(sysdate, '금요일') from dual;

-- 변환함수 (명시적 형변환)
-- To-char(숫자 혹은 날짜, format)
select to_char(123456789, '999,999,999') from dual;

select to_char(sysdate, 'yyyy-mm-dd') from dual;

-- to_numver(expr, format)
select to_number('123456') from dual;

-- to_date(char, format)
select to_date('20140101','yyyy-mm-dd') from dual;

-- to_timestamp(char, format)
select to_date('20140101','yyyy-mm-dd') from dual;

-- Null관련 함수
-- nvl(expr1, expr2)
select nvl(manager_id, employee_id)
from employees
where manager_id is null;
-- nvl(expr1, expr2, expre3)
select employee_id,
    nvl2(commission_pct, salary + (salary * commission_pct), salary) as salary2
from employees;

--coalesce(expr1, expr2,...)
select employee_id, salary, commission_pct, 
    coalesce(salary * commission_pct, salary)as salary2
from employees;    

-- lnnvl(조건식)
select employee_id, commission_pct
from employees
where commission_pct < 0.2;

select count(*)
from employees
where nvl(commission_pct, 0) <0.2;

select count(*)
from employees
where lnnvl(commission_pct >= 0.2);

-- nullif(expr1, expr2) expr1 = expr2 ->true(null) / false(expr1)
select employee_id,
    to_char(start_date, 'yyyy') start_year,
    to_char(end_date, 'yyyy') end_year,
    nullif(to_char(end_date, 'yyyy'), to_char(start_date, 'yyyy')) nullif_year
from job_history;    

-- 기타 함수
-- greatest(expr1, expr2,...)매개변수로 들어오는 표현식에서 가장 큰 값을 반환
-- least(expr1, expr2,...)~ 가장 작은값
select greatest(1,2,3,2),
        least(1,2,3,2)
from dual;        

select greatest('이순신','강감찬','세종대왕'),
       least('이순신','강감찬','세종대왕')
from dual;       

-- decode(expr1, search1, result1, search2, result2, ... , default)
-- expr1을 search와 비교하여 truedlaus result반환









