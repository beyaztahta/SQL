/*
a)Yukarda verilen “personel” tablosunuolusturun
b)Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerinilisteleyin
c)Iscilerin tum bilgilerinilisteleyin
d)Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarinilisteleyin
e)Maasi 5000’den cok olanlarin emailve is baslama tarihlerinilisteleyin
f)Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerinilisteleyin
*/
DROP table if exists personel;
CREATE TABLE personel
(
id char(15),
isim varchar(30),
soyisim varchar(30),
email varchar(40),
ise_baslama_tarihi date,
is_unvanı varchar(25),
maas int	
);

INSERT INTO personel VALUES('123456789','Ali','Can','alican@gmail.com','10-APR-10','isci',4000);
INSERT INTO personel VALUES('123456789','Veli','Cem','velicem@gmail.com','10-JAN-12','isci',4500);
INSERT INTO personel VALUES('123456789','Ayse','Gul','aysegul@gmail.com','01-May-14','muhasebeci',6000);
INSERT INTO personel VALUES('123456789','Fatma','Yasa','fatmayasa@gmail.com','10-APR-09','muhendis',7500);

select * from personel;
select isim,is_unvanı,maas from personel;

select isim,soyisim from personel where  maas<5000 or is_unvanı='isci';

select * from personel where is_unvanı='isci';

select is_unvanı,maas from personel where soyisim IN ('Can','Cem','Gul');

select email,ise_baslama_tarihi from personel where maas>5000;

select * from personel where maas>5000 or maas<7000;


select id as kimli_no,  isim|| ' '||soyisim as ad_soyad from personel;

select id as kimilk_no, is_unvanı||'-'|| maas as meslek_maas from personel;



