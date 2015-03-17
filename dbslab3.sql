@ "D:\employee.sql"
@ "D:\restaurant.sql"

SELECT name FROM items WHERE PRICE <= 0.99;

SELECT * FROM items WHERE dateadded > '31-DEC-1999';

SELECT repfname FROM vendors WHERE repfname LIKE 's%';

SELECT companyname FROM vendors WHERE companyname LIKE '%#_%' ESCAPE '#';

SELECT name, price from items where price < 3.50 and name like 'F%' or name like 'S%';

SELECT * FROM vendors WHERE referredby IS NULL;

SELECT * FROM items WHERE PRICE <= 0.99;

/* ex1 begins */
select firstname, lastname from employees;

select * from projects where revenue > 40000;

select deptcode from projects where revenue between 100000 and 150000;

select projectid from projects where startdate <= '1-JUL-2004';

select name from departments where subdeptof IS NULL;

select projectid, description from projects where deptcode in ('ACCNT', 'CNSLT', 'HDWRE');

select * from employees where lastname like '____ware';

select employeeid, lastname from employees where deptcode = 'ACTNG' and salary < 30000;

select * from projects where revenue > 0 and startdate > sysdate or startdate IS NULL;

select * from projects where deptcode = 'ACTNG' or stopdate is null and not revenue <= 50000;
/* end of ex1 */

Select manager, to_char(sysdate,'dd-mm-yyyy') as "As on", address || ' ' || city || ' ' || state || ' '|| zip ||'USA' as mail from stores;

SELECT name, CASE foodgroup WHEN 'Vegetable' THEN 'Good' WHEN 'Fruit' THEN 'Good' WHEN 'Milk' THEN 'Acceptable' WHEN 'Bread' THEN 'Acceptable' WHEN 'Meat' THEN 'Bad' END AS quality FROM ingredients;

SELECT name, FLOOR(
  CASE
    WHEN inventory < 20 THEN 20-inventory
    WHEN foodgroup = 'Milk' THEN inventory * 0.05
    WHEN foodgroup IN ('Meat', 'Bread') THEN inventory * 0.10
    WHEN foodgroup = 'Vegetable' AND unitprice <= 0.03 THEN inventory * 0.10
    WHEN foodgroup = 'Vegetable' THEN inventory * 0.03
    WHEN foodgroup = 'Fruit' THEN inventory * 0.04
    WHEN foodgroup IS NULL THEN inventory * 0.07
    ELSE 0
  END) AS"size", vendorid
FROM ingredients
WHERE inventory < 1000 AND vendorid IS NOT NULL
ORDER BY vendorid,"size";

/* ex2 begins*/
select firstname || ' ' || lastname as "name" from employees;

select distinct deptcode from projects;

select projectid, stopdate-startdate as "duration" from projects;

select projectid, case when stopdate is not null then stopdate-startdate when stopdate is null and startdate < sysdate then sysdate-startdate end as "duration" from projects;

select projectid, revenue/(stopdate-startdate) as "avgRevenue" from projects where stopdate is not null;

select distinct case when stopdate is not null then extract(year from stopdate)-extract(year from startdate) when stopdate is null and startdate < sysdate then extract(year from sysdate)-extract(year from startdate) end as "yearsProjStart" from projects;

select employeeid from workson where assignedtime * 20 >20;
select employeeid from workson where assignedtime * 40 >20;
select employeeid from workson where assignedtime * 60 >20;

select employeeid, case when assignedtime<0.33 then 'part time' when assignedtime>=0.33 and assignedtime<0.67 then 'split time' when assignedtime>=0.67 then 'full time' end as "type" from workson;

select upper(substr(description, 1, 3) || '-' || deptcode) as "abbProjName" from projects;

select projectid, extract(year from startdate) from projects order by projectid asc;

select lastname, salary*1.05 as "New Salary" from employees where salary*1.05>50000;

select employeeid, firstname, lastname, salary*1.1 as "Next Year" from employees where deptcode='HDWRE';

select deptcode, firstname || ' ' || lastname as "Name" from employees order by deptcode, lastname, firstname;
/* end of ex2*/

--todo last page excercises