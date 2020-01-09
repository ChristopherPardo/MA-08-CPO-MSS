use master
go

IF db_id('SportsDeCombat') IS NOT NULL
BEGIN
    drop database SportsDeCombat
END

--adapter le chemin aux fichiers de données et de logs
CREATE DATABASE SportsDeCombat
	ON  PRIMARY 
	( NAME = 'SportsDeCombat', FILENAME = 'C:\Data\Cours\2019-2020\MA-08\semaine 3\SportsDeCombat.mdf' , SIZE = 20480KB , MAXSIZE = 51200KB, FILEGROWTH = 1024KB )
	LOG ON 
	( NAME = 'SportsDeCombat_log', FILENAME = 'C:\Data\Cours\2019-2020\MA-08\semaine 3\SportsDeCombat_log.ldf' , SIZE = 10240KB , MAXSIZE = 20480KB , FILEGROWTH = 1024KB)
go

USE SportsDeCombat
go

create table Fighters (
	id int NOT NULL PRIMARY KEY,
	LastName varchar(30),
	FirstName varchar(30),
	Alias varchar(30),
	Weight int NOT NULL
	heigh int NOT NULL	
	reach int NOT NULL
	PersonalInformations_idPersonalInformations int FOREIGN KEY REFERENCES PersonalInformations(idPersonalInformations)
	Styles_idStyles int FOREIGN KEY REFERENCES Styles(idStyles)
	Clubs_idClubs int FOREIGN KEY REFERENCES PersonalInformations(idPersonalInformations)

)

create table Sponsors (
    idCategorises int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL UNIQUE
)

create table Fighters_has_Sponsors (
	 Customers_idCustomers int FOREIGN KEY REFERENCES Customers(idCustomers),
   Categorises_idCategorises int FOREIGN KEY REFERENCES Categorises(idCategorises)
)

create table Contests (
    idCategorises int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL UNIQUE
)

create table Contests_has_Fighters (
	 Customers_idCustomers int FOREIGN KEY REFERENCES Customers(idCustomers),
   Categorises_idCategorises int FOREIGN KEY REFERENCES Categorises(idCategorises)
)

create table Categories (
    idCategorises int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL UNIQUE
)

create table Fighters_has_Categories (
	 Customers_idCustomers int FOREIGN KEY REFERENCES Customers(idCustomers),
   Categorises_idCategorises int FOREIGN KEY REFERENCES Categorises(idCategorises)
)

create table Fights (
    idCategorises int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL UNIQUE
)

create table Fighters_has_Fights (
	 Customers_idCustomers int FOREIGN KEY REFERENCES Customers(idCustomers),
   Categorises_idCategorises int FOREIGN KEY REFERENCES Categorises(idCategorises)
)

create table Statistics (
    idCategorises int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL UNIQUE
)

create table Fighters_has_Statistics (
	 Customers_idCustomers int FOREIGN KEY REFERENCES Customers(idCustomers),
     Categorises_idCategorises int FOREIGN KEY REFERENCES Categorises(idCategorises)
)
create table Titles (
	idStates int NOT NULL PRIMARY KEY,
	Name varchar(50) NOT NULL UNIQUE
)

create table Styles (
	idOrders int NOT NULL PRIMARY KEY,
	Nb_Orders int NOT NULL UNIQUE,
  Dates datetime
  Customers_idCustomers int FOREIGN KEY REFERENCES Customers(idCustomers),
  States_idStates int FOREIGN KEY REFERENCES States(idStates)

)

create table Gears (
	idProducts int NOT NULL PRIMARY KEY,
	Nb_Products int NOT NULL,
  Braind varchar(30),
	Model varchar(30),
	Description varchar(100),
	Price int,
	Nb_Pieces int
)

create table PersonalInformations (
	Orders_idOrders int FOREIGN KEY REFERENCES Orders(idOrders),
  Products_idProducts int FOREIGN KEY REFERENCES Products(idProducts)
)

create table Clubs (
  idPromotions int NOT NULL PRIMARY KEY,
  Name varchar(45) NOT NULL UNIQUE,
  Percentage int
)


