# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Veky\Documents\GitHub\java26\bela\bela.sql

drop database if exists bela;
create database bela;
use bela;

create table mjesanje(
    id int not null primary key auto_increment,
    vrsta varchar(50) not null,
    belot int not null,
    datumunosa datetime,
    stiglja int not null,
    bodovadrugiunos int,
    bodovaprviunos int,
    zvanjeprviunos int,
    bodovatreciunos int,
    zvanjetreciunos int,
    partija int not null
);

create table partija_igrac(
    partija int not null,
    igrac int not null
);

create table partija(
    id int not null primary key auto_increment,
    vrsta varchar(50) not null,
    dokolikoseigra int,
    lokacija int,
    unosi int
);

create table igrac(
    id int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    spol int not null,
    urlslika varchar(100)
);

create table lokacija(
    id int not null primary key auto_increment,
    latitude decimal(9,8) not null,
    longitude decimal(9,8) not null,
    naziv varchar(50)
);

# ključevi
alter table mjesanje add foreign key (partija) references partija(id);
alter table partija_igrac add foreign key (partija) references partija(id);
alter table partija_igrac add foreign key (igrac) references igrac(id);
alter table partija add foreign key (lokacija) references lokacija(id);
alter table partija add foreign key (unosi) references igrac(id);

# unosi
INSERT INTO igrac
(ime, prezime, spol)
VALUES('Pero','Perić', 1),
('Ivan','Ivić', 1),
('Pero','Perić', 1),
('Marko','Marić', 1),
('Antun','Antunović', 1),
('Ivana','Ivić', 2),
('Ana','Anić', 2),
('Marija','Marić', 2),
('Petra','Perić', 2);


INSERT INTO lokacija
(naziv, latitude, longitude)
VALUES('Bakar',45.1825,14.3202),
('Beli Manastir',45.4622,18.3638),
('Belišće',45.4102,18.2407),
('Benkovac',44.0148,15.3636),
('Biograd na Moru',43.5613,15.2638),
('Bjelovar',45.5436,16.5024),
('Buje',45.2429,13.3932),
('Buzet',45.2429,13.5754),
('Cres',44.5740,14.2429),
('Crikvenica',45.1019,14.4133),
('Čabar',45.3538,14.3849),
('Čakovec',46.2324,16.2512),
('Čazma',45.4456,16.3647),
('Daruvar',45.3534,17.1325),
('Delnice',45.2400,14.4800),
('Donja Stubica',45.5848,15.5823),
('Donji Miholjac',45.4543,18.0954),
('Drniš',43.5136,16.0922),
('Dubrovnik',42.3903,18.0649),
('Duga Resa',45.2642,15.3011),
('Dugo Selo',45.4822,16.1417),
('Đakovo',45.1836,18.2436),
('Đurđevac',46.0224,17.0416),
('Garešnica',45.3426,16.5628),
('Glina',45.2017,16.0527),
('Gospić',44.3224,15.2212),
('Grubišno Polje',45.4207,17.1019),
('Hrvatska Kostajnica',45.1341,16.3224),
('Hvar',43.0914,16.3911),
('Ilok',45.1319,19.2230),
('Imotski',43.2700,17.1312),
('Ivanec',46.1344,16.0737),
('Ivanić-Grad',45.4225,16.2346),
('Jastrebarsko',45.4019,15.3904),
('Karlovac',45.2900,15.3300),
('Kastav',45.2219,14.2060),
('Kaštela',43.3260,16.2259),
('Klanjec',46.0304,15.4438),
('Knin',44.0224,16.1200),
('Komiža',43.0238,16.0531),
('Koprivnica',46.0936,16.4948),
('Korčula',42.5548,16.5320),
('Kraljevica',45.1630,14.3419),
('Krapina',46.0936,15.5212),
('Križevci',46.0112,16.3224),
('Krk',45.0148,14.3448),
('Kutina',45.2845,16.4634),
('Kutjevo',45.2534,17.5259),
('Labin',45.0531,14.0726),
('Lepoglava',46.1225,16.0238),
('Lipik',45.2450,17.0940),
('Ludbreg',46.1511,16.3658),
('Makarska',43.1735,17.0112),
('MaliLošinj',44.3200,14.2800),
('Metković',43.0300,17.3748),
('Mursko Središće',46.3047,16.2620),
('Našice',45.2942,18.0542),
('Nin',44.1431,15.1102),
('Nova Gradiška',45.1529,17.2302),
('Novalja',44.3322,14.5306),
('NoviMarof',46.1001,16.2006),
('NoviVinodolski',45.0742,14.4723),
('Novigrad',45.1858,13.3343),
('Novska',45.2024,16.5844),
('Obrovac',44.1204,15.4052),
('Ogulin',45.1612,15.1348),
('Omiš',43.2635,16.4135),
('Opatija',45.2017,14.1818),
('Opuzen',43.0101,17.3350),
('Orahovica',45.3144,17.5248),
('Oroslavje',45.5949,15.5458),
('Osijek',45.3344,18.4200),
('Otok',45.0846,18.5302),
('Otočac',44.5212,15.1429),
('Ozalj',45.3647,15.2841),
('Pag',44.2624,15.0300),
('Pakrac',45.2620,17.1131),
('Pazin',45.1424,13.5624),
('Petrinja',45.2624,16.1702),
('Pleternica',45.1710,17.4807),
('Ploče',43.0300,17.2548),
('Popovača',45.3416,16.3737),
('Poreč',45.1337,13.3542),
('Požega',45.1948,17.4012),
('Pregrada',46.0954,15.4504),
('Prelog',46.2013,16.3654),
('Pula',44.5149,13.5044),
('Rab',44.4536,14.4612),
('Rijeka',45.1938,14.2644),
('Rovinj',45.0452,13.3820),
('Samobor',45.4804,15.4240),
('Senj',44.5924,14.5436),
('Sinj',43.4200,16.3748),
('Sisak',45.2848,16.2136),
('Skradin',43.4905,15.5523),
('Slatina',45.4200,17.4236),
('Slavonski Brod',45.0936,18.0036),
('Slunj',45.0636,15.3524),
('Solin',43.3231,16.2931),
('Split',43.3029,16.2640),
('Stari Grad',43.1102,16.3556),
('Supetar',43.2259,16.3322),
('Sveta Nedelja',45.4749,15.4634),
('Sveti Ivan Zelina',45.5736,16.1435),
('Šibenik',43.4413,15.5335),
('Trilj',43.3708,16.4326),
('Trogir',43.3058,16.1500),
('Umag',45.2613,13.3134),
('Valpovo',45.3932,18.2454),
('Varaždin',46.1829,16.2033),
('Varaždinske Toplice',46.1236,16.2523),
('Velika Gorica',45.4250,16.0430),
('Vinkovci',45.1724,18.4800),
('Virovitica',45.5024,17.2400),
('Vis',43.0332,16.1141),
('Vodice',43.4540,15.4644),
('Vodnjan',44.5740,13.5111),
('Vrbovec',45.5302,16.2501),
('Vrbovsko',45.2212,15.0448),
('Vrgorac',43.1214,17.2212),
('Vrlika',43.5432,16.2360),
('Vukovar',45.2100,18.5924),
('Zabok',46.0134,15.5414),
('Zadar',44.0649,15.1358),
('Zagreb',45.4843,15.5852),
('Zaprešić',45.5125,15.4818),
('Zlatar',46.0531,16.0437),
('Županja',45.0419,18.4138);

;

INSERT INTO partija
(vrsta, dokolikoseigra, lokacija, unosi)
VALUES('301', 301, 1, 1),('501',501,1,2);

INSERT INTO mjesanje
(vrsta, belot, datumunosa, stiglja, partija)
VALUES('301', 0, '2022-06-08', 0, 1);


INSERT INTO partija_igrac
(partija, igrac)
VALUES(1, 1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4);
