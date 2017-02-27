--Victoria Confeiteiro
--Lab 6

--1
SELECT Customers.name, Customers.city
FROM Customers
WHERE Customers.city in 
	(SELECT city
	FROM Products
	GROUP BY city
	ORDER BY COUNT(pid)
	LIMIT 1)
LIMIT 1;

--2
SELECT name
FROM Products
WHERE priceUSD > (SELECT AVG(priceUSD)
		  FROM Products)
ORDER BY REVERSE(name); 

--3
SELECT Customers.name, Products.pid, SUM(Orders.totalUSD)
FROM Orders JOIN Customers ON Orders.cid = Customers.cid
	    JOIN Products ON Orders.pid = Products.pid
GROUP BY Customers.name, Products.pid
ORDER BY SUM(Orders.totalUSD) ASC;

--4
SELECT Customers.name, COALESCE(SUM(totalUSD), 0)
FROM Orders RIGHT OUTER JOIN Customers ON Orders.cid = Customers.cid
GROUP BY Customers.name
ORDER BY Customers.name ASC;

--5
SELECT Customers.name, Products.name, Agents.name
FROM Orders JOIN Customers ON Orders.cid = Customers.cid
	    JOIN Products ON Orders.pid = Products.pid
	    JOIN Agents ON Orders.aid = Agents.aid
WHERE Agents.city = 'Newark'
GROUP BY Customers.name, Products.name, Agents.name;

--6 
SELECT *
FROM (SELECT Orders.*, Orders.qty * (1-(discount/100)) * Products.PriceUSD AS calcTotal
      FROM Orders JOIN Customers ON Orders.cid = Customers.cid
                  JOIN Products ON Orders.pid = Products.pid) as foo 
WHERE totalUSD != calcTotal;

--7
SELECT *
FROM Orders LEFT OUTER JOIN Customers ON Orders.cid = Customers.cid;

SELECT *
FROM Orders RIGHT OUTER JOIN Customers ON Orders.cid = Customers.cid;