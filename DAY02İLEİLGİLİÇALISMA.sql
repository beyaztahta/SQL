CREATE TABLE ogrenciler3
(
id int,
isim varchar(50),
veli_isim varchar(50),
yazılı_notu int	
);

INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenciler3;

SELECT isim FROM ogrenciler3 WHERE yazılı_notu>80;

--ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
Delete from ogrenciler3 Where isim='Nesibe Yilmaz' or isim='Mustafa Bak';

--İsmi Ali Can ve id'si 123 olan kaydı siliniz.
Delete from ogrenciler3 Where  isim='Ali Can' and id=123; 


CREATE TABLE ogrenci
(
id int,
isim varchar(50),
veli_isim varchar(50),
yazılı_notu int	
);

INSERT INTO ogrenci VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenci VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenci VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenci VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenci VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenci VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenci;
--id 'si 126'dan büyük olan kayıtları silelim.

DELETE FROM ogrenci where id>126;


--id'si 123, 125 veya 126 olanları silelim.

DELETE FROM ogrenci WHERE id=123 or id=125 or id=126;

