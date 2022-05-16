# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\taksisluzba.sql

drop database if exists taksisluzba;
create database taksisluzba;
use taksisluzba;

create table vozilo(
    sifra int not null primary key auto_increment,
    marka varchar(20) not null,
    model varchar(20) not null,
    registracija varchar(20) not null,
    maksimalnoklijenata int
);

create table klijent(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(50) not null,
    voznja int not null
);

create table voznja(
    sifra int not null primary key auto_increment,
    vozilo int not null,
    vozac int not null,
    cijena decimal(18,2)
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(50) not null,
    iban varchar(50) not null
);

alter table klijent add foreign key (voznja) references voznja(sifra);
alter table voznja add foreign key (vozilo) references vozilo(sifra);
alter table voznja add foreign key (vozac) references vozac(sifra);
