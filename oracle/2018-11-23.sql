merge into ex3_3 d
    using (select employee_id, salary,manager_id
            from employees
            where manager_id = 146) b
    on (d.employee_id = b.employee_id)
when matched then
    update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
    delete where (b.employee_id = 161)
when not matched then
    insert (d.employee_id, d.bonus_amt) values(b.employee_id, b.salary *.001)
    where b.salary < 8000;
   
select * from ex3_3 order by employee_id;

delete ex3_3;

select partition_name
from user_tab_partitions
where table_name = 'SALES';

create table ex3_4(
    employee_id number
);

insert into ex3_4 values(100);

select * from ex3_4;

commit;

select rownum,employee_id from employees;

select rownum, employee_id
from employees
where rownum < 5;

select rownum, employee_id, rowid
from employees
where rownum < 5;

-- -- 연산자
-- 문자연산자 ||
select employee_id ||'-'|| emp_name AS employee_info
from employees
where rownum < 5;

-- 표현식CASE
select employee_id, salary,
    case when salary <=5000 then 'C등급'
         when salary > 5000 AND salary < 15000 then 'B등급'
         else 'A등급'
    end as salary_grade
from employees;

-- 조건식 AND, SOME, ALL
select employee_id, salary
from employees
where salary = any(2000, 3000, 4000)
order by employee_id;

-- =
select employee_id, salary
from employees
where salary = 2000
    or salary = 3000
    or salary = 4000
order by employee_id;

select employee_id,salary
from employees
where salary = all(2000,3000,4000)
order by employee_id;

select employee_id,salary
from employees
where salary = some(2000, 3000, 4000)
order by employee_id;

select employee_id, salary
from employees
where not(salary >= 2500)
order by employee_id;

select employee_id, salary
from employees
where salary between 2000 and 2500
order by employee_id;

-- in 조건식
select employee_id, salary
from employees
where salary in (2000, 3000, 4000)
order by employee_id;

-- exists 조건식
select department_id, department_name
from departments a
where exists(select *
             from employees b
             where a. department_id = b.department_id
             and b.salary > 3000)
order by a.department_name;

-- Like 조건식
select emp_name
from employees
where emp_name like 'A%'
order by emp_name;

select emp_name
from employees
where emp_name like 'Al%'
order by emp_name;

create table ex3_5(
    names varchar2(30));
    
drop table ex3_5;    
select * from ex3_5;    

insert into ex3_5 values('홍길동');
insert into ex3_5 values('홍길용');
insert into ex3_5 values('홍길상');
insert into ex3_5 values('홍길상동');

select * from ex3_5
where names Like '홍길%';

select*from ex3_5 where names like '홍길_';

delete ex3_3;

select * from ex3_3;

insert into ex3_3(employee_id)
select e.employee_id
from employees e, sales s
where e.employee_id = s.employee_id
and s.sales_month between '200010' and '200012'
group by e.employee_id;

commit;

select * from employees;

select * from ex3_6;
drop table ex3_6;

create table ex3_6(
    employee_id number(6) not null,
    emp_name varchar2(80) not null,
    salary number(8,2),
    manager_id number(8,2)
);
insert into ex3_6
select employee_id,emp_name,salary,manager_id
from employees
where manager_id = 124 and salary between 2000 and 3000;

select * from ex3_6;

merge into ex3_3 d
    using(select manager_id,employee_id,salary
            from ex3_6
            where manager_id = 146) b
    on(d.employee_id = b.employee_id)
when matched then
    update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
when not matched then
    insert (d.employee_id, d.bonus_amt) values(b.employee_id,b.salary*.001)
    where (b.salary < 8000);


    
             















