# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\salonzauljepsavanje.sql

drop database if exists salonzauljepsavanje;
create database salonzauljepsavanje;
use salonzauljepsavanje;

create table salon(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50),
    djelatnica int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(30) not null,
    brojtelefona varchar(20)
);

create table djelatnica(
    sifra int not null primary key auto_increment,
    osoba int not null,
    oib char(11),
    smjena int null,
    iban varchar(50)
);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    datumivrijeme datetime,
    usluga int not null,
    djelatnica int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2) not null,
    naziv varchar(50) not null,
    trajanje int null
);

# definiranje vanjskih ključeva
alter table salon add foreign key (djelatnica) references djelatnica(sifra);
alter table djelatnica add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (usluga) references usluga(sifra);

# unos podataka
insert into salon (naziv,adresa)
values ('prvi','Osijek');

insert into osoba (ime,prezime,brojtelefona)
values ('Marija','Marić','091/234 5678');

insert into osoba (ime,prezime,brojtelefona)
values ('Ana','Anić','098/123 4567');

insert into djelatnica (oib,smjena,osoba)
values (012345678912,2,1);

insert into usluga (cijena,naziv,trajanje)
values (50,'pedikura',60);

insert into korisnik (osoba,usluga,djelatnica)
values (2,1,1);


