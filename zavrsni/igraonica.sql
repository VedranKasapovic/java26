#
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\zavrsni\igraonica.sql

drop database if exists igraonica;
create database igraonica;
use igraonica;

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(50) not null,
    datumrodjenja datetime not null,
    posjeta int not null,
    igraonica int not null
);

create table posjeta(
    sifra int not null primary key auto_increment,
    dijete int not null,
    ormaric int null,
    placeno boolean,
    placenodo datetime,
    vrijemedolaska datetime not null,
    vrijemeodlaska datetime null,
    roditeljskapratnja boolean,
    gratis boolean,
    rodjendan int null,
    djelatnica int not null
);

create table dijeteodgovorni(
    dijete int not null,
    odgovornaosoba int not null
);

create table odgovornaosoba(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(50) not null,
    rod varchar(20) not null,
    telefon varchar(20) null,
    email varchar(50) null
);


create table djelatnica (
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(50) not null,
    telefon varchar(20) not null,
    smjena int null,
    iban varchar(50) not null,
    igraonica int null
);

create table rodjendan(
    sifra int not null primary key auto_increment,
    odgovornaosoba int not null,
    ugovorenodjece int not null,
    naknadnodjece int null,
    akontacija decimal (18,2) not null,
    ukupnacijena decimal (18,2) not null,
    vrijemepocetka datetime not null
);

alter table dijeteodgovorni add foreign key (dijete) references dijete(sifra);
alter table dijeteodgovorni add foreign key (odgovornaosoba) references odgovornaosoba(sifra);
alter table posjeta add foreign key (djelatnica) references djelatnica(sifra);
alter table dijete add foreign key (posjeta) references posjeta(sifra);
alter table posjeta add foreign key (rodjendan) references rodjendan(sifra);
alter table rodjendan add foreign key (odgovornaosoba) references odgovornaosoba(sifra);