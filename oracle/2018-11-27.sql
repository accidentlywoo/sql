select count(*) from employees;
select count(employee_id) from employees;
select count(department_id) from employees;
-- null이 아닌 로우수를 계산
select count(distinct department_id) from employees;
-- distinct : 유일한 값만 조회
select distinct department_id
from employees
order by 1;
-- sum(expr) expr에는 숫자형만 올 수 있다.
select sum(salary) from employees;

select sum(salary), sum(distinct salary)
from employees;

-- avg(expr)
select avg(salary), avg(distinct salary)
from employees;

-- min(expr), max(expr) 최대 최솟값 반환
select min(salary), max(salary) 
from employees;

-- variance(expr) 분산 개별 값과 편균값과의 차이인 편차를 구해 이를 제곱해서 평균한 값을 말한다.
-- stddev(expr) 표준편차 분산값의 제곱근 통계에서는 평균을 중심으로 값들이 어느 정도 분산하는지를 나타내는 수치인 표준편차를 지표로 사용한다.
select variance(salary), stddev(salary)
from employees;

-- group by 특정 그룹을 묶어 데이터를 집계할 수 있게한다.
select department_id, sum(salary)
from employees
group by department_id
order by department_id;

select * from kor_loan_status;

select period, region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period like '2013%'
group by period, region
order by period, region;

select region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period = '201311'
group by region,period
order by region;

-- having
select period, region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period = '201311'
group by period, region
having sum(loan_jan_amt) > 100000
order by region;

-- rollup(expr1, expr2, ...) 추가적인 집계 정보를 보여준다.
select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period like '2013%'
group by period, gubun
order by period;

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period like '2013%'
group by rollup(period, gubun)
order by period;

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period like '2013%'
group by period, rollup(gubun);

-- cube(expr1, expr2, ...)
select period



















