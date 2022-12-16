--JOINS 
/*
Iki tabloyu birlestirmel icin kullanılır.
1-ınner join vardır ,bu iki tablonun ortak yonlrini alır.
2-left join,fromdan sonra girilen ilk tablodur ve onun tum bilgireini (recordlerını)alır.Ilk tablodaki datalara
2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
ancak ortak olmayan datalar icin o kisimlar boskalir
Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once ,.
3-right join,ikinci tablodaki tum recordları alır.
4-full joın, ili tablodaki tum verileri alır ve olmayanlar karsına bır deger atamaz bos bırakır yani null olur.
5-self join,aklınıze seklfi cekmekten gelsin . Cunku kendı ıcerisinde ınner join edilir.
*/

CREATE TABLE company
(
company_id int,
company_name varchar (20)	
);

INSERT INTO company VALUES(100, 'Toyota'); 
INSERT INTO company VALUES(101, 'Honda'); 
INSERT INTO company VALUES(102, 'Ford'); 
INSERT INTO company VALUES(103,'Hyundai');

CREATE TABLE orders
(
orders_id int,
company_id int,
orders_date date
);
INSERT INTO orders VALUES(11,101,'17-Apr-2020');
INSERT INTO orders VALUES(22,102,'18-Apr-2020');
INSERT INTO orders VALUES(33,103,'19-Apr-2020');
INSERT INTO orders VALUES(44,104,'20-Apr-2020');
INSERT INTO orders VALUES(55,105,'21-Apr-2020');

select * from company;
select * from orders;

/*
SORU-Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi,siparis_id 
ve siparis_tarihleri ile yeni bir tablo olusturun
*/

--INNER JOIN

/*
"Honda" 	11	"2020-04-17"
"Ford"	    22	"2020-04-18"
"Hyundai"	33	"2020-04-19"
*/

SELECT company.company_name,orders.orders_id,orders.orders_date
from company INNER JOIN orders ON company.company_id=orders.company_id;

--LEFT JOIN
/*
"Toyota"	null   null	
"Honda"  	11	 "2020-04-17"
"Ford"	    22	 "2020-04-18"
"Hyundai"	33	 "2020-04-19"
*/
Select company.company_name,orders.orders_id,orders.orders_date
from company LEFT JOIN orders on company.company_id=orders.company_id;

--RIGHT JOIN
/*
"Honda"	    11	"2020-04-17"
"Ford"	    22	"2020-04-18"
"Hyundai"	33	"2020-04-19"
 null       44  "2020-04-20"
 null	    55	"2020-04-21"
*/

Select company.company_name,orders.orders_id,orders.orders_date
from company RIGHT JOIN orders on company.company_id=orders.company_id;

--FULL JOIN
 /*
"Toyota"	null	null
"Honda"	     11	   "2020-04-17"
"Ford"	     22	   "2020-04-18"
"Hyundai"	 33	   "2020-04-19"
null	     44	   "2020-04-20"
null	     55	   "2020-04-21"
 */

SELECT company.company_name,orders.orders_id,orders.orders_date
FROM company FULL JOIN orders
ON company.company_id=orders.company_id;

--SELF JOIN

CREATE TABLE employee
(id int,
isim varchar(20), 
title varchar(60),
yonetici_id int
);

INSERT INTO employee VALUES(1, 'Ali Can', 'SDET',2);
INSERT INTO employee VALUES(2, 'Veli Cem', 'QA',3);
INSERT INTO employee VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO employee VALUES(4, 'Fatma Can', 'CEO',5);

SELECT * FROM employee;

--Her personelin yanina yonetici ismini yazdiran bir tabloolusturun
/*
 employee_name     executive_name
"Veli Cem"	        "Ali Can"
"Ayse Gul"	        "Veli Cem"
"Fatma Can"      	"Ayse Gul"
*/
SELECT p1.isim AS employee_name,p2.isim AS executive_name
FROM employee p1 INNER JOIN employee p2
ON  p1.id=p2.yonetici_id;












