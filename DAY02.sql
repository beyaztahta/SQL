Create Table ogrenciler5
(
ogrenci_no char(7),
İsim varchar(15),
Soyisim varchar(20),
Not_Ort real,   --ondalıklı sayılarda "real" kullanılır.
Kayıt_Tarihi date
);

--VAR OLAN BİR TABLODAN YENİ BİR TABLO OLUSTURMAK
CREATE TABLE notlar
AS
Select İsim,Not_Ort FROM ogrenciler5;

SELECT *FROM notlar

--TABLO İCİNE VERİ EKLEMEK
INSERT INTO notlar VALUES ('fatma',71.5);
INSERT INTO notlar VALUES ('leyla',99.5);

select İsim from notlar
select Not_Ort from notlar

--CONSTRAINT
--UNIQEU

Create Table ogrenciler6
(
ogrenci_no char(7) UNIQUE,
İsim varchar(15) NOT NULL,
Soyisim varchar(20),
Not_Ort real,   --ondalıklı sayılarda "real" kullanılır.
Kayıt_Tarihi date
);
 SELECT * FROM ogrenciler6;

insert into ogrenciler6 Values('1234567','leyla','beyaz',98.05,now());
insert into ogrenciler6 Values('1234568','ali','veli',88.05,now());

insert into ogrenciler6 (ogrenci_no,Soyisim,Not_Ort)values('1234599','keskin',100.0);--not null olduguicin bu veri eklenemez.

--PRİMARY KEY OLUSTURMA ATAMASI

Create Table ogrenciler7
(
ogrenci_no char(7) PRIMARY KEY,
İsim varchar(15) ,
Soyisim varchar(20),
Not_Ort real,   
Kayıt_Tarihi date
);

--PRIMARY KEY ATAMASI 2.YOL:
--eger constraınt ismini kendımız vermek ıstersek yaparız.
Create Table ogrenciler8
(
ogrenci_no char(7) ,
İsim varchar(15) ,
Soyisim varchar(20),
Not_Ort real,   
Kayıt_Tarihi date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)--PRIMARY KEY(ogrenci_no), 3. yol olarak bu sekılde de yapabılırız.
);

--FOREIGN KEY
/*
Practice 4:
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari 
olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char(15) PRIMARY KEY,
tedarikci_ismi varchar(25),
iletisim_isim varchar(50)
);

Create table urunler
(
tedarikci_id char(15),
urun_ıd char(15),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)	
);
select * from urunler;
select *from tedarikciler3;
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun.
“id” yi Primary Key yapin,
“isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.
Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--UNIQUE CONS.oldugu için kabul etmedi.
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--not null cons. kabul etmedi.
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--UNIQUE CONS.oldugu için kabul etmedi.
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--int oldugu halde string girilmeye calısılmıs o sebepten kabul etmedi
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--ıkıncı hicligi kabul etmedi.;--prımary key
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--prımary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');;--prımary key

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;

--CHECK CONSTRAINT 
Create table sehirler2
(
alan_kodu int PRIMARY KEY,
isim varchar(20)NOT NULL,
nufus int CHECK (nufus>0)	
)
INSERT INTO sehirler2 VALUES('81','DUZCE',400.000);
INSERT INTO sehirler2 VALUES('16','BURSA',1500.000);
Insert INTO sehirler2 VALUES('21','DIYARBAKIR',800.000);

select * from sehirler2;

--DQL WHERE KULLANIMI
select * from calisanlar;
select isim from calisanlar;

--Calısanlar tablosundan maası 500 den buyuk olanları lısteleyınız.

select isim,maas from calisanlar WHERE maas>5000 ;

--Calısanlardan tablosundan ismi VELİHAN olan tum veriyi listeleyiniz.

SELECT * FROM calisanlar WHERE isim='Veli Han' ;

--Calısanlar tablosundan maası 5000 olan tum verılerı lısteleyınız.
SELECT * FROM calisanlar Where maas=5000;

--DML --DELETE KOMUTU

DELETE FROM calisanlar;--Eger parent table baska bir child table ıle ilişkili ise one child table silinmelidir.
DELETE FROM adresler;--direkt adresler tablosunun içindeki verileri siler,tablo bos gelir.Tabloyu silmez.

--Adresler tablosundan sehri antep olan verileri silelim.
delete from adresler where sehir='Antep';
select * from adresler;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
CREATE TABLE ogrenciler9
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler9 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler9 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler9 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler9 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler9 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler9 VALUES(127, 'Mustafa Bak', 'Ali', 99);
select * from ogrenciler9;
 
 Select * from ogrenciler9 where isim='Nesibe Yilmaz'or isim='Mustafa Bak';






















