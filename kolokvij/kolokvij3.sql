# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\kolokvij\kolokvij3.sql

drop database if exists kolokvij3;
create database kolokvij3;
use kolokvij3;

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal (15,8),
    ogrlica int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno bit,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstrovertno bit not null
);

alter table svekar add foreign key (cura) references cura(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);

insert into ostavljena (modelnaocala)
values ('asd'),('sdf'),('ijk');

insert  into snasa (kuna,eura,ostavljena)
values (15.2,13.6,1),
(16.5,25,2),
(25.8,8,3);

insert into brat (ogrlica,ekstrovertno)
values (2,true),(1,false),(5,true);

insert into prijatelj (indiferentno)
values (true),(true),(false);

insert into prijatelj_brat (prijatelj,brat)
values (1,1),(2,2),(3,3);


insert into cura (ogrlica)
values (2),(3),(4);

insert into svekar (novcica,suknja,narukvica,cura)
values (12.3,'bdf',3,1),(34.2,'sfsfaa',4,2),(421,'fdbr',5,3);


update svekar set suknja='Osijek';

delete from punica where kratkamajica = 'AB';

select majica from ostavljena where lipa !=9 or 10 or 20 or 30 or 35;

select a.ekstrovertno , f.vesta , e.kuna 
from brat a 
inner join prijatelj_brat b on b.brat=a.sifra 
inner join prijatelj c on b.prijatelj=c.sifra 
inner join ostavljena d on d.prijatelj=c.sifra 
inner join snasa e on e.ostavljena=d.sifra 
inner join punica f on f.snasa=e.sifra
where d.lipa!=91 and c.haljina like '%b%a%'
order by e.kuna asc;



select a.haljina, a.lipa from prijatelj a 
left join prijatelj_brat b  on b.prijatelj=a.sifra 
where b.sifra is null;