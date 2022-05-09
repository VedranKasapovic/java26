# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Veky\Documents\GitHub\java26\djecjivrtic.sql

drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

create table odgojnaskupina(
    brojskupine varchar(50),
    brojdjece varchar(50),
    dobdjece varchar(50),
    odgajateljica varchar(50)
);

create table osoba(
    ime varchar(50),
    prezime varchar(50),
    dob varchar(50),
    spol varchar(50)
);

create table dijete(
    roditelj varchar(50),
    odgojnaskupina varchar(50)
);

create table odgajateljica(
    oib varchar(50),
    telefon varchar(50),
    strucnasprema varchar(50),
    iban varchar(50)
);

create table roditelj(
    brojugovora varchar(50),
    telefon varchar(50)
);