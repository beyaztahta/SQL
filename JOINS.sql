-----------JOINS-----------
CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');


CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17'); 
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19'); 
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20'); 
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

select* from sirketler;
select * from siparisler;

--INNER JOIN
--Iki tablodaki ortak noktaları(kesisimi)getirir.
--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tabloolusturun

Select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
FROM sirketler 
INNER JOIN siparisler ON sirketler.sirket_id=siparisler.sirket_id;

/*
NOT:
1)Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklindeyazin
2)From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismiyazmaliyiz
3)Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimizyazilmali
*/

--LEFT JOIN
/*ILk tablodaki recordları getirir.
--NOT : from dan sonra yazılan ilk tablo olur.
NOT:
1)Left Join’de ilk tablodaki tum record’largosterilir.
2)Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilirancak
ortak olmayan datalar icin o kisimlar boskalir
3)Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onuyazmaliyiz
*/
--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

Select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
FROM sirketler 
LEFT JOIN siparisler ON sirketler.sirket_id=siparisler.sirket_id;

--RIGHT JOIN
/*
NOT:
1)Right Join’de ikinci tablodaki tum record’largosterilir.
2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar 
ortak datalar icin gosterilirancak ortak olmayan datalar icin o kisimlar boskalir
*/

Select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
FROM sirketler 
RIGHT JOIN siparisler ON sirketler.sirket_id=siparisler.sirket_id;

--FULL JOINS
/*
NOT:
1)FULL Join’de iki tabloda var olan tum record’largosterilir.
2)Bir tabloda olup otekinde olmayan data’lar boskalir
*/

Select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
FROM sirketler 
FULL JOIN siparisler ON sirketler.sirket_id=siparisler.sirket_id;

--SELF JOINS
--INNER JOIN olarak kullanılır.
CREATE TABLE personel3
(
id int,
isim varchar(20),
title varchar(60), 
yonetici_id int
);
INSERT INTO personel3 VALUES(1, 'Ali Can','SDET',2);
INSERT INTO personel3 VALUES(2, 'Veli Cem','QA',3);
INSERT INTO personel3 VALUES(3, 'Ayse Gul','QA Lead', 4); 
INSERT INTO personel3 VALUES(4, 'Fatma Can','CEO',5);

select * from personel3;
select yonetici_id,isim from personel3;

--SORU: Her personelin yanina yonetici ismini yazdiran bir tabloolusturun
SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel p1 INNER JOIN personel p2
ON p1.yonetici_id = p2.id;




