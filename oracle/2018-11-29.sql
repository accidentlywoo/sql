-- ���� ����
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
where a.department_id = b.department_id;

-- ���� ���� b���̺� �����ϴ� a���̺��� ������ ����
select department_id, department_name
from departments a
where exists(select * 
            from employees b
            where a.department_id=b.department_id
            and b.salary > 3000)
order by a.department_name;

-- IN ���
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

-- ��Ƽ ���� 
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

-- ��������
select a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
from employees a, employees b
where a.employee_id < b.employee_id
      and a.department_id = b.department_id
      and a.department_id = 20;

-- �ܺ� ����
-- �Ϲ� ����  job_history ���̺��� �μ���ȣ ���� �������� ������ ���. job_history�� ���� �μ���ȣ�� ��ȸ���� �ʴ´�
select a.department_id, a.department_name, b.job_id, b.department_id
from departments a,
    job_history b
    where a.department_id = b.department_id;
-- �ܺ� ���� ���� ���ǿ��� �����Ͱ� ���� ���̺��� �÷��� (+)��ȣ
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

-- īŸ�þ� ���� where�� ����. ���̺�a�Ǽ�n1, ���̺�b�Ǽ�n2, īŸ�þ� ���� ��� �Ǽ��� n1*n2
select a.employee_id, a.emp_name, b.department_id, b.department_id
from employees a, departments b;

