# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Veky\Documents\GitHub\java26\muzej.sql

drop database if exists muzej;
create database muzej;
use muzej;

create table prostor(
    velicina varchar(50),
    naziv varchar(50),
    kustos varchar(50)
);

create table kustos(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    telefon varchar(50),
    prostor varchar(50)
);

create table djelo(
    naziv varchar(50),
    vrsta varchar(50),
    motiv varchar(50),
    cijena varchar(50),
    prostor varchar(50)
);