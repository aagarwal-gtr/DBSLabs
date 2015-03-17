SELECT NAME FROM ingredients WHERE VENDORID=(SELECT VENDORID FROM VENDORS WHERE COMPANYNAME = 'Veggies_R_Us');

SELECT NAME FROM INGREDIENTS WHERE VENDORID IN (SELECT VENDORID FROM VENDORS WHERE COMPANYNAME='Veggies_R_Us' OR COMPANYNAME='Spring Water Supply');

SELECT AVG(UNITPRICE) AS avgprice FROM ingredients WHERE vendorid in (select vendorid from vendors where companyname='Veggies_R_Us');

SELECT name from ingredients where inventory between (select avg(inventory)*0.75 from ingredients) and (select avg(inventory)*1.25 from ingredients);

SELECT companyname
FROM vendors
WHERE (referredby IN
(SELECT vendorid
FROM vendors
WHERE companyname = 'Veggies_R_Us')) AND
(vendorid IN
(SELECT vendorid
FROM ingredients
WHERE foodgroup = 'Milk'));

SELECT name, price
FROM items
WHERE itemid IN
(SELECT itemid --Subquery 3
FROM madewith
WHERE ingredientid IN
(SELECT ingredientid --Subquery 2
FROM ingredients
WHERE vendorid =
(SELECT vendorid --Subquery 1
FROM vendors
WHERE companyname = 'Veggies_R_Us')));

SELECT companyname
FROM vendors
WHERE vendorid NOT IN
(SELECT vendorid
FROM ingredients
WHERE inventory > 100 AND vendorid IS NOT NULL);

SELECT companyname 
FROM vendors
WHERE referredby
NOT IN (
SELECT vendorid
FROM vendors
WHERE companyname='No Such Company'
);

SELECT DISTINCT items.itemid, price FROM items JOIN madewith ON items.itemid=madewith.itemid WHERE ingredientid IN(SELECT ingredientid FROM ingredients JOIN vendors on vendors.vendorid=ingredients.vendorid WHERE companyname='Veggies_R_Us');

SELECT itemid, name
FROM items WHERE (SELECT COUNT(*) FROM madewith WHERE madewith.itemid = items.itemid) >= 3;

SELECT * FROM meals m WHERE EXISTS ( SELECT * FROM partof p JOIN items on p.itemid = items.itemid JOIN madewith on items.itemid=madewith.itemid JOIN ingredients on madewith.ingredientid=ingredients.ingredientid WHERE foodgroup='Milk' AND m.mealid=p.mealid);

SELECT name, unitprice * inventory AS "Inventory Value",
(SELECT MAX(unitprice * inventory)
FROM ingredients) AS "Max. Value",
(unitprice * inventory) / (SELECT AVG(unitprice * inventory)
FROM ingredients) AS "Ratio"
FROM ingredients;

SELECT name, (SELECT companyname
FROM vendors v
WHERE v.vendorid = i.vendorid) AS "supplier"
FROM ingredients i;
/* Ex begins */
--1
select firstname, lastname 
from employees e, departments d
where e.deptcode = d.code and d.name = 'Consulting';
--2
select firstname, lastname
from employees e, departments d, workson w
where e.employeeid = w.employeeid and 
      e.deptcode = d.code and
      d.name = 'Consulting' and
      w.assignedtime > 0.20 and
      w.projectid = 'ADT4MFIA';
--3
select sum(assignedtime)
from workson w, employees e
where e.firstname = 'Abe' and e.lastname = 'Advice' and e.employeeid = w.employeeid;
--4
select name from departments where not exists (select deptcode from projects where projects.deptcode=departments.code);
--5
select firstname, lastname from employees where salary > (select avg(salary) from employees 
join departments on employees.deptcode=departments.code where departments.name='Accounting');
--6
select distinct description
from projects p, workson w
where p.projectid = w.projectid and w.assignedtime>0.7;
--7
select firstname, lastname from employees where salary > some (select salary from employees
join departments on employees.deptcode=departments.code where departments.name='Accounting');
--8
select min(salary) from employees where salary > all (select salary from employees 
join departments on employees.deptcode=departments.code where departments.name='Accounting');
--9
select firstname, lastname from employees where salary = (select max(salary) from employees where deptcode='ACCNT') and deptcode='ACCNT';
--10
select employees.employeeid from employees join workson on workson.employeeid = employees.employeeid where deptcode = 'ACCNT' and
assignedtime>0.5 and projectid in (select projectid from projects where deptcode NOT IN ('ACCNT')) order by assignedtime ASC;
--11
select * from departments;
select * from employees;
select * from projects;
select * from workson;

--12
--a

--b

--c

--d

--e

--f

--g

--h

--i

/* Ex ends */
--todo do q10, 12