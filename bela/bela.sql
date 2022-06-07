# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\bela\bela.sql

drop database if exists bela;
create database bela;
use bela;

create table mjesanje(
    id int not null primary key auto_increment,
    vrsta varchar(50) not null,
    belot int not null,
    datumunosa datetime,
    stiglja int not null,
    bodovadrugiunos int,
    bodovaprviunos int,
    zvanjeprviunos int,
    bodovatreciunos int,
    zvanjetreciunos int,
    partija int not null
);

create table partija_igrac(
    partija int not null,
    igrac int not null
);

create table partija(
    id int not null primary key auto_increment,
    vrsta varchar(50) not null,
    dokolikoseigra int,
    lokacija int,
    unosi int
);

create table igrac(
    id int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    spol int not null,
    urlslika varchar(100)
);

create table lokacija(
    id int not null primary key auto_increment,
    latitude int not null,
    longitude int not null,
    naziv varchar(50)
);

# ključevi
alter table mjesanje add foreign key (partija) references partija(id);
alter table partija_igrac add foreign key (partija) references partija(id);
alter table partija_igrac add foreign key (igrac) references igrac(id);
alter table partija add foreign key (lokacija) references lokacija(id);
alter table partija add foreign key (unosi) references igrac(id);

# unosi
INSERT INTO igrac
(ime, prezime, spol)
VALUES('Pero','Perić', 1),
('Ivan','Ivić', 1),
('Pero','Perić', 1),
('Marko','Marić', 1),
('Antun','Antunović', 1),
('Ivana','Ivić', 2),
('Ana','Anić', 2),
('Marija','Marić', 2),
('Petra','Perić', 2);


INSERT INTO lokacija
(latitude, longitude, naziv)
VALUES(45.554962, 18.695514, 'Osijek');

INSERT INTO partija
(vrsta, dokolikoseigra, lokacija, unosi)
VALUES('301', 301, 1, 1),('501',501,1,2);

INSERT INTO mjesanje
(vrsta, belot, datumunosa, stiglja, partija)
VALUES('301', 0, '2022-06-08', 0, 1);


INSERT INTO partija_igrac
(partija, igrac)
VALUES(1, 1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4);
