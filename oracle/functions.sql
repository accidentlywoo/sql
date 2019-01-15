-- Function
-- ABS(n) ���밪
select abs(10), abs(-10), abs(-10.123)
from dual;

-- CEIL(n) �ݿø��Ͽ� ��������� 
select ceil(10.123), ceil(10.541), ceil(11.01)
from dual;

-- FLOOR(n)�ݳ����Ͽ� ����
select floor(10.123), floor(10.541),floor(11.001)
from dual;

-- Round(n,i) :�Ҽ��� ����i=1��°���� �ݿø� default 0 
select round(10.154),round(10.541),round(11.001)
from dual;

select round(10.143,1), round(10.154,2), round(10.154,3)
from dual;

select round(0,3),round(115.115, -1), round(115.155, -2)
from dual;
-- Trunc(n1,n2) �ݳ���
select trunc(115.115), trunc(115.155,1),trunc(115.155,2),trunc(115.115,-2)
from dual;

-- Power(n2,n1) n2�� n1������ ��� n2^n1 n2�� �����ϋ� n1�� ������ ����
select power(3,2), power(3,3),power(3,3.0001) from dual;

select power(-3,3.0001) from dual;
-- Sqrt(n) n�� �������� ��ȯ�Ѵ�. ��Ʈ��
select sqrt(2), sqrt(5) from dual;

-- MOD(n2,n1) n2�� n1�� ���� ������ ��
-- n2-n1*floor(n2/n1)
select mod(19,4), mod(19.123, 4.2) from dual;

-- REMAINDER(n2,n2)
-- n2-n1*round(n2/n1)
select remainder(19,4), remainder(19.123,4.2)
from dual;

-- exp(n) e�� n���� ���� ��ȯ
select exp(2), ln(2.173), log(10,100) from dual;
-- LN(n) �α� �Լ�, �ؼ��� e 
-- LOG(n2, n1) �α��Լ� n2�� �ؼ���, n1�� �αװ����� ��ȯ

-- ���� �Լ�
-- inicap(char) ù ���ڴ� �빮�� �������� �ҹ���
select initcap('never say goodbey'), initcap('never6say*good��bye') from dual;

-- lower(char) ��� ���ڸ� �ҹ��ڷ� ��ȯ -- upper(char) ��� ���� �빮��
select lower('never say goodbey'), upper('never say goodbye') from dual;

-- concat(char1, cha2), substr(char, pos, len)
select concat('I Have','A Dream'), 'I Have'||'A Dream' from dual;

-- Substrb(char,pos,len) pos�� char���ڿ��� �ǳ��ڸ� ���� ��ġ��,len�� ����, �����Ǹ� pos�������� ���� ����
select substr('ABCDEFG',1,4), substr('ABCDEFG',-1,4) from dual;


-- ltrim(char, set) �Ű������� ���� char ���ڿ����� set���� ������ ���ڿ��� ���ʺ��� �����Ѵ�.

-- rtrim(char, set) ~ �����ʿ��� ���� �����Ѵ�.
select Ltrim('ABCDEFGABC','ABC'),
       Ltrim('�����ٶ�','��'),
       Rtrim('ABCDEFGABC','ABC'),
       Rtrim('�����ٶ�','��')
from dual;

-- �� ����, �� �����ʿ� set���� ������ ���ڿ� ��ü�� ��ȯ�Ѵ�. �ַ� �¿� �������ſ� ����Ѵ�.
select ltrim('�����ٶ�','��'),rtrim('�����ٶ�','��') from dual;

-- lpad(expr1, n, expr2), rpad(expr1,n,expr2)
-- expr2 ���ڿ��� n�ڸ�����ŭ ä���. expr2������ default�� ����
create table ex4_1(
    phone_num varchar2(30)
);

select * from ex4_1;
drop table ex4_1;

insert into ex4_1 values('111-1111');
insert into ex4_1 values('111-2222');
insert into ex4_1 values('111-3333');

select lpad(phone_num,12,'(02)') from ex4_1;
-- ��-��
select rpad(phone_num,12,'(02)') from ex4_1;

-- replace(char, search_str, replace_str)
select replace('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?','��','��') from dual;
 -- rtrim/ltrim���� replace�� Ȱ���ؼ� ���� ó���� ����!
 select Ltrim('  ABC DEF '),
        Rtrim('  ABC DEF '),
        replace('  ABC DEF ',' ','')
from dual;        
-- translate(expr, from_str,to_str) from_str, to_str �����ϳ��� �����Ͽ� ó��
select replace('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?','����','�ʸ�') AS rep,
        translate('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?','����','�ʸ�') AS trn
from dual;      

-- insert(str, substr, pos, occur)
select instr('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����') AS instr1,
        instr('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5) AS instr2,
        instr('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5, 2) AS instr3
from dual;

-- length(chr)���ڿ� ���� -- lengthb(chr) ���ڿ� ����Ʈ ��
select length('���ѹα�'),
       lengthb('���ѹα�')
from dual;

-- ��¥ �Լ�
-- sysdate, systimestamp
select sysdate, systimestamp
from dual;

--add_months(date, integer) interger ��ŭ�� ���� ���� ��¥�� ������.
select add_months(sysdate, 1), add_months(sysdate, -1) from dual;

-- months_between(date1,date2)
select months_between(sysdate, add_months(sysdate, 1)) mon1,
        months_between(add_months(sysdate,1),sysdate) mon2 from dual;
        
-- last_day(date)
select last_day(sysdate) from dual;

--round(date, format) �ݿø�, trunc(date, format) ����
select sysdate, round(sysdate, 'month'), trunc(sysdate,'month') from dual;

-- next_day(date,char)
select next_day(sysdate, '�ݿ���') from dual;

-- ��ȯ�Լ� (����� ����ȯ)
-- To-char(���� Ȥ�� ��¥, format)
select to_char(123456789, '999,999,999') from dual;

select to_char(sysdate, 'yyyy-mm-dd') from dual;

-- to_numver(expr, format)
select to_number('123456') from dual;

-- to_date(char, format)
select to_date('20140101','yyyy-mm-dd') from dual;

-- to_timestamp(char, format)
select to_date('20140101','yyyy-mm-dd') from dual;

-- Null���� �Լ�
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

-- lnnvl(���ǽ�)
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

-- ��Ÿ �Լ�
-- greatest(expr1, expr2,...)�Ű������� ������ ǥ���Ŀ��� ���� ū ���� ��ȯ
-- least(expr1, expr2,...)~ ���� ������
select greatest(1,2,3,2),
        least(1,2,3,2)
from dual;        

select greatest('�̼���','������','�������'),
       least('�̼���','������','�������')
from dual;       

-- decode(expr1, search1, result1, search2, result2, ... , default)
-- expr1�� search�� ���Ͽ� truedlaus result��ȯ









