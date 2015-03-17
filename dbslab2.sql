select * from tab;

CREATE TABLE students_copy(idno, name, dob, cga, age) AS
SELECT idno, name, dob, cgpa, age
FROM students;

select * from students_copy;

CREATE OR REPLACE TYPE phone_t AS OBJECT ( a_code CHAR(3), p_number CHAR(8));

CREATE TABLE phone ( per_id NUMBER(10), per_phone phone_t);

INSERT INTO phone (per_id, per_phone) VALUES (1, phone_t('206', '555-1212'));

SELECT p.per_phone.p_number FROM phone p WHERE p.per_phone.a_code = '206';

SELECT p.per_phone.P_number FROM phone p;

alter table staff add email varchar(20);
alter table students add hostel varchar(20);

alter table students add constraint agecheck check(age>15);

select * from students;
alter table students add (
testcol number(9) NOT NULL, --add a new column
constraint agecheck check(age>15),
constraint studnetpk primary key(idno),
constraint cgcheck check(cgpa>=2.0)
);

alter table course drop constraint un_course;
CREATE SEQUENCE customers_seq
START WITH 1000
INCREMENT BY 1
NOCACHE
NOCYCLE;
SELECT customers_seq.CURRVAL FROM DUAL;
SELECT customers_seq.NEXTVAL FROM DUAL;
create table customers(
customer_id number(9) primary key,
customer_name char(50)
);

INSERT INTO CUSTOMERS(CUSTOMER_ID, CUSTOMER_NAME) VALUES (customers_seq.nextval,’Jiva’);

drop table Category_details;
CREATE TABLE Category_details(
category_id numeric(2),
category_name varchar (30) );

drop table Sub_category_details;
create table Sub_category_details(
sub_category_id numeric(2),
category_id numeric(2),
sub_category_name varchar(30));

drop table Product_details;
create table Product_details(
Product_id numeric (6),
category_id numeric(2),
sub_category_id numeric(2),
product_name varchar(30));

alter table Category_details add primary key(category_id);
alter table Sub_category_details add constraint pk_sub_category_details primary key(sub_category_id);
alter table Sub_category_details add constraint fk_catid_subdetails foreign key(category_id) references Category_details(category_id);

alter table Product_details add constraint pk_prod_details add primary key(product_id);
alter table Product_details add constraint fk_catid_proddetails foreign key(category_id) references Category_details(category_id);
alter table Product_details add constraint fk_subcatid_proddetails foreign key(sub_category_id) references Category_details(sub_category_id);

alter table product_details add price numeric(2);
alter table product_details modify price numeric(6,2);

select * from product_details;

insert into category_details values (1,'x');

insert into sub_category_details values (2, 1, 'y');

insert into Product_details (Product_id, category_id, sub_category_id, product_name, price) values (101, 1, 2, 'a', 500.50);
insert into Product_details (Product_id, category_id, sub_category_id, product_name, price) values (102, 1, 2, 'b', 300.10);
insert into Product_details (Product_id, category_id, sub_category_id, product_name, price) values (103, 1, 2, 'c', 350.20);
insert into Product_details (Product_id, category_id, sub_category_id, product_name, price) values (104, 1, 2, 'd', 100.00);

alter table Product_details drop column price;
alter table Category_details rename to Cat_dt;
alter table Product_details add brand_name varchar(20);
update Product_details set brand_name='x' where brand_name is null;
alter table Product_details modify brand_name not null;
