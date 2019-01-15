-- UNION 합집합
create table exp_goods_asia(
    country varchar2(10),
    seq number,
    goods varchar2(80)
);

insert into exp_goods_asia values('한국', 1,'원유제외 석유류');
insert into exp_goods_asia values('한국', 2,'자동차');
insert into exp_goods_asia values('한국', 3,'전자집적회로');
insert into exp_goods_asia values('한국', 4,'선박');
insert into exp_goods_asia values('한국', 5,'LCD');
insert into exp_goods_asia values('한국', 6,'자동차부품');
insert into exp_goods_asia values('한국', 7,'휴대전화');
insert into exp_goods_asia values('한국', 8,'환식탄화수소');
insert into exp_goods_asia values('한국', 9,'무선송신기 디스플레이 부속품');
insert into exp_goods_asia values('한국', 10,'철 또는 비합금강');

insert into exp_goods_asia values('일본', 1,'자동차');
insert into exp_goods_asia values('일본', 2,'자동차 부품');
insert into exp_goods_asia values('일본', 3,'전자집적회로');
insert into exp_goods_asia values('일본', 4,'선박');
insert into exp_goods_asia values('일본', 5,'반도체웨이퍼');
insert into exp_goods_asia values('일본', 6,'화물차');
insert into exp_goods_asia values('일본', 7,'원유제외 석유류');
insert into exp_goods_asia values('일본', 8,'건설기계');
insert into exp_goods_asia values('일본', 9,'다이오드, 트랜지스터');
insert into exp_goods_asia values('일본', 10,'기계류');

select * from exp_goods_asia;

select goods
from exp_goods_asia
where country = '한국'
order by seq;

select goods
from exp_goods_asia
where country = '한국'
order by seq;

-- 중복x
select goods
from exp_goods_asia
where country = '한국'
union
select goods
from exp_goods_asia
where country = '일본';

-- 중복o
select goods
from exp_goods_asia
where country = '한국'
union all
select goods
from exp_goods_asia
where country = '일본';

-- intersect 교집합
select goods
    from exp_goods_asia
where country = '한국'
intersect
select goods
    from exp_goods_asia
where country = '일본';

-- MINUS 앞쿼리 기준 차집합
select goods
    from exp_goods_asia
where country = '한국'
minus
select goods
    from exp_goods_asia
where country = '일본';

-- 집합 연산자 제한사항
-- 집합 연산ㄹ자로 연결되는 각 select문의 select 리스트의 개수와 데이터 타입은 일치해야한다.
select goods
from exp_goods_asia
where country ='한국'
union
select seq,goods
from exp_goods_asia
where country='일본';

-- seq+goods조합 해서 중복체크
select seq,goods
from exp_goods_asia
where country ='한국'
union
select seq,goods
from exp_goods_asia
where country='일본'

-- 집합 연산자로 select 문을 연결할 때 order by 절은 맨 마지막 문장에서만 사용할 수 있다.
select goods
from exp_goods_asia
where country = '한국'
order by goods
union
select goods
from exp_goods_asia
where country = '일본';


select goods
from exp_goods_asia
where country = '한국'

union
select goods
from exp_goods_asia
where country = '일본'
order by goods;

-- BLOB, CLOB, BFILE에 대해서 집합 연산자를 쓸 수 없다.
-- union, intersect, minus 연산자는 LONG형 컬럼에는 사용할 수 없다.
 
-- grouping sets절
select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period like '2013%'
group by grouping sets(period, gubun);

select period, gubun, region, sum(loan_jan_amt) totl_jan
    from kor_loan_status
    where period like '2013%'
    and region in('서울', '경기')
group by grouping sets(period,(gubun, region));    

-- 동등 조인
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
where a.department_id = b.department_id;

-- 세미 조인