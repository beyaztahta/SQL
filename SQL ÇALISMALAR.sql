
CREATE TABLE calisan_tablosu --DDL
(
calisan_kimligi char(15),
adı_soyadı varchar (40),
sehir char(40),
eyalet char(40)	
);

INSERT INTO calisan_tablosu VALUES('10330','John John','NEW YORK','NY');---DML
INSERT INTO calisan_tablosu VALUES('10449','Sarah Lebat','MALBOURNE','VICTORIA');
INSERT INTO calisan_tablosu VALUES('11012','Jon Dallas','NY','NY');
INSERT INTO calisan_tablosu VALUES('11013','Gheorghe Balı','NY','NY');
INSERT INTO calisan_tablosu VALUES('11014','Anton Savar','NY','NY');

CREATE TABLE odeme_tablosu
(
calisan_kimligi char(15),
maas_tarihi char(15),
ay_no int,
deger int		
);


INSERT INTO odeme_tablosu VALUES('10330','HAZIRAN',6,128);
INSERT INTO odeme_tablosu VALUES('10330','TEMMUZ',7,158);
INSERT INTO odeme_tablosu VALUES('10330','AGUSTOS',8,133);
INSERT INTO odeme_tablosu VALUES('10330','EYLUL',9,120);
INSERT INTO odeme_tablosu VALUES('10330','EKIM',10,188);
INSERT INTO odeme_tablosu VALUES('10330','KASIM',11,160);
INSERT INTO odeme_tablosu VALUES('10330','ARALIK',12,105);
INSERT INTO odeme_tablosu VALUES('10449','EYLUL',9,150);
INSERT INTO odeme_tablosu VALUES('10449','EKIM',10,158);
INSERT INTO odeme_tablosu VALUES('10449','KASIM',11,160);
INSERT INTO odeme_tablosu VALUES('10449','ARALIK',12,180);

delete from odeme_tablosu

SELECT * FROM calisan_tablosu;
SELECT * FROM odeme_tablosu;

--SORU 1: Calısan kimligi 10330 olan tum veriyİ listeleyiniz.
--SORU 2:Calısan kimligi 10449 olan tum veriyi listeleyiniz.
--SORU 3:  Calısan tablosunda sehir ve eyalet tablosunu bir arada gosteren sorguyu yazınız.
--SORU 4: Adları J harfi ile baslayan tum calısanları goruntuleyın.
--SORU 5:Eyaleti NY olanlara NULL atayarak , null degerleri yazdırınız.
--5--1. Atanan null degerlerini eski haline gri getiriniz.:)      /
--5...2.Odeme tablosundakı deger field yerine maas yazdıran sorguyu yazınız.
--SORU 6:NUll olmayan veriyi listeleyiniz.
--SORU 7:ay_no su 9 olan degerleri ve calisan_kimligini listeleyen sorguyu yazınız.
--7..1: odeme tablosundan ay no su 6 olan  ve calısan tablosundan calısan kimligi 10330 olan personeli listeleyiniz.//intersect
--SORU 8:odeme tablosundakı degerleri natural order sıralayınız.
--SORU 9:Calısan tablosundakı ay no yu dogal sıralı, calisan_kimligi ters sıralı olacak sorguyu yazınız.
--SORU 10:Odeme tablosundakıdakı degerlerin sayısını bulan sorguyu yazınız.
 --10..1 Odeme tablosundaki ay_no ya gore ayların sayısını bulan sorguyu yazınız
--1
SELECT *from odeme_tablosu where calisan_kimligi='10330';
--2
SELECT *from odeme_tablosu where calisan_kimligi='10449';
--3
select calisan_kimligi,sehir||' - '||eyalet as sehir_eyalet,adı_soyadı from calisan_tablosu ;
--4
select * from calisan_tablosu where adı_soyadı between 'I' and 'K';
--5
UPDATE calisan_tablosu set eyalet= 'null' where eyalet='NY';
--5..1
UPDATE calisan_tablosu set eyalet='NY' where eyalet='null';
--5...2
select deger as maas from odeme_tablosu 

--6
select *from calisan_tablosu  where eyalet IS not NULL
--7
select calisan_kimligi from odeme_tablosu where ay_no=9;

--7...1
select  calisan_kimligi from odeme_tablosu where ay_no=6
INTERSECT
select  calisan_kimligi from calisan_tablosu where calisan_kimligi='10330';

--8
SELECT * from odeme_tablosu  order by deger;
--9
Select * from odeme_tablosu order by ay_no, calisan_kimligi DESC

--10
select calisan_kimligi, count(deger)as toplam_maas_sayısı from odeme_tablosu 
group by calisan_kimligi HAVING count(deger)>1; 
-----10.1
select ay_no, count(maas_tarihi)as toplam_ay_sayısı from odeme_tablosu 
group by ay_no HAVING count(maas_tarihi)>1; 

--her calisanin adi ve soyadina gore kazanilan toplam tutari goruntulemek icin sql sorgusu

select adı_soyadı , 
(select sum(deger)from odeme_tablosu where odeme_tablosu.calisan_kimligi= calisan_tablosu.calisan_kimligi)
as toplam_maas from calisan_tablosu ;




