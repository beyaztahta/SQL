--Subquery--Nested query ---ALT SORGU-İÇ İÇE SORGU

CREATE TABLE ogrenci
(  
  id int, 
  isim varchar(50), 
  sehir varchar(50), 
  puan int,
  bolum varchar(20)
);

INSERT INTO ogrenci VALUES(100, 'Ahmet Ümit', 'İstanbul', 546, 'Bilgisayar Müh.');
INSERT INTO ogrenci VALUES(101, 'R.Nuri Güntekin', 'Antalya', 486, 'İşletme');
INSERT INTO ogrenci VALUES(102, 'S.Faik Abasıyanık', 'Bursa', 554, 'Bilgisayar Müh.');
INSERT INTO ogrenci VALUES(103, 'Yaşar Kemal', 'İstanbul', 501, 'Matematik');
INSERT INTO ogrenci VALUES(104, 'Halide E. Adıvar', 'İzmir', 473, 'Psikoloji');
INSERT INTO ogrenci VALUES(105, 'Nazan Bekiroğlu', 'İzmir', 432, 'Edebiyat');
INSERT INTO ogrenci VALUES(106, 'Peyami Safa', 'Antalya', 535, 'Bilgisayar Müh.');
INSERT INTO ogrenci VALUES(107, 'Sabahattin Ali', 'İstanbul', 492, 'Matematik');

CREATE TABLE bolumler 
(  
  bolum_id int, 
  bolum varchar(20),
  taban_puani int,
  kampus varchar(20)
);

INSERT INTO bolumler VALUES(5001, 'Bilgisayar Müh.', 521,'Kuzey');
INSERT INTO bolumler VALUES(5002, 'Matematik', 455,'Güney');
INSERT INTO bolumler VALUES(5003, 'Psikoloji', 440,'Hisar');
INSERT INTO bolumler VALUES(5004, 'İşletme', 465,'Hisar');
INSERT INTO bolumler VALUES(5005, 'Edebiyat', 420,'Kuzey');


--1)Puanı, taban puanı en yüksek olan bölümün puanından yüksek olan öğrencilerin isim ve sehirlerini 
--listeleyiniz.
select isim,sehir from ogrenci where puanı>select max(taban_puani)from bolumler;

--2)Taban puanı 460 dan az olan bölümlerdeki öğrencilerin isimlerini 
--ve bölümlerini listeleyiniz.

select isim,bolum where bolum IN(select bolum from bolumler where taban_puani<460);

--3)İstanbulda yaşayan öğrencilerin bölümlerini ve 
--taban puanlarını listeleyiniz.

select bolum,taban_puani from bolumler where bolum IN ( select bolum from ogrenci where sehir='İstanbul');

--4)Kuzey kampüsündeki bölümlerde okuyan öğrencilerin isimlerini, 
--bölümlerini ve puanlarını listeleyiniz.

select isim,bolum,puan from ogrenci where bolum In(select bolum from bolumler where kampus='Kuzey'); 

--5)Puanı 500 den büyük olan öğrencilerin bölümlerinin 
--adını ve kampüslerini listeleyiniz.

select bolum,kampus from bolumler where bolum in(select bolum from ogrenci where puan>500);

--6)Puanı taban puanlarının ortalamasından yüksek olan öğrencilerin isim ve puanlarını 
--listeleyiniz.--max ve min den dusuk olanları bulun
select isim,puan from ogrenci where puan>(select avg(taban_puani)from bolumler);

--7) Taban puanı öğrencilerin puan ortalamasından düşük olan
   --ve hisar kampüsünde olan bölümleri listeleyiniz.

select * from bolumler where  taban_puani<(select avg(puan)from ogrenci)
And kampus='Hisar';

--8)Bölüm isimlerini, kampüslerini ve 
--her bölümde okuyan öğrencilerin en yüksek puanlarını listeleyiniz.
 select bolum,kampus,(select max(puan)from ogrenci where bolumler.bolum=ogrenci.bolum)as max_puan
 from bolumler 
 
 --9) Her bölümün ismini ve bölümde okuyan öğrencilerin kaç farklı şehirden geldiğini listeleyiniz.   
select bolum,(select count(sehir)from ogrenci where bolumler.bolum=ogrenci.bolum)from bolumler


















