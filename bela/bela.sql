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

alter table mjesanje add foreign key (partija) references partija(id);
alter table partija_igrac add foreign key (partija) references partija(id);
alter table partija_igrac add foreign key (igrac) references igrac(id);
alter table partija add foreign key (lokacija) references lokacija(id);
alter table partija add foreign key (unosi) references igrac(id);


