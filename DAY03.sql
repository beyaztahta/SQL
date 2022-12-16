CREATE TABLE ogrenciler2
(
id int,
isim varchar(50),
veli_isim varchar(50),
yazılı_notu int	
);

INSERT INTO ogrenciler2 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler2 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler2 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler2 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler2 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler2;

--İsmi Mustafa Bak ve Nesibe Yılmaz olab kayıyları silelim
DELETE FROM ogrenciler2 WHERE isim='Mustafa Bak' or isim='Nesibe Yilmaz'; 
--Veli ismi hasan olan datayı silelim.
DELETE FROM ogrenciler2 WHERE veli_isim='Hasan';

--TRUNCATE KOMUTU tablodaki verilei geri almaksızın siler.Bir tablodaki verileri geri alamayacagımız sekılde siler ve sartlı silme yapmaz.
TRUNCATE TABLE ogrenciler2; --TRUNCATE ogrenciler2;

--ON DELETE CASCADE KOMUTU :parent classtan data silmeyi saglar.normalde child tablodan data silmeden parenttan silemiyoruk.
                            --Aralarında primary ve foreıgn key iliskisi oldugu icin.

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

DROP TABLE if exists notlar-- Eger adres varsa tabloyu siler.

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

select * from talebeler;
select * from notlar;

--Notlar tablosundan talebe_ıd si 123 olan datayı silelim.
Delete from notlar where talebe_id='123';--child table dan kolaylıkla sildik.

--Talebeler tablosundan id si 126 olan datayı silelim.
DELETE FROM talebeler where id='126';

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/











