# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\kolokvij\kolokvij2.sql

drop database if exists kolokvij2;
create database kolokvij2;
use kolokvij2;

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43),
    lipa decimal(16,8),
    modelnaocala varchar(49)not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstrovertno bit not null,
    prviputa datetime,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

#zadatak 1
insert into neprijatelj (modelnaocala,kuna)
values 
('lenonke',15.4),
('police',34.2),
('avijatorke',345.5);

insert into decko (asocijalno)
values
(true),
(false),
(true);

insert into cura (haljina,drugiputa,majica,decko)
values
('xs','2022-12-1','s',1),
('s','2021-1-30','m',2),
('xs','2020-5-15','s',3);

insert into zarucnica (bojakose,lipa,indiferentno)
values
('smeđa',23.45,false),
('plava',890.3,true),
('crna',345,true);

insert into decko_zarucnica (decko,zarucnica)
values
(1,1),
(2,2),
(3,3);

# zadatak 2

insert into svekar (ogrlica,asocijalno)
values
(11,true),
(14,true),
(5,false);

insert into prijatelj (treciputa,ekstrovertno,svekar)
values
('2022-11-15',false,1),
('2022-01-22',true,2),
('2022-06-01',false,3);
update prijatelj set treciputa='2020-04-30';

# zadatak 3
insert into brat (ogrlica, asocijalno, neprijatelj)
values 
(11, true, 1),
(14, false, 1),
(37, false, 2);

delete from brat where ogrlica <>14;

# zadatak 4
select suknja from cura where drugiputa is null;

#zadatak 5
select a.novcica, f.neprijatelj, e.haljina
from zarucnica a
inner join decko_zarucnica b on b.zarucnica=a.sifra 
inner join decko c on b.decko=c.sifra
inner join cura d on d.decko=c.sifra 
inner join neprijatelj e on e.cura=d.sifra 
inner join brat f on f.neprijatelj=e.sifra 
where d.drugiputa !=null and c.vesta like '%b%a%'
order by e.haljina desc;

# zadatak 6

select a.vesta, a.asocijalno 
from decko a
inner join decko_zarucnica b on b.decko=a.sifra 
where b.decko is null;