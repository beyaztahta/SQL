create table employee
(
employee_id char(5),
first_name varchar(20),
last_name varchar(20),
city varchar (30),
states varchar(30)
);

insert  into employee values(10330,'John','John1','NY','NY');
insert  into employee values(10449,'Sarah','Lebat','Melbourne','Bourke');
insert  into employee values(11012,'Jon','Dallas','NY','NY');
insert  into employee values(11013,'Gheorghe','Honey','NY','NY');
insert  into employee values(11014,'Anton','Savar','NY','NY');

create table payments
(
employee_id char(5),
salary varchar(23),
month_id int,
employee_value int
);

insert  into payments values(10330,'June',6,128);
insert  into payments values(10330,'July',7,158);
insert  into payments values(10330,'August',8,133);
insert  into payments values(10330,'September',9,120);
insert  into payments values(10330,'October',10,188);
insert  into payments values(10330,'November',11,160);
insert  into payments values(10330,'December',12,105);
insert  into payments values(10449,'September',9,150);
insert  into payments values(10449,'October',10,158);
insert  into payments values(10449,'November',11,160);
insert  into payments values(10449,'December',12,180);

select * from employee;
select * from payments;


--her calisanin adi ve soyadina gore kazanilan toplam tutari goruntulemek icin sql sorgusu,

select  first_name||' '||last_name AS name_surname, 
 (select sum(employee_value)from payments 
where payments.employee_id=employee.employee_id) from employee 



--ismi j harfi ile baslayan tum calisanlari goruntuleyin
select * from employee;
select * from payments;
select * from employee where first_name between 'I' and 'K';
/*