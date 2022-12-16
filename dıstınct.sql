--DISTINCT clause,
--çağrılan terimlerden tekrarlı olanların sadece birincisini alır.CREATE TABLE musteri_urun

CREATE TABLE musteri_urun
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteri_urun VALUES (10, 'Ali','Portakal');
INSERT INTO musteri_urun VALUES (10, 'Ali','Portakal');
INSERT INTO musteri_urun VALUES (20, 'Veli','Elma');
INSERT INTO musteri_urun VALUES (30, 'Ayse','Armut');
INSERT INTO musteri_urun VALUES (20, 'Ali','Elma');
INSERT INTO musteri_urun VALUES (10, 'Adem','Portakal');
INSERT INTO musteri_urun VALUES (40, 'Veli','Kaysi');
INSERT INTO musteri_urun VALUES (20, 'Elif','Elma');

select * from musteri_urun;
 
 SELECT DISTINCT urun_isim from musteri_urun;
 SELECT DISTINCT musteri_isim from musteri_urun;

select urun_isim from musteri_urun group by urun_isim;

 --Tabloda kac farkli meyve vardir?
 
 select  count(distinct urun_isim)as urun_cesit_sayısı from musteri_urun
 
 select count(distinct musteri_isim)as aynı_isimli_musteri_sayısı_tekrarsız from musteri_urun;
 
 ---------------------------------------------------
 ---------FETCH NEXT (SAYI) ROW ONLY-OFFSET--------

--1)Tabloyu urun_id ye gore siralayiniz
 select * from musteri_urun order by urun_id;
 
--2)Sirali tablodan ilk 3 kaydi listeleyin 
 select * from musteri_urun order by urun_id  limit 3;
select * from musteri_urun order by urun_id fetch next 3 row only;

--3)Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlarilisteleyin
 select * from musteri_urun order by urun_id offset 3 limit 4;
 
--4)musteri urun tablosundan ilk kaydı listeleyiniz.
 select * from musteri_urun order by urun_id fetch next 1 row only;
 select * from musteri_urun order by urun_id limit 1;

CREATE TABLE maas
(
id int,
musteri_isim varchar(50),
maas int
);
INSERT INTO maas VALUES (10, 'Ali', 5000);
INSERT INTO maas VALUES (10, 'Ali', 7500);
INSERT INTO maas VALUES (20, 'Veli', 10000);
INSERT INTO maas VALUES (30, 'Ayse', 9000);
INSERT INTO maas VALUES (20, 'Ali', 6500);
INSERT INTO maas VALUES (10, 'Adem', 8000);
INSERT INTO maas VALUES (40, 'Veli', 8500);
INSERT INTO maas VALUES (20, 'Elif', 5500);
 
--En yuksek maası alan musteriyi listeleyiniz.
select * from maas order by maas  desc limit 1; 
select max(maas)from maas

--En yuksek ıkıncı maası listeleyen query i yazınız.
 select * from maas order by maas desc offset 1 limit 1;
 
 select * from maas order by maas desc 
 limit 1 fetch next 1 row only;

 -->OFFSET KOMUTU satır atlamak istedigimizde kullanırız.

--maas tablosundan en dusuk 4. maası gosteren query i yazınız.
select * from maas order by maas offset 3 limit 1; 
 
 
 
 
 
 