CREATE VIEW vrs AS
SELECT ingredientid, name, inventory, inventory * unitprice AS value
FROM ingredients i, vendors v
WHERE i.vendorid = v.vendorid AND companyname = 'Veggies_R_Us';

SELECT * from vrs;

SELECT name
FROM vrs
WHERE inventory > 100;

SELECT name
FROM ingredients i, vendors v
WHERE i.vendorid = v.vendorid AND companyname = 'Veggies_R_Us'
AND inventory > 100;

UPDATE ingredients
SET inventory = inventory * 2
WHERE ingredientid = 'TOMTO';

SELECT * from vrs;

CREATE VIEW menuitems (menuitemid, name, price) AS
(SELECT m.mealid, m.name, CAST(SUM(price * (1-discount)) AS NUMERIC(5,2))
FROM meals m LEFT OUTER JOIN partof p ON m.mealid = p.mealid
LEFT OUTER JOIN items i ON p.itemid = i.itemid
GROUP BY m.mealid, m.name)
UNION
(SELECT itemid, name, price
FROM items);

SELECT * from menuitems;

SELECT name
FROM menuitems
WHERE price =
(SELECT MAX(price)
FROM menuitems);

SELECT COUNT(*)
FROM menuitems
WHERE price IS NULL;

UPDATE vrs SET inventory = inventory * 2;
SELECT * FROM vrs;

INSERT INTO vrs(ingredientid, name, inventory) VALUES
'NEWIN','New ingredient',100);
SELECT * FROM vrs;

CREATE OR REPLACE VIEW vrs AS
SELECT ingredientid, name, inventory, inventory * unitprice AS value
FROM ingredients i, vendors v
WHERE i.vendorid = v.vendorid AND companyname = 'Spring Water Supply';

drop VIEW vrs;

SELECT ingredientid, inventory * 2 * unitprice AS "Inventory Value"
FROM ingredients
WHERE name = 'Pickle';

SELECT 5 - 4 + 8 / 4 * 2 AS "Example Equation"
FROM vendors
WHERE referredby IS NOT NULL;

SELECT name, inventory * unitprice AS Dollars,
CEIL(inventory * unitprice * 1.2552) AS euros, 1.2552 AS "Exchange Rate" FROM ingredients;

SELECT manager, address || ' ' || city || ' ' || state || ' ' || zip
|| ' USA' as mail
FROM stores;

SELECT SUBSTRING(repfname FROM 1 FOR 1) || '. ' || replname AS name
FROM vendors;

SELECT substr(‘SAFETY’,2,4) “Substring” from dual;

SELECT DISTINCT ingredientid, foodgroup || '.' AS "with trailing",
TRIM(TRAILING ' ' FROM foodgroup) || '.' AS "without trailing"
FROM ingredients
WHERE inventory > 500;

SELECT ltrim('NISHANT','N') "LTRIM" from dual;

SELECT rtrim('RAMESHA','A') "RTRIM" from dual;

SELECT UPPER(repfname || ' ' || replname) AS rep, LOWER(companyname) AS company
FROM vendors WHERE referredby = 'VGRUS';

SELECT initcap(‘GEORGE BUSH’) “Title” from dual;

SELECT name, POSITION('Salad' IN name)
FROM items;

SELECT instr(‘george bush’,’u’) “instr” from dual;

SELECT name, CHAR_LENGTH(name) AS namelen, CHAR_LENGTH(foodgroup) AS fglen
FROM ingredients;

SELECT length(‘SHARMA’) from dual;

SELECT vendorid, companyname,
TRIM(TRAILING '''S' FROM
TRIM(SUBSTRING(UPPER(companyname) FROM 1 FOR
POSITION(' ' IN companyname)))) AS "CoName"
FROM vendors;

SELECT lpad('page 3',12,'*') "lpad" from dual;

SELECT rpad('page 3',12,'*') "rpad" from dual;

SELECT TRANSLATE('1ddct568','158','249') "Change" from dual;

SELECT name, dateadded, DATE '2005-01-02' - dateadded AS "Days on Menu" FROM items;

SELECT name, EXTRACT(YEAR FROM dateadded) AS year,
EXTRACT(MONTH FROM dateadded + INTERVAL '30' DAY) AS month FROM items;

SELECT SUBSTRING(X'F0' FROM 3) || B'11' AS bits
FROM stores
WHERE storeid LIKE '#%';


select * from employees;
select * from projects;
select * from departments;
select * from workson;
/*ex1 begins*/
--1
CREATE VIEW vrs AS
SELECT ingredientid, name, inventory, inventory * unitprice AS value
FROM ingredients i, vendors v
WHERE i.vendorid = v.vendorid AND companyname = 'Veggies_R_Us';

create view custom as
select firstname || ' ' || lastname as name, assignedtime
from employees e, workson w
where e.employeeid = w.employeeid and w.projectid = 'ROBOSPSE';

select * from custom;
drop view custom;
--2

--3

--4

--5

--6

/*ex1 ends*/
