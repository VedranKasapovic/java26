# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Veky\Documents\GitHub\java26\salonzauljepsavanje.sql

drop database if exists salonzauljepsavanje;
create database salonzauljepsavanje;
use salonzauljepsavanje;

create table salon(
    naziv varchar(50),
    adresa varchar(50),
    djelatnica varchar(50)
);

create table osoba(
    ime varchar(50),
    prezime varchar(50),
    brojtelefona varchar(50)
);

create table djelatnica(
    osoba varchar(50),
    oib varchar(50),
    smjena varchar(50),
    iban varchar(50)
);

create table korisnik(
    osoba varchar(50),
    datumivrijeme varchar(50),
    usluga varchar(50),
    djelatnica varchar(50)
);

create table usluga(
    cijena varchar(50),
    naziv varchar(50),
    trajanje varchar(50)
);