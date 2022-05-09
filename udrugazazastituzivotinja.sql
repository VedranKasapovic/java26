# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Veky\Documents\GitHub\java26\udrugazazastituzivotinja.sql

drop database if exists udrugazazastituzivotinja;
create database udrugazazastituzivotinja;
use udrugazazastituzivotinja;

create table timaritelj(
    ime varchar(50),
    prezime varchar(50),
    specijalizacija varchar(50),
    oib varchar(50),
    telefon varchar(50),
    spol varchar(50)
);

create table zivotinja(
    vrsta varchar(50),
    starost varchar(50),
    staniste varchar(50),
    timaritelj varchar(50),
    prehrana varchar(50),
    prostor varchar(50)
);

create table prostor(
    velicina varchar(50),
    tip varchar(50),
    grijanje varchar(50)
);