# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\djecjivrtic.sql

drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    brojskupine int not null,
    brojdjece int,
    dobdjece decimal(2,2),
    odgajateljica int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(30) not null,
    dob int not null,
    spol varchar(20) not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    roditelj int not null,
    odgojnaskupina int not null,
    osoba int not null
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    oib char(11) not null,
    telefon varchar(20),
    strucnasprema varchar(20),
    iban varchar(50),
    osoba int not null
);

create table roditelj(
    sifra int not null primary key auto_increment,
    brojugovora varchar(20),
    telefon varchar(20)
);

# vanjski ključevi

alter table odgojnaskupina add foreign key (odgajateljica) references odgajateljica(sifra);
alter table dijete add foreign key (roditelj) references roditelj(sifra);
alter table dijete add foreign key (odgojnaskupina) references odgojnaskupina(sifra);
alter table dijete add foreign key (osoba) references osoba(sifra);
alter table odgajateljica add foreign key (osoba) references osoba(sifra);

