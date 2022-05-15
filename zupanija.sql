# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Veky\Documents\GitHub\java26\zupanija.sql

drop database if exists zupanija;
create database zupanija;
use zupanija;

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupan varchar(50) not null
);

create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(50) not null
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);

insert into zupanija (naziv,zupan)
values ('Osiječko-baranjska županija', 'Ivan Anušić');

insert into zupanija (naziv,zupan)
values ('Brodsko-posavska županija','Danijel Marušić');

insert into zupanija (naziv,zupan)
values ('Zagrebačka županija','Stjepan Kožić');

insert into opcina (zupanija,naziv)
values (3,'Bistra');
insert into opcina (zupanija,naziv)
values (3,'Klinča sela');

insert into opcina (zupanija,naziv)
values (2,'Davor');
insert into opcina (zupanija,naziv)
values (2,'Donji Andrijevci');

insert into opcina (zupanija,naziv)
values (1,'Antunovac');
insert into opcina (zupanija,naziv)
values (1,'Darda');