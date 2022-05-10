# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\frizerskisalon.sql

drop database if exists frizerskisalon;
create database frizerskisalon;
use frizerskisalon;

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
    djelatnica int not null,
    salon int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2) not null,
    naziv varchar(50) not null,
    trajanje int null
);

# vanjski ključevi
alter table salon add foreign key (djelatnica) references djelatnica(sifra);

alter table djelatnica add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (usluga) references usluga(sifra);
alter table korisnik add  foreign key (salon) references salon(sifra);

# podatci
insert into salon (naziv,adresa)
values ('drugi','Osijek');

insert into osoba (ime,prezime,brojtelefona)
values ('Marko','Marulić','09123456789');

insert into osoba (ime,prezime)
values ('Pero','Perić');

insert into djelatnica (osoba,oib)
values (1,00345678910);

insert into usluga (naziv,cijena)
values ('šišanje',49.99);

insert into korisnik (osoba,usluga,djelatnica,salon)
values (2,1,1,1);
