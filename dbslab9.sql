CREATE OR REPLACE PACKAGE cust_sal AS
PROCEDURE find_sal(c_id customers.id%type);
END cust_sal; 

CREATE OR REPLACE PACKAGE BODY cust_sal AS
PROCEDURE find_sal(c_id customers.id%TYPE) IS
c_sal customers.salary%TYPE;
BEGIN
SELECT salary INTO c_sal
FROM customers
WHERE id = c_id;
dbms_output.put_line('Salary: '|| c_sal);
END find_sal;
END cust_sal; 

DECLARE
code customers.id%type := &cc_id;
BEGIN 
cust_sal.find_sal(code);
END;

CREATE OR REPLACE PACKAGE c_package AS
-- Adds a customer
PROCEDURE addCustomer(c_id customers.id%type,
c_name customers.name%type,
c_age customers.age%type,
c_addr customers.address%type,
c_sal customers.salary%type);
-- Removes a customer
PROCEDURE delCustomer(c_id customers.id%TYPE);
-- Lists all customers
PROCEDURE listCustomer;
END c_package; 

CREATE OR REPLACE PACKAGE BODY c_package AS
PROCEDURE addCustomer(c_id customers.id%type,
c_name customers.name%type,
c_age customers.age%type,
c_addr customers.address%type,
c_sal customers.salary%type) IS
BEGIN
INSERT INTO customers (id,name,age,address,salary)
VALUES(c_id, c_name, c_age, c_addr, c_sal);
END addCustomer;
PROCEDURE delCustomer(c_id customers.id%type) IS
BEGIN
DELETE FROM customers
WHERE id = c_id;
END delCustomer; PROCEDURE listCustomer IS
CURSOR c_customers is
SELECT name FROM customers;
TYPE c_list is TABLE OF customers.name%type;
name_list c_list := c_list();
counter integer :=0;
BEGIN
FOR n IN c_customers LOOP
counter := counter +1;
name_list.extend; 
name_list(counter) := n.name;
dbms_output.put_line('Customer(' ||counter||
')'||name_list(counter));
END LOOP;
END listCustomer;
END c_package;

DECLARE
code customers.id%type:= 8;
BEGIN
c_package.addcustomer(7, 'Rajnish', 25, 'Chennai', 3500);
c_package.addcustomer(8, 'Subham', 32, 'Delhi', 7500);
c_package.listcustomer;
c_package.delcustomer(code);
c_package.listcustomer;
END; 

CREATE OR REPLACE TRIGGER emp_update_chk
BEFORE UPDATE ON EMP
BEGIN
IF (TO_CHAR (sysdate, 'HH24') BETWEEN '14' AND '18')
THEN
RAISE_APPLICATION_ERROR (-20555, 'You cannot modify EMP
table during 14:00 to 18:00 Hrs');
END IF;
END;

UPDATE emp
Set sal = sal+2500
Where job ='ANALYST';

-- create a main table and its shadow table
CREATE TABLE parts (pnum NUMBER(4), pname VARCHAR2(15));
CREATE TABLE parts_log (pnum NUMBER(4), pname
VARCHAR2(15));
-- create a trigger that inserts into the shadow table before each insert into the main table
CREATE TRIGGER parts_trig
BEFORE INSERT ON parts FOR EACH ROW
DECLARE
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
INSERT INTO parts_log VALUES(:new.pnum, :new.pname);
COMMIT;
END;
-- insert a row into the main table, and then commit the insert
INSERT INTO parts VALUES (1040, 'Head Gasket');
COMMIT;
-- insert another row, but then roll back the insert
INSERT INTO parts VALUES (2075, 'Oil Pan');
ROLLBACK;
- show that only committed inserts add rows to the main table
SELECT * FROM parts ORDER BY pnum;
-- show that both committed and rolled-back inserts add rows to the shadow table
SELECT * FROM parts_log ORDER BY pnum;