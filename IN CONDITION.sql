--IN CONDITION komutu (and -or ile de ornekler)

CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler;

--Musteriler tablosundan urun ismi orange, apple ve apricot olan dataları listeleyiniz
SELECT * FROM musteriler WHERE urun_isim='Orange'or  urun_isim='Apple' or urun_isim='Apricot';

Select * from musteriler WHERE urun_isim='Orange' and urun_id=10;

SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');

-- NOT IN KOMUTU-->Yazdıgımız verilerin dısındakılerı getirir.
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');

--BETWEEN CONDITION / NOT BETWEEN 

--musteriler tablosundan  ıd si 20 ile 40 arasında olan tum verileri listeleyiniz.

SELECT * FROM musteriler Where urun_id>=20 and urun_id<=40;

SELECT * FROM musteriler Where urun_id BETWEEN 20 and 40;

SELECT * FROM musteriler Where urun_id NOT BETWEEN 20 and 40;

--SUBQUERIES

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar2;
select * from markalar;

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin
--isimlerini ve maaşlarini listeleyin.

SELECT isim,maas,isyeri FROM calisanlar2
where isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

--marka ıd si 101 den buyuk olan marka calısanlarının isim, maas ve sehirleri listeleyiniz.

SELECT isim,maas,sehir from calisanlar2
where isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

--Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

Select marka_id,calisan_sayisi from markalar
where marka_isim In (Select  isyeri from calisanlar2 where sehir='Ankara');



--AGGREGATE METOT KULLANIMI
 --Calısanlar tablosunadan en yuksek  maası listeleyin.
SELECT max(maas)FROM calisanlar2;
SELECT max(maas) AS maksimum_maas FROM calisanlar2;

/*
Eger bir sutuna gecici olarak bir isim vermek istersek  AS komutunu yazdıktan sonra vermek istedigimiz ismi yazarız.
*/
--Calısanlar tablosundan en dusuk  maası listeleyin
SELECT min(maas)FROM calisanlar2;
SELECT min(maas) AS minimum_maas FROM calisanlar2;

 --Calısanlar tablosundaki maasların toplamını listeleyin.
 SELECT sum(maas)AS toplam_maas FROM calisanlar2;
 Select sum(maas)FROM calisanlar2;
  
--Maasların ortalamasını listeleyin.
SELECT round(avg(maas))FROM calisanlar2;-- round bize yuvarlayarak verir. sonradan ekledik derste.
SELECT avg(maas)FROM calisanlar2;

--Tabloda kac kisinin maas aldıgını listeleyin.
Select count(maas)FROM calisanlar2;
Select count(*)FROM calisanlar2; -- count dedigimiz zaman bize satırları sayar.maas da yazsak yıldız da koysak aynı sayıyı verir.
--ama maas yerine null yazarsak * koydugumuzda hepsini sayar ,ama maas yazarsak satırı sayıp verir.
/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/

--Her markanın id sini ,ismini ve toplam kac sehirde bulundugunu listeleyen bir sorgu yazınız.
SELECT marka_id,marka_isim,(SELECT COUNT(sehir)AS sehir_sayısı FROM calisanlar2 WHERE marka_isim=isyeri) FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
CREATE VIEW summmaas
AS 
SELECT marka_isim,calisan_sayisi,
(SELECT sum(maas) FROM calisanlar2 where isyeri=marka_isim )as toplam_maas FROM markalar;

SELECT * FROM summmaas;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
    --maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar;

--VIEW KULLANIMI
CREATE View maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar;

SELECT * FROM maxminmaas;
/*
VIEW KULLANIMI yaptıgımız sorgulamaları hafızaya alır ve tekrar bizden 
istenen sorgulama yerine vıew e atadıgımız ismi select komutu ile cagırırız.
SELECT * FROM maxminmaas;
*/








