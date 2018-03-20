DROP TABLE IF EXISTS DetailReservation;
DROP TABLE IF EXISTS Tarif;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Traverse;
DROP TABLE IF EXISTS Liaison;
DROP TABLE IF EXISTS PlacesParCategorie;
DROP TABLE IF EXISTS Periode;
DROP TABLE IF EXISTS Posseder;
DROP TABLE IF EXISTS Equipement;
DROP TABLE IF EXISTS Bateau;
DROP TABLE IF EXISTS Type;
DROP TABLE IF EXISTS Categorie;
DROP TABLE IF EXISTS Port;
DROP TABLE IF EXISTS Secteur;

CREATE TABLE `Secteur`(`id` INTEGER,`libelle` VARCHAR(25),
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Port`(`id` INTEGER,`libelle` VARCHAR(25),
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Categorie`(`id` INTEGER,`libelle` VARCHAR(25),
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Type`(`id` INTEGER,`libelle` VARCHAR(25),`idCategorie` INTEGER NOT NULL, 
	foreign key (`idCategorie`) references Categorie(`id`),
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Bateau`(`id` INTEGER,`libelle` VARCHAR(25), image VARCHAR(25), type CHAR(1), longueur FLOAT, largeur FLOAT, vitesse FLOAT,
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE Equipement(id INTEGER, lib VARCHAR(20),
	primary key(id))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE Posseder(idBat INTEGER, idEquip INTEGER,
	foreign key(idBat) references Bateau(id),
	foreign key(idEquip) references Equipement(id))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Periode`(`id` INTEGER,`dateMin` DATE,`dateMax` DATE,
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `PlacesParCategorie`(`nbrePlace` INTEGER,`idBateau` INTEGER NOT NULL,`idCategorie` INTEGER NOT NULL, 
	foreign key (`idBateau`) references Bateau(`id`), 
	foreign key (`idCategorie`) references Categorie(`id`),
	primary key(`idBateau`,`idCategorie`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Liaison`(`id` INTEGER,`distance` FLOAT, Arrivee INTEGER NOT NULL,Depart INTEGER NOT NULL,`idSecteur` INTEGER NOT NULL, 
	foreign key (Arrivee) references Port(`id`), 
	foreign key (Depart) references Port(`id`), 
	foreign key (`idSecteur`) references Secteur(`id`),
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Traverse`(`id` INTEGER,`horaire` DATETIME,`idBateau` INTEGER NOT NULL, 
	foreign key (`idBateau`) references Bateau(`id`),
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Reservation`(`id` INTEGER,`nom` VARCHAR(25),`idTraverse` INTEGER NOT NULL, 
	foreign key (`idTraverse`) references Traverse(`id`),
	primary key(`id`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `Tarif`(`montant` FLOAT,`idPeriode` INTEGER NOT NULL,`idLiaison` INTEGER NOT NULL,`idType` INTEGER NOT NULL, 
	foreign key (`idPeriode`) references Periode(`id`), 
	foreign key (`idLiaison`) references Liaison(`id`), 
	foreign key (`idType`) references Type(`id`),
	primary key(`idPeriode`,`idLiaison`))
ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `DetailReservation`(`nbrePlace` INTEGER,`idReservation` INTEGER NOT NULL,`idType` INTEGER NOT NULL, 
	foreign key (`idReservation`) references Reservation(`id`), 
	foreign key (`idType`) references Type(`id`),
	primary key(`idReservation`,`idType`))
ENGINE=InnoDB CHARSET=utf8;