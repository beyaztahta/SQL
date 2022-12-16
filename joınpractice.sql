create table filmler
(
film_id int,
film_name varchar(30),
category varchar(30)
);
insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');

create table aktorler
(
id int,
actor_name varchar(30),
film_id int
);
insert into aktorler values (1, 'Ata Demirer', 1);
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);

-- SORU1: Tüm film_name'leri, category'lerini ve filimlerde oynayan actor_name'leri listeleyiniz.burada esas tablo filmler 
--1.yol left join
SELECT film_name,category,actor_name from filmler AS A
LEFT JOIN aktorler AS B
ON  A.film_id=B.film_id;

--2.yol right join
SELECT film_name,category,actor_name from filmler AS A
RIGHT JOIN aktorler AS B
ON  A.film_id=B.film_id;

-- SORU2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.
select actor_name,film_name from aktorler 
LEFT JOIN filmler  ON filmler.film_id=aktorler.film_id;

select actor_name,film_name from aktorler
RIGHT JOIN filmler On filmler.film_id=aktorler.film_id;

create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);

create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

--SORU4: join kullanarak qa_dersleri ve developer_dersleri benzersiz sorgula
select A.ders_id, A.ders_ismi,A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_ismi=B.ders_ismi
union
select B.ders_id, B.ders_ismi,B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_ismi=B.ders_ismi;

select A.ders_id,A.ders_ismi,A.ders_saati from qa_dersler AS A
left join developer_dersler AS B on A.ders_ismi=B.ders_ismi
union
select B.ders_id,B.ders_ismi,B.ders_saati from qa_dersler AS A
right join developer_dersler AS B on A.ders_ismi=B.ders_ismi;

