# hash je komentar
# Sljedeću liniju bez početnog hash znaka izvesti u cmd
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\zavrsni\djecjivrtic\djecjivrtic.sql

drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    brojskupine int not null,
    brojdjece int,
    dobdjece int,
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
    telefon varchar(20),
    osoba int not null
);

# vanjski ključevi

alter table odgojnaskupina add foreign key (odgajateljica) references odgajateljica(sifra);
alter table dijete add foreign key (roditelj) references roditelj(sifra);
alter table dijete add foreign key (odgojnaskupina) references odgojnaskupina(sifra);
alter table dijete add foreign key (osoba) references osoba(sifra);
alter table odgajateljica add foreign key (osoba) references osoba(sifra);
alter table roditelj add foreign key (osoba) references osoba(sifra);

# unos podataka
insert into osoba (ime,prezime,dob,spol)
values ('Marica','Marić',35,'žensko');

insert into osoba (ime,prezime,dob,spol)
values ('Ivan','Ivić',5,'muško');

insert into osoba (ime,prezime,dob,spol)
values ('Pero','Perić',30,'muško');

insert into roditelj (brojugovora,telefon,osoba)
values ('343-23/2','092/2343 464',3);

insert into odgajateljica (oib,telefon,strucnasprema,iban,osoba)
values (12345678911,'091/1234 567','bac','HR2354554665654767',1);

insert into odgojnaskupina (brojskupine,brojdjece,dobdjece,odgajateljica)
values (1,23,4,1);

insert into dijete (roditelj,odgojnaskupina,osoba)
values (1,1,2);



