--Victoria Confeiteiro
-- Lab 8

DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Actors_Characteristics;
DROP TABLE IF EXISTS Actors_Movies;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Directors_Movies;
DROP TABLE IF EXISTS Director_Info;
DROP TABLE IF EXISTS Directors;


-- People --
CREATE TABLE People (
  PID int not null auto_increment,
  fname text not null,
  lname text not null,
  spouse_name text,
  address text not null,
 primary key(PID)
);


-- Actors --
CREATE TABLE Actors (
  PID int not null,
  AID int not null,
 primary key(PID)
);        


-- Actors Characteristics --
CREATE TABLE Actors_Characteristics (
  AID int not null,
  birthday date,
  hair_color text,
  eye_color text,
  heightIN int,
  weightLBS int,
  fav_color text,
  actor_guild_date date,
 primary key(AID)
);


-- Actors_Movies -- 
CREATE TABLE Actors_Movies (
  MPAA int not null,
  AID int not null,    
  actor_fname text,
  actor_lname text,
 primary key(MPAA, AID)
);

-- Movies -- 
CREATE TABLE Movies (
  MPAA int not null,
  movie_name text,    
  year_released char(4),
  domestic sales int,
  foreign_sales int,
  dvd_bluray_sales int
 primary key(MPAA)
);

-- Directors_Movies -- 
CREATE TABLE Directors_Movies (
  MPAA integer not null,
  DID int not null,    
  director_fname text,
  director_lname text,
 primary key(MPAA, DID)
);

-- Director_Info -- 
CREATE TABLE Director_Info (
  DID integer not null,
  film_school text,    
  director_guild_date date,
  fav_lense_maker text,
 primary key(DID)
);

-- Directors -- 
CREATE TABLE Directors (
  PID integer not null,
  DID int not null,    
 primary key(PID)
);

--Functional Dependencies

--People 
-- pid <-- fname, lname, spouse_name, address

--Actors 
-- pid <-- aid

--Actor's characteristics
-- aid <-- birthday, hair color, eye color, height, weight, fav color, actor guild date

-- Actor's Movies
-- MPAA <-- actor_fname, actor_lname

-- Movies
-- MPAA <-- movie name, year released, domestic sales, foreign sales, dvd/bluray sales

--Directors Movies
-- MPAA <-- director_fname, director_lname

--Director Info
-- DID <-- film school, director guild date, fav lense maker

-- Directors
-- PID <-- AID

-- Sean Connery Query
SELECT Directors_Movies.director_fname, Directors_Movies.director_lname
FROM People
JOIN Directors_Movies ON Directors.DID = Directors_Movies.PID
JOIN People ON Directors.PID = People.PID
JOIN Actors ON People.PID = Actors.PID
JOIN Actors_Movies ON Actors.AID = Actors_Movies.AID
WHERE Actors_Movies.actor_fname = "Sean" AND Actors_Movies.actor_lname = "Connery";




