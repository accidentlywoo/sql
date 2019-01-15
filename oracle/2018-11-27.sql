select count(*) from employees;
select count(employee_id) from employees;
select count(department_id) from employees;
-- null�� �ƴ� �ο���� ���
select count(distinct department_id) from employees;
-- distinct : ������ ���� ��ȸ
select distinct department_id
from employees
order by 1;
-- sum(expr) expr���� �������� �� �� �ִ�.
select sum(salary) from employees;

select sum(salary), sum(distinct salary)
from employees;

-- avg(expr)
select avg(salary), avg(distinct salary)
from employees;

-- min(expr), max(expr) �ִ� �ּڰ� ��ȯ
select min(salary), max(salary) 
from employees;

-- variance(expr) �л� ���� ���� ��հ����� ������ ������ ���� �̸� �����ؼ� ����� ���� ���Ѵ�.
-- stddev(expr) ǥ������ �л갪�� ������ ��迡���� ����� �߽����� ������ ��� ���� �л��ϴ����� ��Ÿ���� ��ġ�� ǥ�������� ��ǥ�� ����Ѵ�.
select variance(salary), stddev(salary)
from employees;

-- group by Ư�� �׷��� ���� �����͸� ������ �� �ְ��Ѵ�.
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

-- rollup(expr1, expr2, ...) �߰����� ���� ������ �����ش�.
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



















