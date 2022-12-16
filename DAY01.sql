--DATABASE(VERİ TABANI) OLUSTURMA
Create database elif;

--DDL -DATA DEFINITION LANGUAGE
--1)CREATE TABLO OLUSTURMA
Create Table ogrenciler
(
ogrenci_no char(7),
İsim varchar(15),
Soyisim varchar(20),
Not_Ort real,   --ondalıklı sayılarda "real" kullanılır.
Kayıt_Tarihi date
);

--VAR OLAN TABLODAN YENİ TABLO OLUSTURMAK
CREATE TABLE ogrenci_notları
AS --Benzer tablodaki baslıklarla ve data tıpları ıle yenı bir tablo olusturmak ıcın normal 
--tablo olustururken kı parantezler yerine "as"kullanıp "select"komutu ile almak istediğimiz verileri alırız.
SELECT İsim,Soyisim,Not_Ort FROM ogrenciler;

--DML DATA MANİPULATION LANGUAGE(INSERT,UPDATE,DELETE)

--INSERT DATABASE VERİ EKLEME:
INSERT INTO ogrenciler VALUES('1234567','Elif','CALIK',98.05,now());
INSERT INTO ogrenciler VALUES('2345678','Goksel','CALIK',98.05,'2022-12-01');

--BİR TABLOYA PARCALI VERİ EKLEME,BELLİ FİELDLARA EKLEME YAPMAK
INSERT INTO ogrenciler(İsim,Soyisim) VALUES('MehmetEmin','CALIK');

--DDL DATA QUERY LANGUAGE
--SELECT
SELECT * From ogrenciler; --Buradaki * hersy anlamındadır.










