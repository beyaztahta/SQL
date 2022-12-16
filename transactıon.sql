---------------TRANSACTION(Begin,Savepoint,rollback,commit)------------------------
/*
Transaction veritabani sistemlerinde bir islem basladiginda baslar ve bitince sona erer. Bu
islemler veritabani olusturma, veri silme, veri guncelleme, veriyi geri getirme gibi islemler olabilir.

NOT :PostgreSQL de Transaction kullanımı için «Begin;» komutuyla başlarız sonrasında tekrar
yanlış bir veriyi düzeltmek veya bizim için önemli olan verilerden
sonra ekleme yapabilmek için "SAVEPOINT savepointismi" komutunu
kullanırız ve bu savepointe dönebilmek için "ROLLBACK TO savepointismi" komutunu
kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki
verileri tabloda bize verir ve son olarak Transaction'ı sonlandırmak için mutlaka
"COMMIT" komutu kullanılır.
*/
--serial data turu otomatik olarak 1 den baslyarak sıralı olarak sayı ataması yapar ve 
--insert into ile veri eklerken  serial data turunu kullandigim veri degeri yerine DEFAULT yazariz
CREATE TABLE ogrenci1
(
id serial,        
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenci1 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenci1 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenci1 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenci1 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenci1 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenci1 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to x;
COMMIT;

select * from ogrenci1;
delete from ogrenci1;
drop table ogrenci1;

