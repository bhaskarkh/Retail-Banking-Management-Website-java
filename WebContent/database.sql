create table LoginGroupF(
	userid varchar2(20) not null,
	password varchar2(20) not null,
	role varchar2(50) check (role in('CAE','CT')),
	datetime timestamp default CURRENT_TIMESTAMP 
)

INSERT into logingroupf values ('CAE0001', '12345678', 'CAE', CURRENT_TIMESTAMP);
INSERT into logingroupf values ('CAE', '123', 'CAE', CURRENT_TIMESTAMP);

INSERT into logingroupf values ('CAE0002', '12345678', 'CAE', CURRENT_TIMESTAMP);
INSERT into logingroupf values ('CAE0003', '12345678', 'CAE', CURRENT_TIMESTAMP);
INSERT into logingroupf values ('CT0001', '12345678', 'CT', CURRENT_TIMESTAMP);
INSERT into logingroupf values ('CT', '123', 'CT', CURRENT_TIMESTAMP);
INSERT into logingroupf values ('CT0002', '12345678', 'CT', CURRENT_TIMESTAMP);
INSERT into logingroupf values ('CT0003', '12345678', 'CT', CURRENT_TIMESTAMP);

select * from logingroupf
SELECT * FROM addCustomer where CustomerId='0'

create table addCustomer(
	ssnid varchar2(10) not null,
	CustomerId number(4)  primary key,
	customerName varchar2(30) not null,
	customerAge number(3) not null,
	addressLine1 varchar2(30) not null,
	addressLine2 varchar2(30) not null,
	city varchar2(30) not null,
	state varchar2(30) not null
);

create sequence squcust
start with 1000
increment by 5

drop table addCustomer


create table Account
(
AccountId number(8) primary key,
CustomerId number(4) not null,
AccountType varchar(30) not null,
DepositAmount number(9,2) not null,
foreign key(CustomerId) references addCustomer(CustomerId)

)

select * from Account where CustomerId='1455'
select * from addcustomer
create sequence squacc
start with 10000000
increment by 1


create table transactiongroupF
(
AccountId number(8),
transactionamount number(8,2) not null,
transactiontype varchar(10) check (transactiontype in('CREDIT','DEBIT')),
transactiontime timestamp default CURRENT_TIMESTAMP ,
foreign key(AccountId) references Account(AccountId)
)
select * from transactiongroupf where accountid=516 and trunc(transactiontime) between to_date('2018-08-08','YYYY-MM-DD') and to_date('2018-08-09','YYYY-MM-DD')
drop table transactiongroupF
select * from transactiongroupF 

select * from transactiongroupF where accountid=10000010 or transactiontime=

insert into transactiongroupF values(10000010, 5000.20, 'CREDIT', CURRENT_TIMESTAMP);
insert into transactiongroupF values(10000010, 5000.20, 'DEBIT', CURRENT_TIMESTAMP);
insert into transactiongroupF values(10000010, 5000.20, 'CREDIT', CURRENT_TIMESTAMP);



select * from transactiongroupf where accountid = 506 and trunc(transactiontime) between to_date('2018-08-08','YYYY-MM-DD') and to_date('2018-08-08','YYYY-MM-DD');


select * from transactiongroupf where accountid = 502 and to_date('2018-08-08','YYYY-MM-DD') >= to_date('2018-08-08','YYYY-MM-DD');