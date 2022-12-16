
CREATE TABLE family_members
(
id int,
name varchar (15),
gender varchar (15),
species varchar(15),
num_books_read int	
);
delete from family_members;
select * from family_members
insert into family_members Values(1,'Dave','male','human',200);
insert into family_members Values(2,'Mary','female','human',180);
insert into family_members Values(3,'Pickes','male','dog',0);

--1) tum verileri tek bir tabloda gosteren query i yazın
 select * from family_members;
 
--2)name and species sutunlarını gosteren query i yazınız.
 select name,species from family_members;
 
--3)dog a ait tum satirlari donduren query i yazın.
 select * from family_members where name='Pickes';
 
--4)num_books_read degeri 190 dan buyuk olan aile uyelerıne aiıt tum satırları donduren query i yazınız.
select * from family_members where num_books_read>190;

CREATE TABLE character
(
id int,
name varchar(30)	
);
insert into character values(1,'Doogie Howser');
insert into character values(2,'Bamey Stinson');
insert into character values(3,'Lily Aldrin');
insert into character values(4,'Wilwow Rosenberg');

CREATE TABLE charcter_tv_show
(
id int,
character_id int,
tv_show_name varchar (60)	
);
insert into charcter_tv_show values(1,4,'buffy the vampire slayer');
insert into charcter_tv_show values(2,3,'how I met your mother');
insert into charcter_tv_show values(3,2,'how I met your mother');
insert into charcter_tv_show values(4,1,'doggie howser m.d.');

CREATE TABLE charcter_actor
(
id int ,
character_id int,
actor_name varchar (30)	
);

insert into charcter_actor values(1,4,'Alyson Hannigan');
insert into charcter_actor values(2,3,'Alyson Hannigan');
insert into charcter_actor values(3,2,'Nell Patrick Harris');
insert into charcter_actor values(4,1,'Nell Patrick Harris');

select * from character;
select * from charcter_tv_show ;
select * from charcter_actor;

--5)Her character adını, onları oynayan actor ile eslestirmek icin inner join kullanarak query i yazınız.

select character.name,charcter_actor.actor_name 
from character INNER JOIN charcter_actor
ON character.id=charcter_actor.character_id;



















