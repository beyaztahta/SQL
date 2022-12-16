Create table ogretmenler
(
kimlik_no char(11),
isim varchar(25),
brans varchar(50),
cinsiyet char(5)
);
INSERT INTO ogretmenler  VALUES ('123456','Ayse GULER','matematik','kadın');

INSERT INTO ogretmenler (kimlik_no,isim)VALUES(567597624,'ALİ Veli');

SELECT * FROM ogretmenler;