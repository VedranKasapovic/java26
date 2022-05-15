# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\hijerarhija.sql

drop database if exists hijerarhija;
create database hijerarhija;
use hijerarhija;

create table zaposlenik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    placa decimal(18,2) not null,
    nadredjeni int not null
);

alter table zaposlenik add foreign key (nadredjeni) references zaposlenik(sifra);

insert into zaposlenik(ime,prezime,placa,nadredjeni)
values ('Pero','Perić',7000,1);

insert into zaposlenik(ime,prezime,placa,nadredjeni)
values ('Marija','Marić',7500,1);