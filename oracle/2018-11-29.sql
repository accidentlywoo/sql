-- 동등 조인
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
where a.department_id = b.department_id;

-- 세미 조인 b테이블에 존재하는 a테이블의 데이터 추출
select department_id, department_name
from departments a
where exists(select * 
            from employees b
            where a.department_id=b.department_id
            and b.salary > 3000)
order by a.department_name;

-- IN 사용
select department_id, department_name
from departments a
where a.department_id in(select b.department_id
                        from employees b
                        where b.salary > 3000)
order by department_name;

select a.department_id, a.department_name
from departments a, employees b
where a.department_id = b.department_id
    and b.salary > 3000
order by a.department_name;

-- 안티 조인 
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
    where a.department_id = b.department_id
    and a.department_id not in(select department_id
                                from departments
                                where manager_id is null);
select count(*)
from employees a
where not exists(select 1
                from departments c
                where a.department_id = c.department_id
                    and manager_id is null);                    
select 1 from employees;                    

-- 셀프조인
select a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
from employees a, employees b
where a.employee_id < b.employee_id
      and a.department_id = b.department_id
      and a.department_id = 20;

-- 외부 조인
-- 일반 조인  job_history 테이블을 부서번호 값을 조건으로 조인한 결과. job_history에 없는 부서번호는 조회되지 않는다
select a.department_id, a.department_name, b.job_id, b.department_id
from departments a,
    job_history b
    where a.department_id = b.department_id;
-- 외부 조인 조인 조건에서 데이터가 없는 테이블의 컬럼에 (+)기호
select a.department_id, a.department_name, b.job_id, b.department_id
from departments a, job_history b
    where a.department_id = b.department_id(+);

select a.employee_id, a.emp_name, b.job_id, b.department_id
from employees a, job_history b
    where a.employee_id = b.employee_id(+)
    and a.department_id = b.department_id;

select a.employee_id, a.emp_name, b.job_id, b.department_id
from employees a, job_history b
    where a.employee_id = b.employee_id(+)
    and a.department_id = b.department_id(+);

-- 카타시안 조인 where이 없다. 테이블a건수n1, 테이블b건수n2, 카타시안 조인 결과 건수는 n1*n2
select a.employee_id, a.emp_name, b.department_id, b.department_id
from employees a, departments b;

