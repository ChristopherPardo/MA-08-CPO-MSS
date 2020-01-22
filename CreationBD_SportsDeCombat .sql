use master
go

IF db_id('SportsDeCombat') IS NOT NULL
BEGIN
    drop database SportsDeCombat
END

--adapter le chemin aux fichiers de données et de logs
CREATE DATABASE SportsDeCombat
	ON  PRIMARY 
	
	( NAME = 'SportsDeCombat', FILENAME = 'C:\DATA\MSSQL\SportsDeCombat.mdf' , SIZE = 20480KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB )
	LOG ON 
	( NAME = 'SportsDeCombat_log', FILENAME = 'C:\DATA\MSSQL\SportsDeCombat.ldf' , SIZE = 10240KB , MAXSIZE = 20480KB , FILEGROWTH = 1024KB )

go

USE SportsDeCombat
go

create table Styles (
	id int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL,
	Level_Style varchar(45)
)

create table Gears (
	id int NOT NULL PRIMARY KEY,
	Type_Gear varchar(45),
	Brand varchar(30),
	Serial_Number varchar(20)
)

create table "Statistics" (
    id int NOT NULL PRIMARY KEY,
	KO int,
	TKO int ,
	Declassification int, 
	Split_Decision int, 
	Submission int, 
	Rank_Fighter int NOT NULL
)

create table Clubs (
	 id int NOT NULL PRIMARY KEY,
	 Name varchar(45) NOT NULL,
	 Licence_Number varchar(45) NOT NULL UNIQUE,
	 Seniority DATE
)

create table Fighters (
	id int NOT NULL PRIMARY KEY,
	LastName varchar(30)NOT NULL,
	FirstName varchar(30)NOT NULL,
	Alias varchar(30),
	Weight int NOT NULL,
	Heigh int NOT NULL,
	Reach int NOT NULL,
	Styles_id int FOREIGN KEY REFERENCES Styles(id),
	Gears_id int FOREIGN KEY REFERENCES Gears(id),
	Clubs_id int FOREIGN KEY REFERENCES Clubs(id),
	Age int NOT NULL,
	Address varchar(45)NOT NULL,
	Tel_Number int,
	Salary int,
	Licence_Number varchar(45)
)

create table Status (
    id int NOT NULL PRIMARY KEY,
	Name varchar(30) NOT NULL ,
	Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
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
	Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
	Contests_id int FOREIGN KEY REFERENCES Contests(id)
)

create table Categories (
	id int NOT NULL PRIMARY KEY,
	Name varchar(45) NOT NULL UNIQUE
)

create table Fighters_has_Categories (
   Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
   Categories_id int FOREIGN KEY REFERENCES Categories(id)
)

create table Titles (
	id int NOT NULL PRIMARY KEY,
	Name varchar(30) NOT NULL UNIQUE,
	Nb_times int ,
	Date_title date
)

create table Fights (
    id int NOT NULL PRIMARY KEY,
	Number_fight int NOT NULL UNIQUE,
	Contry varchar(45),
	Town varchar(45),
	Address varchar(45),
	Date_fight date,
	Category varchar(45),
	Loser varchar(45),
	Winner varchar(45),
	Sport_type varchar(45),
	Result_fight varchar(45),
	Titles_id int FOREIGN KEY REFERENCES Titles(id)
	
)

create table Fighters_has_Fights (
	Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
    Fights_id int FOREIGN KEY REFERENCES Fights(id)
)

create table Fighters_has_Statistics (
    Fighters_id int FOREIGN KEY REFERENCES Fighters(id),
    Statistics_id int FOREIGN KEY REFERENCES "Statistics"(id)
)


