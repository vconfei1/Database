--Victoria Confeiteiro
--April 10, 2017

--Players--
CREATE TABLE Players (
	PID int not null auto_incrementm
	fname text not null,
	lname text not null,
	address text not null,
	phoneNumber int not null,
	primary key(PID)
	); 

--Coaches--
CREATE TABLE Coaches (
	CID int not null auto-increment,
	fname text not null,
	lname text not null,
	address text not null,
	phoneNumber not null,
	yearsCoaching int
	primary key(CID)
	);

--Age Group--
CREATE TABLE AgeGroup (
	AID int not null auto-increment,
	description text,
	primary key(AID)
	);

--Teams--
CREATE TABLE Teams (
	TID int not null auto-increment,
	name text,
	AID int not null,
	primary key(TID)
	);

--Team Players--
CREATE TABLE TeamPlayers (
	PID int not null,
	TID int not null,
	AID int not null,
	primary key(PID, TID)
	);

--Head Coach Teams--
CREATE TABLE HeadCoachTeams (
	CID int not null,
	AID int not null,
	TID int not null,
	primary key(CID, AID)
	);

--Assistant Coach Teams--
CREATE TABLE AssistantCoachTeams (
	TID int not null,
	AID int not null,
	CID int not null,
	primary key(TID, AID)
	); 