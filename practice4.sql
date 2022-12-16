create table arac(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
);
insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

--SORU1: arac tablosundaki en yüksek fiyat'ı listele

select max(fiyat)from arac;

--SORU2: arac tablosundaki fiyatların toplamını listele
select sum(fiyat)from arac;

--SORU3: arac tablosundaki fiyat ortalamalarını listele
select avg(fiyat)from arac;
select round(avg(fiyat))from arac;
select round(avg(fiyat),2)from arac;
--SORU4: arac tablosunda kaç tane araç oldugunu listele
select count(id)from arac;


CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
		
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');

select * from meslekler;

-- SORU1: meslekler tablosunu isim'e göre sıralayarak sorgulayınız.
select * from meslekler ORDER BY isim;

-- SORU2: meslekler tablosunda maas'i buyukten kucuge siralayiniz
 select * from meslekler order by maas desc;

-- SORU3: meslekler tablosunda isim'i 'Ali' olanları, maas'a göre büyükten küçüge sıralayarak sorgulayınız
select * from meslekler where isim='Ali' order by maas desc;

-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları, maas sıralı olarak sorgulayınız.
select * from meslekler where soyisim='Bulut'ORDER BY maas;

-- SORU5: meslekler tablosunda id degeri 5 den büyük olan,ilk 2 veriyi listeleyiniz
select * from meslekler where id>5 limit 2;

-- SORU6: meslekler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz
select * from meslekler order by maas desc limit 3;

-- SORU7: meslekler tablosunda ilk 2 veriden sonra 5 veriyi getirin
select * from maslekler offset 2 limit 5; --offset atla demektir, ilk iki veriyi atla dedik.

-- SORU8: meslekler tablosunda en yüksek maaşı alan 4. 5. 6. kişilerin bilgilerini listele
select * from meslekler order by maas desc offset 3 limit 3;




