SELECT vendors.vendorid, name, companyname 
FROM ingredients, vendors 
WHERE ingredients.vendorid = vendors.vendorid;

SELECT v2.companyname
FROM vendors v1, vendors v2 /*Note the table alias*/
WHERE v1.vendorid = v2.referredby AND v1.companyname = 'Veggies_R_Us';

SELECT items.name, ing.name
FROM items, madewith mw, ingredients ing
WHERE items.itemid = mw.itemid AND mw.ingredientid = ing.ingredientid
AND 3 * mw.quantity > ing.inventory;

SELECT a.name
FROM items a, items q
WHERE a.price > q.price AND q.name = 'Garden Salad';

SELECT companyname, name, vendorid
FROM ingredients JOIN vendors v USING (vendorid)
WHERE v.companyname = 'Veggies_R_Us';

SELECT * FROM ingredients JOIN vendors v USING (vendorid);

select * from vendors;
select * from ingredients;
select * from madewith;
select * from items;

SELECT companyname, i.vendorid, i.name
FROM vendors v FULL JOIN ingredients i ON v.vendorid = i.vendorid;

SELECT i.name, v.companyname AS Vendor
FROM ingredients i
CROSS JOIN vendors v
ORDER BY v.vendorid;
/*Find the names of items that are made from ingredients supplied by Veggies_R_Us*/
SELECT *
FROM vendors NATURAL JOIN ingredients NATURAL JOIN items;

/* ex1 begins */
select * from employees;
select * from departments;
select * from projects;
select * from workson;
--1.a
select firstname || ' ' || lastname as "name"
from employees e, departments d
where e.deptcode = d.code and d.name = 'Consulting';
--1.b
select firstname || ' ' || lastname as "name"
from employees e cross join departments d
where e.deptcode = d.code and d.name = 'Consulting';
--2.a
select firstname, lastname
from employees e, departments d, workson w
where e.employeeid = w.employeeid and e.deptcode = d.code and d.name = 'Consulting' and w.assignedtime > 0.20 and w.projectid = 'ADT4MFIA';
--2.b

--3.a
select sum(assignedtime)
from workson w, employees e
where e.firstname = 'Abe' and e.lastname = 'Advice' and e.employeeid = w.employeeid;
--3.b

--4.a
select distinct description
from projects p, workson w
where p.projectid = w.projectid and w.assignedtime>0.7;
--4.b

--5
select e.employeeid, count(projectid), sum(assignedtime)
from workson w right join employees e on w.employeeid = e.employeeid
group by e.employeeid;
--6
select description 
from projects p left join workson w on p.projectid = w.projectid
where w.employeeid is null;
--7.a
select projectid, max(assignedtime)
from workson
group by projectid;
--7.b

--8.a
select e1.employeeid, e2.lastname as moremoney_lastname
from employees e1, employees e2
where e1.salary < e2.salary
order by e1.employeeid;
--8.b

--9.a
select p1.projectid, count(p2.projectid) as rank
from projects p1, projects p2
where p1.revenue >= p2.revenue
group by p1.projectid;

select projectid from projects order by revenue desc;
--9.b

/* ex1 ends*/
--todo do second excercise, revise first excercise