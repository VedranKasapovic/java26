# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\firma.sql

drop database if exists firma;
create database firma;
use firma;

create table projekt(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2) not null
);

create table sudjeluje(
    projekt int not null,
    programer int not null,
    datumpocetka datetime not null,
    datumkraja datetime not null
);

create table programer(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodjenja datetime not null,
    placa decimal (18,2) not null
);

alter table sudjeluje add foreign key (projekt) references projekt(sifra);
alter table sudjeluje add foreign key (programer) references programer(sifra);


insert into programer (ime,prezime,datumrodjenja,placa)
values ('Marko','Marulić',1983-09-12,8500.30);
insert into programer (ime,prezime,datumrodjenja,placa)
values ('Pero','Perić',1985-05-01,8028.70);

insert into projekt (naziv,cijena)
values ('Izračun pdv',43000);
insert into projekt (naziv,cijena)
values ('Izrada servera',74000);

insert into sudjeluje (projekt,programer,datumpocetka,datumkraja)
values (1,1,2020-05-15,2020-08-08);
insert into sudjeluje (projekt,programer,datumpocetka,datumkraja)
values (2,2,2020-05-15,2020-09-18);
insert into sudjeluje (projekt,programer,datumpocetka,datumkraja)
values (1,2,2020-05-15,2020-09-18);
