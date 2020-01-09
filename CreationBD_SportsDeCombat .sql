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
	LastName varchar(30)NOT NULL,
	FirstName varchar(30)NOT NULL,
	Alias varchar(30),
	Weight int NOT NULL,
	heigh int NOT NULL	,
	reach int NOT NULL,
	PersonalInformations_id int FOREIGN KEY REFERENCES PersonalInformations(id),
	Styles_id int FOREIGN KEY REFERENCES Styles(id),
	Clubs_id int FOREIGN KEY REFERENCES PersonalInformations(id),
	Gears_id int FOREIGN KEY REFERENCES Gears(id),
	Status_id int FOREIGN KEY REFERENCES Status(id),
	Age int NOT NULL,
	Address varchar(45)NOT NULL,
	Tel_Number int ,
	Salary int
	
)

create table Sponsors (
    id int NOT NULL PRIMARY KEY,
	Name varchar(30) NOT NULL ,
	Office varchar(30) NOT NULL ,
	Reference_Number varchar(30) NOT NULL 
)

create table Fighters_has_Sponsors (
   Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
   Sponsors_id int FOREIGN KEY REFERENCES Sponsors(id)
)

create table Contests (
    id int NOT NULL PRIMARY KEY,
	Participation_Number int NOT NULL UNIQUE,
	Date_Constest date NOT NULL UNIQUE
)

create table Contests_has_Fighters (
	Fighters_id int FOREIGN KEY REFERENCES Fights(id),
	Contests_id int FOREIGN KEY REFERENCES Contests(id)
)

create table Categories (
	id int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL UNIQUE
)

create table Fighters_has_Categories (
   Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
   Categories_id int FOREIGN KEY REFERENCES Categories(id))
)

create table Fights (
    id int NOT NULL PRIMARY KEY,
	Number_fight int NOT NULL UNIQUE,
	contry varchar(45),
	town varchar(45),
	address varchar(45),
	date_fight date,
	category varchar(45)
	loser varchar(45),
	winner varchar(45),
	Sport_type varchar(45),
	Result_fight varchar(45),
	Title_idTitle int FOREIGN KEY REFERENCES Title(idTitle)
	
)

create table Fighters_has_Fights (
	Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
    Fight_id int FOREIGN KEY REFERENCES Fight(id)
)

create table Statistics (
    id int NOT NULL PRIMARY KEY,
	KO int,
	TKO int ,
	Declassification int, 
	Split_Decision int, 
	Submission int, 
	Rank_Fighter int NOT NULL
)

create table Fighters_has_Statistics (
    Fight_id int FOREIGN KEY REFERENCES Fight(id),
    Statistics_id int FOREIGN KEY REFERENCES Statistics(id)
)
create table Titles (
	id int NOT NULL PRIMARY KEY,
	Name varchar(30) NOT NULL UNIQUE,
	Nb_times int ,
	Date_title date
)

create table Styles (
	id int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL,
	Level_Style varchar(45)



)

create table Gears (
	id int NOT NULL PRIMARY KEY,
	Type_Gear varchar(45),
	Brand varchar(30),
	Serial_Number varchar(30)
)



create table Clubs (
	 id int NOT NULL PRIMARY KEY,
	 Name varchar(45) NOT NULL,
	 Licence_Number varchar(45) NOT NULL UNIQUE,
	 Seniority DATE
)


