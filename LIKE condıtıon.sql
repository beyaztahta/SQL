--LIKE CONDITION
--1.% sembolu
CREATE TABLE musteriler1 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler1 (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1003, 'Feride',71000);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1004, 'Fatma', 42000);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1005, 'Kasim',44000);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1006, 'ahmet', 62500); 

select* from musteriler1;

--SORU: Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler1 where isim LIKE 'A%'--%BURDAKİ ANLAMI SONUNDA NE OLURSA OLSUN ANLAMINDADIR.
SELECT * FROM musteriler1 where isim ILIKE 'A%'
/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz. 
Eğer büyük küçük harf gözetmeksizin kullanmak istersek ~~* sembollerini kullanırız
*/
SELECT * FROM musteriler1 WHERE isim ILIKE 'A%';
SELECT * FROM musteriler1 WHERE isim ~~* 'A%';

--SORU:Ismi "e" harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin

select isim,gelir from musteriler1 Where isim LIKE '%e';

--SORU :Isminin icinde "er" olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
 select isim,gelir from musteriler where isim like '%er%'

--2. _ (alttire)sembolu :sadece bir karakteri gosterir.
/*
SORU: Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERYyazin
SORU: Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERYyazin
SORU: Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERYyazin
*/
SELECT isim from musteriler1 where isim LIKE'_atma';
SELECT * from musteriler1 where isim LIKE'_a%';
SELECT * from musteriler1 where isim LIKE'__s%';


--------------3)REGEXP_LIKE ‘’ ~ ‘’

CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf',5);

select * from kelimeler;

--SORU: Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERYyazin
SELECT*
FROM kelimeler
WHERE kelime ~'h[ai]t';--//~*'h[ai]t'

--SORU: Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tumbilgilerini yazdiran QUERYyazin
SELECT*
FROM kelimeler
WHERE kelime ~'h[a-k]t';

--SORU: a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERYyazin
SELECT*
FROM kelimeler
WHERE kelime ~'^[as]';

--SORU: m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERYyazin
SELECT*
FROM kelimeler
WHERE kelime ~'[mf]$';


-- UPPER – LOWER - INITCAP
-- Kelimeler tablosundaki kelime sutunundaki verileri önce hepsi büyük harf, sonra küçük harf ve ilk harfleri 
-- büyük harf olucak şekilde yazdıralım
SELECT UPPER(kelime) as büyükkelime FROM kelimeler
SELECT LOWER(kelime) as kelime FROM kelimeler
SELECT INITCAP(kelime) as kelime FROM kelimeler -- INITCAP istediğimiz sutundaki verilerin ilk harfini büyük yazar
-- Musteriler tablosundan bütün isimleri büyük harf yapınız
SELECT UPPER(isim) FROM musteriler
/*
Eğer birden fazla sütundaki verileri büyük küçük harf yapmak istersek
select lower(title),UPPER(isim) from personel şekilde yapabiliriz
*/
select lower(title),UPPER(isim) from personel


















