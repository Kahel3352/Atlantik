/*DROP TABLE IF EXISTS DetailReservation;
DROP TABLE IF EXISTS Tarif;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Traverse;
DROP TABLE IF EXISTS Liaison;
DROP TABLE IF EXISTS PlacesParCategorie;
DROP TABLE IF EXISTS Periode;
DROP TABLE IF EXISTS Bateau;
DROP TABLE IF EXISTS Type;
DROP TABLE IF EXISTS Categorie;
DROP TABLE IF EXISTS Port;
DROP TABLE IF EXISTS Secteur;*/

/*CREATE TABLE `Secteur`(`id` INTEGER,`libelle` VARCHAR(25),
	primary key(`id`));

CREATE TABLE `Port`(`id` INTEGER,`libelle` VARCHAR(25),
	primary key(`id`));

CREATE TABLE `Categorie`(`id` INTEGER,`libelle` VARCHAR(25),
	primary key(`id`));

CREATE TABLE `Type`(`id` INTEGER,`libelle` VARCHAR(25),`idCategorie` INTEGER NOT NULL, 
	foreign key (`idCategorie`) references Categorie(`id`),
	primary key(`id`));

CREATE TABLE `Bateau`(`id` INTEGER,`libelle` VARCHAR(25),
	primary key(`id`));

CREATE TABLE `Periode`(`id` INTEGER,`dateMin` DATE,`dateMax` DATE,
	primary key(`id`));

CREATE TABLE `PlacesParCategorie`(`nbrePlace` INTEGER,`idBateau` INTEGER NOT NULL,`idCategorie` INTEGER NOT NULL, 
	foreign key (`idBateau`) references Bateau(`id`), 
	foreign key (`idCategorie`) references Categorie(`id`),
	primary key(`idBateau`,`idCategorie`));

CREATE TABLE `Liaison`(`id` INTEGER,`distance` FLOAT, Depart INTEGER NOT NULL,Arrivee INTEGER NOT NULL,`idSecteur` INTEGER NOT NULL, 
	foreign key (Depart) references Port(`id`), 
	foreign key (Arrivee) references Port(`id`), 
	foreign key (`idSecteur`) references Secteur(`id`),
	primary key(`id`));

CREATE TABLE `Traverse`(`id` INTEGER,`horaire` DATETIME,`idBateau` INTEGER NOT NULL, 
	foreign key (`idBateau`) references Bateau(`id`),
	primary key(`id`));

CREATE TABLE `Reservation`(`id` INTEGER,`nom` VARCHAR(25),`idTraverse` INTEGER NOT NULL, 
	foreign key (`idTraverse`) references Traverse(`id`),
	primary key(`id`));

CREATE TABLE `Tarif`(`montant` FLOAT,`idType` INTEGER NOT NULL,`idLiaison` INTEGER NOT NULL,`idPeriode` INTEGER NOT NULL, 
	foreign key (`idPeriode`) references Periode(`id`), 
	foreign key (`idLiaison`) references Liaison(`id`), 
	foreign key (`idType`) references Type(`id`),
	primary key(`idPeriode`,`idLiaison`));

CREATE TABLE `DetailReservation`(`nbrePlace` INTEGER,`idReservation` INTEGER NOT NULL,`idType` INTEGER NOT NULL, 
	foreign key (`idReservation`) references Reservation(`id`), 
	foreign key (`idType`) references Type(`id`),
	primary key(`idReservation`,`idType`));*/


INSERT INTO Secteur VALUES
(0,"Belle-Ile-en-Mer"),
(1,"Houat"),
(2,"Ile de Groix");

insert into Port values
(0,"Quiberon"),
(1,"Le Palais"),
(2, "Sauzon"),
(3,"Vannes"),
(4,"Port St Gildas"),
(5,"Lorient"),
(6,"Port-Tudy");

INSERT INTO Categorie VALUES
(0,"A - Passager"),
(1,"B - Véh.inf.2m"),
(2,"C - Véh.sup.2mS");

INSERT INTO Type VALUES
(0,"A1", "Adulte"),
(1,"A2", "Junior 8 à 18 ans"),
(2,"A3", "Enfant 0 à 7 ans"),
(3,"A1", "Voiture long.inf.4m"),
(4,"A2", "Voiture long.inf.5m"),
(5,"A3", "Fourgon"),
(6,"A1", "Camping Car"),
(7,"A2", "Camion");

INSERT INTO Bateau VALUES
(0, "Kor\' Ant", '','f', 0, 0, 0),
(1, "Ar Solen", '', 'f', 0, 0, 0),
(2, "Al\'xi", 'al_xi.png', 'v', 37.20, 8.60, 16),
(3, "Luce isle",'luce_isle.png', 'v', 25, 7, 26),
(4, "Maëllys", '','f', 0, 0, 0);

INSERT INTO Equipement VALUES
(0, "Accès Handicapé"),
(1, "Bar"),
(2, "Pont Promenade"),
(3, "Salon Vidéo");

INSERT INTO Posseder VALUES
(2, 0),
(2, 1),
(2, 2),
(2, 3),
(3, 0),
(3, 2);


INSERT INTO Periode VALUES 
(0, "2010-09-01", "2011-06-15"),
(1, "2011-06-16", "2011-09-15"),
(2, "2011-09-16", "2012-05-31");

INSERT INTO PlacesParCategorie VALUES
(350,0, 0),
(20, 0, 1),
(3, 0, 2),
(300, 1, 0),
(10, 1, 1),
(5, 1, 2),
(300, 2, 0),
(5, 2, 1),
(0, 2, 2);

INSERT INTO Liaison values
(15,8.3,0,1,0),
(24,9,1,0,0),
(16,8.0,0,2,0),
(17,7.9,2,0,0),
(19,23.7,3,1,0),
(11,25.1,1,3,0),
(25,8.8,0,4,1),
(30,8.8,4,0,1),
(21,7.7,5,6,2),
(22,7.4,6,5,0);

INSERT INTO Traverse VALUES
(541197, "2011-07-10 07:45:00", 0),
(541198, "2011-07-10 09:15:00", 1),
(541199, "2011-07-10 10:50:00", 2),
(541200, "2011-07-10 12:15:00", 3),
(541201, "2011-07-10 14:30:00", 0),
(541202, "2011-07-10 16:45:00", 1),
(541203, "2011-07-10 18:15:00", 2),
(541204, "2011-07-10 19:45:00", 4);

INSERT INTO Reservation VALUES
(0, "Tiprez",541201);

/*INSERT INTO Tarif VALUES
(18.00,0,15,0),
(11.10,1,15,0),
(5.60,2,15,0),
(86.00,3,15,0),
(129.00,4,15,0),
(189.00,5,15,0),
(205.00,6,15,0),
(268.00,7,15,0),
(20.00,0,15,1),
(13.10,1,15,1),
(7.00,2,15,1),
(95.00,3,15,1),
(142.00,4,15,1),
(208.00,5,15,1),
(226.00,6,15,1),
(295.00,7,15,1),
(19.00,0,15,2),
(12.10,1,15,2),
(6.40,2,15,2),
(91.00,3,15,2),
(136.00,4,15,2),
(199.00,5,15,2),
(216.00,6,15,2),
(282.00,7,15,2),
(27.20,0,19,0),
(17.30,1,19,0),
(9.80,2,19,0),
(129.00,3,19,0),
(194.00,4,19,0),
(284.00,5,19,0),
(308.00,6,19,0),
(402.00,7,19,0),
(29.30,0,19,1),
(18.60,1,19,1),
(10.60,2,19,1),
(139.00,3,19,1),
(209.00,4,19,1),
(306.00,5,19,1),
(332.00,6,19,1),
(434.00,7,19,1),
(28.50,0,19,2),
(18.10,1,19,2),
(10.20,2,19,2),
(135.00,3,19,2),
(203.00,4,19,2),
(298.00,5,19,2),
(323.00,6,19,2),
(422.00,7,19,2);*/

INSERT INTO DetailReservation VALUES
(2, 0,0),
(1,0,1),
(2,0,2);