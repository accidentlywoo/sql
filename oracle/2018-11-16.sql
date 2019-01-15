select department_id, SUM(salary)xl
from employees
group by department_id;

select * from ex3_3;

insert into ex3_3(employee_id)
select e.employee_id
from employees e, sales s
where e.employee_id = s.employee_id
AND s.sales_month between '200010' and '200012'
group by e.employee_id;

select * from ex3_3
order by employee_id;

select employee_id, manager_id, salary, salary * 0.01
from employees
where employee_id in (select employee_id 
                    from ex3_3);
                    
select employee_id, manager_id, salary, salary * 0.001
from employees
where employee_id not in (select employee_id
                            from ex3_3)
and manager_id=146;                            
                    
merge into ex3_3 d
using(select employee_id, salary, manager_id
        from employees
        where manager_id = 146) b
on (d.employee_id = b.employee_id)
when matched then
    update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
when not matched then
    insert (d.employee_id, d.bonus_amt) values(b.employee_id, b.salary *.001)
    where (b.salary < 8000);

select * from ex3_3
order by employee_id;

merge into ex3_3 d
    using (select employee_id, salary, manager_id
            from employees
            where manager_id = 146) b
        on (d.employee_id = b.employee_id)
when matched then
    update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
    delete where (b.employee_id = 161)
when not matched then
    insert (d.employee_id, d.bonus_amt) values (b.employee_id, b.salary *.001)
    where b.salary < 8000;
  
  
select * from ex3_3 order by employee_id;  




