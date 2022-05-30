# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\kolokvij\kolokvij1.sqlC:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\kolokvij\kolokvij1.sql

drop database if exists kolokvij1;
create database kolokvij1;
use kolokvij1;

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno boolean null,
    haljina varchar(31) not null,
    maraka decimal(16,6)null,
    hlace varchar(46) not null,
    narukvica int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31)not null,
    jmbag char(11)not null,
    bojaociju varchar(39) not null,
    haljina varchar(44) null,
    sestra int not null
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno boolean,
    ekstrovertno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table zena add foreign key (sestra) references sestra(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table cura add foreign key (punac) references punac(sifra);

# 1. zadatak
# zena sestra_svekar
insert into sestra (haljina,hlace,narukvica)
values 
('s','traperice',2),
('l','tajice',1),
('xs','kratke',3);

insert into zena (kratkamajica,jmbag,bojaociju,sestra)
values 
('xl',12345678901,'plava',1),
('xs',23456789012,'zelena',2),
('s',34567890123,'smeđa',3);

insert into muskarac (bojaociju,maraka,zena)
values 
('plava',145,1), 
('smeđa',234,2), 
('plavo-zelena',35.4,3);

insert into svekar (bojaociju,prstena)
values
('plava',1),
('zelena',2),
('smeđa',3);

insert into sestra_svekar (sestra,svekar)
values
(1,1),
(2,2),
(3,3);

# 2 zadatak
insert into cura (novcica,gustoca,ogrlica)
values
(14.2,24,6),
(32,35,9),
(16,6,2);

update cura set gustoca=15.77;

# 3 zadatak


insert into mladic(suknja,kuna,ekstrovertno,dukserica)
values 
('xl', 15.30,false,'l'),
('l', 17.20,true,'l'),
('m', 16.99,false,'m');

delete from mladic where kuna>15.78;

# 4 zadatak

select kratkamajica from zena where hlace like '%a%n%a%';

# 5 zadatak

select a.dukserica, f.asocijalno, e.hlace
from svekar a 
inner join sestra_svekar b on b.svekar=a.sifra
inner join sestra c on c.sifra=b.sestra
inner join zena d on d.sestra=c.sifra 
inner join muskarac e on e.zena=d.sifra 
inner join mladic f on f.muskarac=e.sifra
where d.hlace like 'a%' and c.haljina like '%b%a%'
order by e.hlace desc;

# 6 zadatak
select a.haljina, a.maraka from sestra a
inner join sestra_svekar b on a.sifra=b.sestra
where b.sifra is null; 
