--Victoria Confeiteiro
--Lab 5

--1
SELECT city
FROM Agents
	JOIN Orders ON Agents.aid = Orders.aid
WHERE Orders.cid = 'c006';

--2
SELECT DISTINCT Products.pid
FROM Customers JOIN Orders on Customers.cid = Orders.cid 
               JOIN Orders Products ON Products.aid = Orders.aid
WHERE Customers.city = 'Kyoto'
ORDER BY Products.pid DESC;

--3
SELECT name
FROM Customers
WHERE cid NOT IN
	(SELECT cid 
	FROM Orders);

--4
SELECT name
FROM Customers
	LEFT OUTER JOIN Orders ON Customers.cid = Orders.cid
WHERE Orders.cid IS NULL;

--5
SELECT DISTINCT Customers.name, Agents.name
FROM Customers 
	JOIN Orders ON Customers.cid = Orders.cid
	JOIN Agents ON Orders.aid = Agents.aid
WHERE Customers.city = Agents.city;

--6
SELECT DISTINCT Customers.name, Agents.name
FROM Customers
	JOIN Agents ON Customers.city = Agents.city
WHERE Customers.city = Agents.city;

--7
SELECT Customers.name, Customers.city
FROM Customers
WHERE Customers.city in 
	(SELECT city
	FROM Products
	GROUP BY city
	ORDER BY COUNT(pid)
	LIMIT 1);
