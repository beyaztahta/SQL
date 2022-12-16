--DDL DATA DEFINITION LANGUAGE
--CREATE TABLE OLUSTURMA

Create table tedarikciler
(
tedarikci_ıd char(7),
tedarikci_isim varchar(20),
tedarikci_adres varchar(50),
ulasım_tarihi date
);

--DML DATA MANİPULATİON LANGUAGE
--var oln yeni tablo olusturdum
Create table tedarikci_ziyaret
AS
SELECT tedarikci_isim,ulasım_tarihi FROM tedarikciler;

--veri ekleme
INSERT INTO tedarikciler VALUES('123456','Zeynep CALISKAN','sumer mahallesi',now());
INSERT INTO tedarikciler Values('236547','Zeynep SALLA','Salla sokak','2022-12-03');

--parcalı veri ekleme
INSERT INTO tedarikciler(tedarikci_isim,tedarikci_adres) VALUES ('Yunus Emre','Emre Mahallesi');

--DQL DATA QUERY LANGUAGE 
--SELECT
SELECT * FROM tedarikciler;


