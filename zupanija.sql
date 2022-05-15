# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\zupanija.sql

drop database if exists zupanija;
create database zupanija;
use zupanija;

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupan int not null
);

create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(50) not null
);

create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table mjesto(
    sifra int not null primary key auto_increment,
    opcina int not null,
    naziv varchar(50)
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table zupanija add foreign key (zupan) references zupan(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);

insert into zupan (ime,prezime)
values ('Ivan','Anušić');
insert into zupan (ime,prezime)
values ('Danijel','Marušić');
insert into zupan (ime,prezime)
values ('Stjepan','Kožić');

insert into zupanija (naziv,zupan)
values ('Osiječko-baranjska županija', 1);

insert into zupanija (naziv,zupan)
values ('Brodsko-posavska županija',2);

insert into zupanija (naziv,zupan)
values ('Zagrebačka županija',3);

insert into opcina (zupanija,naziv)
values (3,'Bistra');
insert into opcina (zupanija,naziv)
values (3,'Klinča sela');
insert into opcina (zupanija,naziv)
values (1,'Valpovo');
insert into opcina (zupanija,naziv)
values (1,'Belišće');
insert into opcina (zupanija,naziv)
values (2,'Davor');
insert into opcina (zupanija,naziv)
values (2,'Donji Andrijevci');

insert into opcina (zupanija,naziv)
values (1,'Antunovac');
insert into opcina (zupanija,naziv)
values (1,'Darda');

insert into mjesto (opcina,naziv)
values (1,'Donja Bistra');
insert into mjesto (opcina,naziv)
values (1,'Gornja Bistra');

insert into mjesto (opcina,naziv)
values (2,'Donja Zdenčina');
insert into mjesto (opcina,naziv)
values (2,'Goli Vrh');

insert into mjesto (opcina,naziv)
values (5,'Davor');
insert into mjesto (opcina,naziv)
values (5,'Orubica');

insert into mjesto (opcina,naziv)
values (6,'Novo Topolje');
insert into mjesto (opcina,naziv)
values (6,'Sredanci');

insert into mjesto (opcina,naziv)
values (7,'Antunovac');
insert into mjesto (opcina,naziv)
values (7,'Ivanovac');

insert into mjesto (opcina,naziv)
values (8,'Švajcarnica');
insert into mjesto (opcina,naziv)
values (8,'Uglješ');

# promjena podataka u tablici mjesto
update mjesto set naziv='GOLI VRH' where sifra=4;
update mjesto set naziv='ORUBICA' where sifra=6;
update mjesto set naziv='SREDANCI' where sifra=8;
update mjesto set naziv='IVANOVAC' where sifra=10;
update mjesto set naziv='UGLJEŠ' where sifra=12;

# brisanje redova iz tablice opcina
delete from opcina where sifra=3;
delete from opcina where sifra=4;

