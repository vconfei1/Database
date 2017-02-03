Victoria Confeiteiro 
Lab 3

--Query 1--
SELECT ordNumber, totalUSD
FROM Orders;

--Query 2--
SELECT name, city
FROM Agents
WHERE name='Smith';

--Query 3--
SELECT pid, name, priceUSD
FROM Products
WHERE quantity>200100;

--Query 4--
SELECT name, city
FROM Customers
WHERE city='Duluth';

--Query 5--
SELECT name
FROM Agents
WHERE city<>'Duluth'AND city<>'New York';

--Query 6--
SELECT *
FROM Products
WHERE city<>'Duluth'AND city<>'Dallas' AND priceUSD>=1.00;

--Query 7--
SELECT *
FROM Orders
WHERE month='Feb' OR month='May';

--Query 8--
SELECT *
FROM Orders
WHERE month='Feb' AND totalUSD>=600;

--Query 9--
SELECT *
FROM Orders
WHERE cid='c005';