-------------------UPPER –LOWER -INITCAP-----------------
CREATE TABLE kelimeler2 (
id int UNIQUE,
kelime varchar(50) NOT NULL,
Harf_sayisi int
);

INSERT INTO kelimeler2 VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler2 VALUES (1002, 'hat', 3);
INSERT INTO kelimeler2 VALUES (1003, 'hit', 3);
INSERT INTO kelimeler2 VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler2 VALUES (1008, 'hct', 3);
INSERT INTO kelimeler2 VALUES (1005, 'adem', 4);
INSERT INTO kelimeler2 VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler2 VALUES (1007, 'yusuf',5);

select * from kelimeler2;

/*
Tablolari yazdirirken buyuk harf: UPPER
kucuk harf : LOWER
ilk harfleri buyuk digerleri kucuk harf : INITCAP
yazdirmak icinkullaniriz
*/
 select upper (kelime)from kelimeler2;

 select lower(kelime) from kelimeler2;

 select initcap(kelime)from kelimeler2;



