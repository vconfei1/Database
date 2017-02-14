Victoria Confeiteiro
Lab 4 SQL

--1
SELECT city
FROM Agents
WHERE aid in
	(SELECT aid
	FROM Orders
	WHERE cid ='c006');

--2
SELECT DISTINCT pid 
FROM Orders
WHERE aid in
	(SELECT aid
	FROM Orders
	WHERE cid in
		(SELECT cid
		FROM Customers
		WHERE city = 'Kyoto')
	)
ORDER BY pid DESC;

--3
SELECT cid, name
FROM Customers
WHERE cid not in
	(SELECT cid
	FROM Orders
	WHERE aid = 'a01');

--4
SELECT cid
FROM Customers
WHERE cid in
	(Select cid 
	FROM Orders
	WHERE pid = 'p01' AND pid = 'p07');
	
--5	
SELECT DISTINCT pid
FROM Orders
WHERE cid not in
	(SELECT cid
	FROM Orders
	WHERE aid = 'a08')
ORDER BY pid DESC;

--6
SELECT name, discount, city
FROM Customers
WHERE cid in
	(SELECT cid
	From Orders
	WHERE aid in
		(SELECT aid 
		FROM Agents
		WHERE city = 'Tokyo' OR city = 'New York')
	);

--7
SELECT *
FROM Customers
WHERE discount in
	(SELECT discount
	FROM Customers
	WHERE city = 'Duluth' OR city = 'London');

