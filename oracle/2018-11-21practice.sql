select /*+ rule */ * 
from ORA_USER.SALE2 ;

select * from ex3_3;

create table ex3_3 (
    employee_id number,
    bonus_amt number default 0
);

insert into ex3_3(employee_id);

select e.employee_id
from employee e, sales s
where e.employee_id = s.employee_id
and s.sales_month between '200010' and '200012'
group by e.employee_id;

select employee_id, manager_id, salary, salary * 0.01
from employees
where employee_id in
    (select employee_id from ex3_3);
    
merge into ex3_3 d
    using (select employee_id, salary, manager_id
            from employees
            where manager_id = 146) b
    on(d.employee_id=b.employee_id)
when matched then
    update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
when not matched then
    insert (d.employee_id,d.bonus_amt) values(b.employee_id, b.salary*.001)
    where(b.salary < 8000);
    
insert into ex3_3(employee_id);    