select * from ex2_10;

create sequence my_seq1
increment by 1
start with 1
minvalue 1
maxvalue 1000
nocycle
nocache;

create table ex2_8(
 col1 varchar(20),
 col2 varchar(20) 
);

delete ex2_8;

insert into ex2_8 (col1) values (my_seq1.nextval);

select * from ex2_8;

select my_seq1.currval from dual; -- 현재 시퀀스값을 알 수 있다.

select my_seq1.nextval from dual; -- nextinterval을 사용하면 select문을 사용하더라도 값이 증가된다.

insert into ex2_8 (col1) values (my_seq1.nextval);

select * from ex2_8;

-- 시퀀스 삭제
drop sequence my_seq1;

-- 파티션
select * from sales;

create table sales(
prod_id number(6,0) not null,
cust_id number(6,0) not null,
channel_id number(6,0) not null,
employee_id number(6,0) not null,
sales_date date default sysdate not null,
sales_month varchar2(6),
quantity_sold number(10,2),
amount_sold number(10,2),
create_date date default sysdate,
update_date date default sysdate
)
partition by range(sales_month)
(
partition sales_q1_1998 values less than ('199804') tablespace myts,
partition sales_q2_1998 values less than ('199807') tablespace myts,
partition sales_q3_1998 values less than ('199810') tablespace myts,
partition sales_q4_1998 values less than ('199901') tablespace myts,
partition sales_q5_1998 values less than ('200401') tablespace myts
);

select * from sales;
