DROP TABLE IF EXISTS Job_Types;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS States;
DROP TABLE IF EXISTS Primary_Account_Holders;
DROP TABLE IF EXISTS Account_Types;
DROP TABLE IF EXISTS Bar_Charges;
DROP TABLE IF EXISTS Snack_Bar_Charges;
DROP TABLE IF EXISTS All_Members;
DROP TABLE IF EXISTS Membership_Account_Numbers;
DROP TABLE IF EXISTS Tennis_Court_Swipes;
DROP TABLE IF EXISTS Pool_Swipes;

CREATE TABLE Job_Types (
	JID serial,
	department text not null,
	jobPosition text not null,
	primary key(JID)
);

CREATE TABLE Employees (
	PID INT NOT NULL,
	JID int not null,
	dateStarted date,
	payPerHourUSD int,
	hoursWorked int,
	primary key(PID, JID)
);

CREATE TABLE People (
	PID serial,
	firstName text not null,
	lastName text not null,
	emailAddress text,
	phoneNumber bigint,
	dateOfBirth date,
	gender text not null,
	streetAddress text,
	zipCode int not null,
	primary key(PID)
);

CREATE TABLE States (
	zipCode int not null,
	city text not null,
	state text not null,
	primary key(zipCode)
);

CREATE TABLE Primary_Account_Holders (
	PID INT NOT NULL,
	accountNumber INT not null,
	electronicBilling boolean not null,
	primary key(PID)
);

CREATE TABLE Account_Types (
	ATID serial,
	description text not null,
	pricePerMonthUSD int not null,
	primary key(ATID)
);

CREATE TABLE Bar_Charges (
	barTransactionID serial,
	accountNumber int not null,
	transactionDateBar date not null,
	amountUSDBar int,
	primary key(barTransactionID)
);

CREATE TABLE Snack_Bar_Charges (
	snackBarTransactionID serial,
	accountNumber int not null,
	transactionDateSnack date not null,
	amountUSDSnack int,
	primary key(snackBarTransactionID)
);

CREATE TABLE Membership_Account_Numbers (
	accountNumber int not null,
	ATID int not null,
	snackBarBill int,
	barBill int,
	poolSwipes int,
	tennisCourtSwipes int,
	primary key(accountNumber)
);

CREATE TABLE All_Members (
	PID INT NOT NULL,
	accountNumber INT not null,
	primary key(PID)
);

CREATE TABLE Tennis_Court_Swipes (
	tennisSwipeID serial,
	accountNumber INT not null,
	tennisSwipeDate date,
	primary key(tennisSwipeID)
);
CREATE TABLE Pool_Swipes (
	poolSwipeID serial,
	accountNumber int not null,
	poolSwipeDate date,
	primary key(poolSwipeID)
); 

INSERT INTO States (zipCode, city, state)
VALUES ('10701', 'Yonkers', 'New York'),
		('10703', 'Yonkers', 'New York'),
		('10705', 'Yonkers', 'New York'),
		('11554', 'East Meadow', 'New York'),
		('12704', 'Poughkeepsie', 'New York'),
		('13742', 'New Rochelle', 'New York'),
		('10001', 'New York', 'New York'),
		('17404', 'Scranton', 'Pennsylvania'),
		('21210', 'Baltimore', 'Maryland'),
		('33018', 'Miami', 'Florida');

INSERT INTO People (firstName, lastName, emailAddress, phoneNumber, dateOfBirth, gender, streetAddress, zipCode)
VALUES ('Victoria', 'Confeiteiro', 'vconfeiteiro@optonline.net', '9149241907', '1996-11-29', 'Female', '12 Tree Street', '10701'),
		('Thomas', 'Duff', 'trogs@gmail.coom', '5163456789', '1960-05-14', 'Male', '57 Chester Drive', '11554'),
		('Alan', 'Labouseur', 'alan.labouseur.marist.edu', '8455753000', '1988-06-13', 'Male', '3399 North Road', '12704'),
		('Miceala', 'Martini', 'makemeamartini@gmail.com', '5186451234', '1995-10-02', 'Female', '5 South Beach Road', '33018'),
		('Julie', 'Martinelli', 'jmart3@gmail.com', '9148901234', '1996-10-02', 'Female', '8 North Avenue', '13742'),
		('James', 'Duff', 'duffman11@gmail.com', '6469176453', '1970-5-02', 'Male', '52 Chester Drive', '11554'),
		('Kerri', 'Waters', 'kerri.waters@amackassin.com', '9145879012', '1970-5-10', 'Female', '34 Palisade Road', '10705'),
		('Beyonce', 'Knowles', 'queenbey@hotmail.com', '3478913452', '1989-3-02', 'Female', '5 Park Avenue', '10001'),
		('Jay-Z', 'Carter', 'jayz@hotmail.com', '3478913453', '1987-3-02', 'Male', '5 Park Avenue', '10001'),
		('Joseph', 'Confeiteiro', 'jconfeiteiro@optonline.net', '9149241907', '2000-4-11', 'Male', '5 Corely Street', '17404'),
		('Hillary', 'Clinton', 'hillary4prez@yahoo.com', '9144334396', '1947-10-26', 'Female', '3 President Court', '13742'),
		('Bernie', 'Sanders', 'feelthebern@optonline.net', '9149241907', '1941-09-08', 'Male', '5 So Close Street', '13742'),
		('Tom', 'Haverford', 'entertainment720@gmail.com', '9144334396', '1985-05-25', 'Male', '89 Tom Road', '10703'),
		('Leslie', 'Knope', 'pawneeluvr@gmail.com', '8459608790', '1982-04-11', 'Female', '4 Pawnee Street', '10701'),
		('Andy', 'Dwyer', 'mouseratrules@gmail.com', '6715438890', '1985-11-07', 'Male', '127 Champion Lane', '10701'),
		('April', 'Ludgate-Dwyer', 'april23@gmail.com', '6715461234', '1989-03-05', 'Female', '127 Champion Lane', '10701'),
		('Ben', 'Wyatt', 'leslie4prez@hotmail.com', '8456703456', '1988-03-02', 'Male', '4 Pawnee Street', '10701'),
		('Ron', 'Swanson', 'governmentisstupid.com', '8451234567', '1970-08-04', 'Male', '67 Woods Road', '17404'),
		('Sonia', 'Knope-Wyatt', 'pawneeluvr@gmail.com', '8459608790', '2002-07-02', 'Female', '4 Pawnee Street', '10701'),
		('Westly', 'Knope-Wyatt', 'pawneeluvr@gmail.com', '8459608790', '2002-07-02', 'Male', '4 Pawnee Street', '10701'),
		('Stephen', 'Knope-Wyatt', 'pawneeluvr@gmail.com', '8459608790', '2002-07-02', 'Male', '4 Pawnee Street', '10701'),
		('Michael', 'Scott', 'iamtheboss@dundermifflin.com', '9143456789', '1972-04-17', 'Male', '45 Michael Road', '17404'),
		('Holly', 'Scott', 'holly.scott@dunfermifflin.com', '9145678910', '1973-04-20', 'Female', '45 Michael Road', '17404'),
		('Richie', 'Ortiz', 'masterchef@amackassin.com', '9143708919', '1975-07-13', 'Male', '3 South Broadway', '10703'),
		('Jim', 'Halpert', 'jim.halpert@dundermifflin.com', '9143338888', '1982-02-11', 'Male', '98 Green Lane', '17404'),
		('Pam', 'Halpert', 'pam.halpert@dundermifflin.com', '9142223333', '1985-06-26', 'Female', '98 Green Lane', '17404'),
		('Sarah', 'Halpert', 'jim.halpert@dundermifflin.com', '9143338888', '2002-07-02', 'Female', '98 Green Lane', '17404'),
		('Jean-Ralphio', 'Saperstein', 'entertaiment7021@gmail.com', '914336767', '1992-05-11', 'Male', '54 Pretend Avenue', '12704'),
		('John John', 'Florence', 'number1surfer@gmail.com', '8702335678', '1992-10-18', 'Male', '34 Beach Street', '33018'),
		('Serena', 'Williams', 'protennis4life@gmail.com', '5436789010', '1981-10-26', 'Female', '67 Tennis Way', '33018');

INSERT INTO Job_Types (Department, jobPosition)
VALUES ('Bar', 'Bartender'),
		('Pool', 'Lifeguard'),
		('Pool', 'Swim Team Coach'),
		('Bar', 'Bar Back'),
		('Snack Bar', 'Chef'),
		('Snack Bar', 'Counter Worker'),
		('Snack Bar', 'Snack Bar Manager'),
		('House', 'Janitor'),
		('Management', 'Manager'),
		('Management', 'Assistant Manager'),
		('Tennis', 'Court Caretaker'),
		('Tennis', 'Coach'),
		('Tennis', 'Assistant Coach');

INSERT INTO Employees (pid, jid, dateStarted, payPerHourUSD, hoursWorked)
VALUES ('3', '1', '2010-05-25', '12', '100'),
		('1', '9', '2011-05-30', '10', '75'),
		('30', '15', '2009-03-25', '20', '200'),
		('29', '4', '2005-06-11', '15', '150'),
		('4', '6', '2012-05-25', '11', '75'),
		('11', '1', '1996-04-14', '30', '300'),
		('5', '7', '2010-07-04', '22', '100'),
		('10', '2', '2014-05-30', '8', '125'),
		('18', '9', '1999-11-29', '40', '300'),
		('24', '5', '2016-06-16', '20', '400'),
		('28', '8', '2014-02-04', '7', '120');

INSERT INTO Membership_Account_Numbers (accountNumber, ATID, snackBarBill, barBill, poolSwipes, tennisCourtSwipes)
VALUES ('1010', '4', '600', '500', '4', '1'),
		('1506', '1', '10', '20', '10', '4'),
		('2300', '4', '1000', '215', '1', '2'),
		('1123', '2', '345', '1245', '5', '7'),
		('1190', '2', '230', '10', '6', '4'),
		('1183', '1', '200', '13', '3', '7'),
		('1164', '2', '35', '700', '1', '11'),
		('1789', '3', '453', '10', '2', '6'),
		('1122', '1', '1000', '5', '4', '3'),
		('1643', '1', '5', '5', '2', '7');

INSERT INTO Account_Types (description, pricePerMonthUSD)
VALUES ('single, no kids', '300'),
		('married, no kids', '350'),
		('single, with kids', '500'),
		('married, with kids', '600');

INSERT INTO Snack_Bar_Charges (accountNumber, transactionDateSnack, amountUSDSnack)
VALUES ('1506', '2017-06-01', '5'),
		('2300', '2017-06-01', '200'),
		('1010', '2017-06-01', '300'),
		('1122', '2017-06-02', '200'),
		('1506', '2017-06-03', '5'),
		('1010', '2017-06-03', '300'),
		('2300', '2017-06-03', '200'),
		('1123', '2017-06-06', '150'),
		('1164', '2017-06-07', '30'),
		('1164', '2017-06-08', '5'),
		('1122', '2017-06-08', '300'),
		('1122', '2017-06-09', '500'),
		('2300', '2017-06-13', '500'),
		('1123', '2017-06-14', '195'),
		('1190', '2017-06-14', '230'),
		('1183', '2017-06-23', '50'),
		('1789', '2017-06-23', '400'),
		('1643', '2017-06-24', '5'),
		('1789', '2017-06-25', '50'),
		('1789', '2017-06-30', '3');

INSERT INTO Bar_Charges (accountNumber, transactionDateBar, amountUSDBar)
VALUES ('1010', '2017-06-01', '150'),
		('1506', '2017-06-01', '5'),
		('1506', '2017-06-02', '15'),
		('2300', '2017-06-03', '120'),
		('1643', '2017-06-03', '5'),
		('1122', '2017-06-05', '5'),
		('1164', '2017-06-05', '300'),
		('1010', '2017-06-05', '350'),
		('2300', '2017-06-06', '95'),
		('1123', '2017-06-09', '400'),
		('1183', '2017-06-12', '13'),
		('1164', '2017-06-12', '300'),
		('1789', '2017-06-15', '10'),
		('1164', '2017-06-15', '100'),
		('1123', '2017-06-20', '845'),
		('1190', '2017-06-22', '10');

INSERT INTO Pool_Swipes (accountNumber, poolSwipeDate)
VALUES ('1010', '2017-06-01'),
		('1506', '2017-06-01'),
		('1643', '2017-06-01'),
		('1123', '2017-06-02'),
		('1506', '2017-06-02'),
		('1789', '2017-06-02'),
		('1506', '2017-06-03'),
		('1122', '2017-06-04'),
		('1164', '2017-06-05'),
		('1010', '2017-06-06'),
		('1190', '2017-06-06'),
		('1122', '2017-06-06'),
		('1183', '2017-06-07'),
		('1506', '2017-06-07'),
		('1123', '2017-06-07'),
		('1010', '2017-06-08'),
		('1190', '2017-06-08'),
		('1506', '2017-06-08'),
		('1123', '2017-06-10'),
		('1183', '2017-06-12'),
		('1122', '2017-06-12'),
		('2300', '2017-06-15'),
		('1190', '2017-06-15'),
		('1506', '2017-06-15'),
		('1010', '2017-06-15'),
		('1506', '2017-06-16'),
		('1643', '2017-06-16'),
		('1123', '2017-06-16'),
		('1190', '2017-06-18'),
		('1506', '2017-06-18'),
		('2300', '2017-06-18'),
		('1122', '2017-06-19'),
		('1789', '2017-06-20'),
		('1506', '2017-06-20'),
		('1190', '2017-06-20'),
		('1183', '2017-06-22'),
		('1123', '2017-06-22'),
		('1506', '2017-06-24'),
		('1190', '2017-06-25');

INSERT INTO Tennis_Court_Swipes(accountNumber, tennisSwipeDate)
VALUES ('1123', '2017-06-01'),
		('1183', '2017-06-01'),
		('1164', '2017-06-02'),
		('1506', '2017-06-02'),
		('1789', '2017-06-02'),
		('1643', '2017-06-03'),
		('1190', '2017-06-03'),
		('1164', '2017-06-03'),
		('1183', '2017-06-03'),
		('1122', '2017-06-04'),
		('1789', '2017-06-04'),
		('1643', '2017-06-04'),
		('1123', '2017-06-05'),
		('1010', '2017-06-05'),
		('1164', '2017-06-05'),
		('2300', '2017-06-06'),
		('1789', '2017-06-06'),
		('1506', '2017-06-07'),
		('1123', '2017-06-07'),
		('1643', '2017-06-08'),
		('1183', '2017-06-08'),
		('1164', '2017-06-09'),
		('1789', '2017-06-09'),
		('1190', '2017-06-09'),
		('1122', '2017-06-09'),
		('1643', '2017-06-10'),
		('1123', '2017-06-10'),
		('1164', '2017-06-10'),
		('1183', '2017-06-11'),
		('1506', '2017-06-11'),
		('2300', '2017-06-12'),
		('1164', '2017-06-12'),
		('1789', '2017-06-13'),
		('1643', '2017-06-14'),
		('1123', '2017-06-14'),
		('1183', '2017-06-15'),
		('1123', '2017-06-15'),
		('1190', '2017-06-16'),
		('1164', '2017-06-17'),
		('1164', '2017-06-18'),
		('1183', '2017-06-19'),
		('1643', '2017-06-20'),
		('1164', '2017-06-21'),
		('1789', '2017-06-22'),
		('1123', '2017-06-23'),
		('1122', '2017-06-23'),
		('1164', '2017-06-24'),
		('1506', '2017-06-24'),
		('1190', '2017-06-25'),
		('1164', '2017-06-25'),
		('1183', '2017-06-25');

INSERT INTO All_Members (pid, accountNumber)
VALUES ('15', '1123'),
		('16', '1123'),
		('11', '1506'),
		('14', '1010'),
		('17', '1010'),
		('19', '1010'),
		('20', '1010'),
		('21', '1010'),
		('25', '2300'),
		('26', '2300'),
		('27', '2300'),
		('22', '1190'),
		('23', '1190'),
		('29', '1183'),
		('8', '1164'),
		('9', '1164'),
		('2', '1789'),
		('6', '1789'),
		('13', '1122'),
		('12', '1643');

INSERT INTO Primary_Account_Holders (pid, accountNumber, electronicBilling)
VALUES ('16', '1123', 'YES'),
		('11', '1506', 'YES'),
		('14', '1010', 'YES'),
		('25', '2300', 'NO'),
		('22', '1190', 'YES'),
		('29', '1183', 'YES'),
		('8', '1164', 'YES'),
		('2', '1789', 'YES'),
		('13', '1122', 'YES'),
		('12', '1643', 'YES');

--Views
--Displays all personal information for Employees
DROP VIEW IF EXISTS EmployeeInformation;

CREATE VIEW EmployeeInformation AS
SELECT employees.pid, people.firstName, people.lastName, people.phoneNumber, Job_Types.jobPosition, payPerHourUSD AS jobInfo
FROM people
INNER JOIN employees on people.pid = employees.pid
INNER JOIN Job_Types on employees.jid = Job_Types.jid
ORDER BY PID ASC;

SELECT * FROM EmployeeInformation;

--Displays all Members who are also employees
DROP VIEW IF EXISTS MembersAndEmployees;

CREATE VIEW MembersAndEmployees AS
SELECT All_Members.pid, people.firstName, people.lastName, people.phoneNumber, All_Members.accountNumber, Job_Types.jobPosition AS MemberInfo
FROM People
INNER JOIN All_Members on people.pid = All_Members.pid
INNER JOIN Employees on people.pid = employees.pid
INNER JOIN Job_Types on employees.jid = Job_Types.jid
ORDER BY PID ASC;;

SELECT * FROM MembersAndEmployees;

--Reports
--The amount of times members that are single with no kids went to the pool
SELECT people.firstName, people.lastName, Membership_Account_Numbers.poolSwipes
FROM People
INNER JOIN All_Members on People.pid = All_Members.pid
INNER JOIN Membership_Account_Numbers on All_Members.accountNumber = Membership_Account_Numbers.accountNumber
INNER JOIN Account_Types on Membership_Account_Numbers.ATID = Account_Types.ATID
WHERE Account_Types.ATID = '1'
ORDER BY Membership_Account_Numbers.poolSwipes ASC; 

--The addresses of all primary account holders who do not to chose to do electronic billing
SELECT people.firstName, people.lastName, people.streetAddress, people.zipCode, states.city, states.state
FROM People
INNER JOIN states on people.zipCode = states.zipCode
INNER JOIN Primary_Account_Holders on people.pid = Primary_Account_Holders.pid
WHERE Primary_Account_Holders.electronicBilling = 'NO'
ORDER BY firstName ASC; 

--Stored Procedures
--Get all bar transactions for any given day
CREATE OR REPLACE FUNCTION barTransactionDates(date, refcursor) RETURNS refcursor AS
$$
DECLARE
	barTransactionDates date :=$1;
	resultset refcursor :=$2;
BEGIN
	open resultset FOR
		SELECT Bar_Charges.barTransactionID,
		       Bar_Charges.accountNumber,
		       Bar_Charges.amountUSDBar
		FROM Bar_Charges
		WHERE barTransactionDates = Bar_Charges.transactionDateBar;
	RETURN resultset;
END
$$
language plpgsql;
--Example
SELECT barTransactionDates('2017-06-05', 'results');
FETCH ALL FROM results;

--Get total dollar value for all snack bar transactions on any given day
CREATE OR REPLACE FUNCTION snackBarTotals(date, refcursor) RETURNS refcursor AS
$$
DECLARE
	snackBarTotals date :=$1;
	resultset refcursor :=$2;
BEGIN
	open resultset FOR
		SELECT sum(amountUSDSnack)
		FROM Snack_Bar_Charges
		WHERE snackBarTotals = transactionDateSnack;
	RETURN resultset;
END
$$
language plpgsql;
SELECT snackBarTotals('2017-06-01', 'results');
FETCH ALL FROM results;

--Roles
create role Manager;
grant all on all tables in schema public to Manager;

create role Bartender;
revoke all on all tables in schema public from Bartender;
grant select on all tables in schema public to Bartender;
grant insert on barCharges to Bartender;
grant update on barCharges to Bartender;

create role Assistant_Manager;
revoke all on all tables in schema public from Assistant_Manager;
grant select on all tables in schema public to Assistant_Manager;
grant update on Employees, People, All_Members, Primary_Account_Holders to Assistant_Manager;  
	




		



