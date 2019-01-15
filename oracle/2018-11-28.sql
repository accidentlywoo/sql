-- UNION ������
create table exp_goods_asia(
    country varchar2(10),
    seq number,
    goods varchar2(80)
);

insert into exp_goods_asia values('�ѱ�', 1,'�������� ������');
insert into exp_goods_asia values('�ѱ�', 2,'�ڵ���');
insert into exp_goods_asia values('�ѱ�', 3,'��������ȸ��');
insert into exp_goods_asia values('�ѱ�', 4,'����');
insert into exp_goods_asia values('�ѱ�', 5,'LCD');
insert into exp_goods_asia values('�ѱ�', 6,'�ڵ�����ǰ');
insert into exp_goods_asia values('�ѱ�', 7,'�޴���ȭ');
insert into exp_goods_asia values('�ѱ�', 8,'ȯ��źȭ����');
insert into exp_goods_asia values('�ѱ�', 9,'�����۽ű� ���÷��� �μ�ǰ');
insert into exp_goods_asia values('�ѱ�', 10,'ö �Ǵ� ���ձݰ�');

insert into exp_goods_asia values('�Ϻ�', 1,'�ڵ���');
insert into exp_goods_asia values('�Ϻ�', 2,'�ڵ��� ��ǰ');
insert into exp_goods_asia values('�Ϻ�', 3,'��������ȸ��');
insert into exp_goods_asia values('�Ϻ�', 4,'����');
insert into exp_goods_asia values('�Ϻ�', 5,'�ݵ�ü������');
insert into exp_goods_asia values('�Ϻ�', 6,'ȭ����');
insert into exp_goods_asia values('�Ϻ�', 7,'�������� ������');
insert into exp_goods_asia values('�Ϻ�', 8,'�Ǽ����');
insert into exp_goods_asia values('�Ϻ�', 9,'���̿���, Ʈ��������');
insert into exp_goods_asia values('�Ϻ�', 10,'����');

select * from exp_goods_asia;

select goods
from exp_goods_asia
where country = '�ѱ�'
order by seq;

select goods
from exp_goods_asia
where country = '�ѱ�'
order by seq;

-- �ߺ�x
select goods
from exp_goods_asia
where country = '�ѱ�'
union
select goods
from exp_goods_asia
where country = '�Ϻ�';

-- �ߺ�o
select goods
from exp_goods_asia
where country = '�ѱ�'
union all
select goods
from exp_goods_asia
where country = '�Ϻ�';

-- intersect ������
select goods
    from exp_goods_asia
where country = '�ѱ�'
intersect
select goods
    from exp_goods_asia
where country = '�Ϻ�';

-- MINUS ������ ���� ������
select goods
    from exp_goods_asia
where country = '�ѱ�'
minus
select goods
    from exp_goods_asia
where country = '�Ϻ�';

-- ���� ������ ���ѻ���
-- ���� ���ꤩ�ڷ� ����Ǵ� �� select���� select ����Ʈ�� ������ ������ Ÿ���� ��ġ�ؾ��Ѵ�.
select goods
from exp_goods_asia
where country ='�ѱ�'
union
select seq,goods
from exp_goods_asia
where country='�Ϻ�';

-- seq+goods���� �ؼ� �ߺ�üũ
select seq,goods
from exp_goods_asia
where country ='�ѱ�'
union
select seq,goods
from exp_goods_asia
where country='�Ϻ�'

-- ���� �����ڷ� select ���� ������ �� order by ���� �� ������ ���忡���� ����� �� �ִ�.
select goods
from exp_goods_asia
where country = '�ѱ�'
order by goods
union
select goods
from exp_goods_asia
where country = '�Ϻ�';


select goods
from exp_goods_asia
where country = '�ѱ�'

union
select goods
from exp_goods_asia
where country = '�Ϻ�'
order by goods;

-- BLOB, CLOB, BFILE�� ���ؼ� ���� �����ڸ� �� �� ����.
-- union, intersect, minus �����ڴ� LONG�� �÷����� ����� �� ����.
 
-- grouping sets��
select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period like '2013%'
group by grouping sets(period, gubun);

select period, gubun, region, sum(loan_jan_amt) totl_jan
    from kor_loan_status
    where period like '2013%'
    and region in('����', '���')
group by grouping sets(period,(gubun, region));    

-- ���� ����
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
where a.department_id = b.department_id;

-- ���� ����