--ALIASES

CREATE TABLE calisanlar1
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) 
);

INSERT INTO calisanlar1 VALUES(123456789,' Ali Can', 'Istanbul');
INSERT INTO calisanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar1 VALUES(345678901, 'Mine Bulut','Izmir');

select * from calisanlar1;

--Eger iki sutunun verilerini birlestirmk istersek concete sembolu "||"  kullanırız.
--1.yol
SELECT calisan_id AS id,calisan_isim || calisan_dogdugu_sehir AS calisan_bilgisi from calisanlar1 
--2.yol
SELECT calisan_id AS id, concat (calisan_isim , calisan_dogdugu_sehir )AS calisan_bilgisi from calisanlar1 

SELECT calisan_id AS id,calisan_isim || ' ' || calisan_dogdugu_sehir AS calisan_bilgisi from calisanlar1 
--burada da aralarına bosluk koyarak yaptık.


--IS NULL CONDITION
   --NULL  degeri almıs kayıtları getirir.
CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
 
 SELECT  * from insanlar;
 
 --Name sutununda null olan degerleri sıralayınız.
 
select name from insanlar where name IS NULL;

 --Name sutununda null olmayan degerleri sıralayınız.
 
select name from insanlar where name IS NOT NULL;

-- Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar
SET name='No Name'
WHERE name is null;

--drop table if exists insanlar dıyerek de tabloyu silebiliriz.


-- ORDER BY KOMUTU
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar(ASC=ORDER BY)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/


CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar1

--Insanlar tablosundaki datalari adres’e gore siralayin  
SELECT * FROM insanlar ORDER BY adres;

SELECT * FROM insanlar ORDER BY soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar WHERE isim='Mine' ORDER BY ssn;

/*NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin*/

select * from insanlar1 where soyisim='Bulut' ORDER BY 4;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
 
 SELECT * FROM insanlar1 ORDER BY ssn DESC

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

SELECT * FROM insanlar1 ORDER BY isim, soyisim DESC;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız

/*Eger sutun uzunluguna gore sıralamak ıstersek length komutu kullanırız.
Ve yine uzunludu buyukten kucuge sıralamak ıstersek sonuna DESC komutunu eklerız.*/

SELECT isim, soyisim FROM insanlar1 ORDER BY LENGTH (soyisim);

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

SELECT isim|| ' ' ||soyisim AS isim_soyisim FROM insanlar1 ORDER BY LENGTH (isim||soyisim);

SELECT isim|| ' ' ||soyisim AS isim_soyisim FROM insanlar1 ORDER BY LENGTH (isim) +LENGTH(soyisim);

SELECT CONCAT (isim, ' ' ,soyisim) AS isim_soyisim FROM insanlar1 ORDER BY LENGTH (isim||soyisim);

SELECT CONCAT (isim, ' ' ,soyisim) AS isim_soyisim FROM insanlar1 ORDER BY LENGTH (concat(isim,soyisim));

--GROUP BY CLAUSE

/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

 select * from manav;

--1) Isme gore alinan toplam urunleri bulun

select isim, sum(Urun_miktar)  as toplam_urunler from manav 
GROUP BY isim;

-- Isme gore alinan toplam urunleri bulun ve buyukten kucuge dogru sıralayınız.

select isim, sum(Urun_miktar)  as toplam_urunler from manav  
GROUP BY isim 
ORDER BY toplam_urunler DESC;

--Urun ismine gore urunu alan toplam kişi sayısı.
 select urun_adi,count(isim)from manav 
 GROUP BY urun_adi;

select isim,count(urun_adi)from manav 
 GROUP BY isim;

















