# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\muzej.sql

drop database if exists muzej;
create database muzej;
use muzej;

create table prostor(
    sifra int not null primary key auto_increment,
    velicina decimal(4,2),
    naziv varchar(50) not null
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(30) not null,
    oib char(11),
    telefon varchar(20),
    prostor int not null
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    vrsta varchar(50),
    motiv varchar(50),
    cijena decimal(18,2) not null,
    prostor int not null,
    kustos int not null
);

# vanjski ključevi

alter table kustos add foreign key (prostor) references prostor(sifra);
alter table djelo add foreign key (prostor) references prostor(sifra);
alter table djelo add foreign key (kustos) references kustos(sifra);


# podatci

insert into prostor (naziv,velicina)
values ('dvorana',15.2);

insert into kustos (ime,prezime,prostor)
values ('Perica','Perić',1);

insert into djelo (naziv,cijena,prostor,kustos)
values ('Sumrak',1579.20,1,1);