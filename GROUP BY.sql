--GROUP BY 
CREATE TABLE personel1
(
id int,
isim varchar(50),  
sehir varchar(50),  
maas int,  
sirket varchar(20)
);

INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz','Istanbul', 5500, 'Honda');  
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin','Istanbul', 4500, 'Toyota');  
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk','Ankara', 3500, 'Honda');  
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk','Izmir', 6000, 'Ford');  
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk','Ankara', 7000, 'Tofas');  
INSERT INTO personel1 VALUES(456789012, 'Veli Sahin','Ankara', 4500, 'Ford');  
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin','Bursa', 4500, 'Honda');
 select * from personel1;
 delete from personel1;

--isme gore toplam maasları bulun.
select isim, sum(maas) as toplam_maas from personel1 GROUP BY isim ; --isme gore grupladık
select sehir,sum(maas)as toplam_maas_sehire_gore from personel1 GROUP BY sehir;--sehre gore grupladım.

--personel tablosundaki isimleri gruplayın.
select isim from persınel1 GROUP BY isim;

--sehre gore toplam personel sayisinibulun

select sehir ,count(isim)as calisan_sayisi from personel1 GROUP BY sehir; --bir sehirde kac kisi calisti onu buldum.

--Sirketlere gore maasi 5000 liradan fazla olan personel sayisinibulun

select sirket,count(*)as calisan_sayisi from personel1 where maas>5000 Group by sirket;

-----HAVING 
--GROUP BY ile birlikte aggregate metotları ile  kullanılır. group by dan sonra kullanırız.
--group by dan sonra where yapılmaz.ONcesinde sadece where yapabiliriz.

--Her sirketin MINmaaslarini eger 4000’den buyuksegoster
SELECT sirket, min(maas) from personel1  group by sirket HAVING min(maas)>4000;

--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorguyaziniz
 SELECT isim,sum(maas) as toplam_gelir from personel1 group by isim HAVING sum(maas)>10000;

--Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorguyaziniz

select sehir, count(isim)as personel_sayısı from personel1 group by sehir HAVING count(isim)>1;

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz

SELECT sehir, MAX(maas)as max_maas from personel1 group by sehir HAVING max(maas)<5000;


---UNION OPERATOR
/*
Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen "Field SAYISI" ve "DATA TYPE"’i ayni olmalıdır.
unıon tekrarlı varsa tek seferde getirir. unıon all yazarsak hepsini getirir.
NOT:2.sorgunun sonuna ORDER BY komutunu kullanirsaniz tum tabloyu istediginiz siralamaya gore siralar.*/

--1)Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select sehir as isim_veya_sehir_ismi,maas from personel1 where maas>5000
UNION
SELECT isim as isim_veya_sehir_ismi,maas from personel1 where maas>4000;

--2)Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelinmaaslarini bir tabloda gosteren sorguyaziniz

SELECT sehir,maas from personel1 WHere sehir='Istanbul'
UNION
SELECT isim,maas from personel1 where isim='Mehmet Ozturk' ORDER By maas;

--3)Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den azolanlari bir
-- tabloda maas miktarina gore sirali olarak gosteren sorguyuyaziniz

SELECT isim,maas from personel1 where maas<5000 
UNION
SELECT sehir,maas from personel1 where maas>3000 order by isim;

CREATE TABLE personel2
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel2(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

SELECT * FROM personel2;
SELECT * FROM personel_bilgi;

--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini,
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin
 SELECT sehir as sehir_tel ,maas as maas_cocuksayisi from personel2 where id=123456789
 UNION
 SELECT tel,cocuk_sayisi from personel_bilgi where id=123456789;

/*
UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
Ayni kayit birden fazla olursa, sadece bir tanesini alir.
UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.

NOT : UNION ALL ile birlestirmelerde de
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali
*/

--1)Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslaribulunuz//unıon all ile cozumu:

SELECT isim ,maas from personel2 where maas<5000;--direkt cozumu

select isim,maas from personel2 where maas<5000
UNION                                           --unıon cozumu
select isim,maas from personel2 where maas<5000;


select isim,maas from personel2 where maas<5000
UNION ALL                                       --unıon all cozumu
select isim,maas from personel2 where maas<5000;


/*
  1)Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslariyazdirin
  2)Tabloda personel maasi 5000’den az olan tum isimleri ve maaslariyazdirin
  3)Iki sorguyu UNION ve UNION ALL ilebirlestirin
 */
 SELECT sehir,maas from personel2 where maas>4000
 UNION
 SELECT isim,maas from personel2 where maas<5000;

 SELECT sehir,maas from personel2 where maas>4000
 UNION ALL
 SELECT isim,maas from personel2 where maas<5000;
 
 ---INTERSECT OPERATOR
 /*
 verilen iki sorgunun kesisimini verir.Kumelerdeki kesisim gibi...
 */
 
-- 1)Personel tablosundan Istanbul veya Ankara’da calisanlarin id’leriniyazdir
-- 2)Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id leriniyazdirin
-- 3)Iki sorguyu INTERSECT ilebirlestirin

SELECT id from personel2 where sehir IN('Istanbul','Ankara')
INTERSECT 
SELECT id from personel_bilgi where cocuk_sayisi IN (2,3);
 
/*
1)Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini
listeleyin
2)Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id leriniyazdirin
3)Iki sorguyu INTERSECT ilebirlestirin
*/

  SELECT id from personel2 where maas NOT BETWEEN 4800 AND 5000
  INTERSECT
  SELECT id FROM personel_bilgi where cocuk_sayisi IN(2,3);

--3)Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
 
 SELECT isim from personel2 where sirket='Honda'
 INTERSECT
 SELECT isim from personel2 where sirket='Ford'
 INTERSECT
 SELECT isim from personel2 where sirket='Tofas';
 
 --EXCEPT(HARIC) OPERATOR
 
-- 1)5000’den az maas alip Honda’da calismayanlari yazdirin
 SELECT isim,sirket from personel2 where maas<5000
 EXCEPT
 SELECT isim,sirket from personel2 where sirket='Honda';

--2)Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerinivesehirlerinilisteleyin
SELECT isim,sehir from personel2 where isim='Mehmet Ozturk'
EXCEPT
SELECT isim,sehir from personel2 where sehir='Istanbul';



