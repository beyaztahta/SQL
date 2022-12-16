--LIKE CONDITION
/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz. 
Eğer büyük küçük harf gözetmeksizin kullanmak istersek ~~* sembollerini kullanırız
*/

CREATE TABLE customers  (
id int UNIQUE,
name varchar(50) NOT NULL,
salary int
);
INSERT INTO customers(id, name, salary) VALUES (1001, 'Ali', 62000);  
INSERT INTO customers(id, name, salary) VALUES (1002, 'Ayse', 57500);  
INSERT INTO customers(id, name, salary) VALUES (1003, 'Feride', 71000);
INSERT INTO customers(id, name, salary) VALUES (1004, 'Fatma', 42000);  
INSERT INTO customers(id, name, salary) VALUES (1005, 'Kasim', 44000);
INSERT INTO customers(id, name, salary) VALUES (1006, 'ahmet', 82000);
INSERT INTO customers(id, name, salary) VALUES (1007, 'erhan', 92000);

select * from customers;

--% basında ve sonunda kullanımı onemlidir.

--SORU: Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERYyazin
select * from customers where name like 'A%';

--SORU:Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERYyazin
select name,salary from customers where name like '%e';

--SORU :Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERYyazin
select name,salary from customers where name like '%er%';

--"_(underscore) " kullanımı,sadece bir karakteri gosterir.
--SORU: Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran
 select * from customers where name like '_atma';

--SORU: Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERYyazin
SELECT * FROM customers where name like '_a%';

--SORU: Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERYyazin
SELECT * FROM customers where name like '__s%';

--SORU: Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERYyazin
Select * from customers where name like '__s_';

--SORU: Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from customers where name like 'F___%';

--SORU: Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERYyazin
select * from customers where name like '_a_m%';

---" ~ " (regexp_like) daha karmasık sorgular ıcın herhangi bir kod, metin icerisinde 
--istenilen yazi veya kod parcasinin aranip bulunmasini saglayan kendine 
--ait soz dizimi olan bir yapidir.

CREATE TABLE kelimeler1
(
id int UNIQUE,
kelime varchar(50) NOT NULL,
Harf_sayisi int
);

INSERT INTO kelimeler1 VALUES (1001, 'hot', 3);
INSERT INTO kelimeler1 VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler1 VALUES (1003, 'hit', 3);
INSERT INTO kelimeler1 VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler1 VALUES (1008, 'hct', 3);
INSERT INTO kelimeler1 VALUES (1005, 'adem', 4);
INSERT INTO kelimeler1 VALUES (1006, 'selim', 5);
INSERT INTO kelimeler1 VALUES (1007, 'yusuf',5);
 select * from kelimeler1;

--SORU: Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
SELECT * FROM kelimeler1 where kelime ~'h[ai]t';

--SORU: Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime ~ 'h[a-k]t';

--SORU: Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime ~'[mi]';

--SORU: a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime  ~'^[as]';

--SORU: m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime ~'[mf]$';
 
          -------NOT LIKE CONDITION---------
--SORU1:ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime  not like 'h%';

--SORU2: a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime not like '%a%';

--SORU3: ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime not like '_de%';

--SORU4: 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler1 where kelime !~'[eio]';

/*
LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir.
LIKE = ~~
ILIKE = ~~*
NOT LIKE = !~~
NOT ILIKE = !~~*
NOT REGEXP_LIKE = !~*
NOT REGEXP_LIKE = !~

*/







