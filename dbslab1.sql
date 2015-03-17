CREATE TABLE students(
  idno char(12),
  name varchar2(30),
  dob date,
  cgpa number(4,2),
  age number(2));

select * from tab;

INSERT INTO students VALUES ('2012B5A7589','RAJATH SHASHIDHARA','02-Dec-94',8.82,20);
INSERT INTO students(name, idno, age) VALUES('VIPUL R VAIDYA','2012B5A8684',21);

CREATE TABLE staff(
  sid number(10) NOT NULL,
  name varchar2(20),
  dept varchar2(15));

-- INSERT INTO staff(name, dept) VALUES ('YASHVARDHAN SHARMA', 'CSIS');
CREATE TABLE course(
  compcode number(4) UNIQUE,
  courseno varchar2(9) NOT NULL UNIQUE,
  course_name varchar2(20),
  units number(2) not null);

DROP TABLE course;

CREATE TABLE course(
  compcode number(4),
  courseno varchar2(9) NOT NULL,
  course_name varchar2(20),
  units number(2) NOT NULL,
  UNIQUE(compcode, courseno));

CREATE TABLE employee(
  empid number(4) primary key,
  name varchar2(30) not null);
  
create table registered(
  courseno varchar2(9),
  idno char(11),
  grade varchar2(10),
  primary key(courseno, idno));

drop table students;

CREATE TABLE students(
  idno char(12),
  name varchar2(30),
  dob date,
  cgpa number(4,2),
  age number(2),
  constraint pk_students primary key(idno));

drop table course;

create table course (
  compcode number(4),
  courseno varchar2(9) not null,
  course_name varchar2(20),
  units number(2) not null,
  constraint un_course unique(compcode, courseno),
  constraint pk_course primary key(courseno));

drop table registered;

create table registered(
  courseno varchar2(9) references course,
  idno char(11) references students,
  grade varchar2(10),
  primary key(courseno, idno));

drop table registered;

create table registered(
  courseno varchar2(9),
  idno char(11),
  grade varchar2(10),
  constraint pk_registered primary key(courseno, idno),
  constraint fk_cno foreign key(courseno) references course,
  constraint fk_idno foreign key(idno) references students);

drop table registered;

create table registered(
  courseno varchar2(9),
  idno char(11),
  grade varchar2(10),
  constraint pk_registered primary key(courseno, idno),
  constraint fk_cno foreign key(courseno) references course on delete cascade,
  constraint fk_idno foreign key(idno) references students on delete cascade);
  
create table students1(
  idno char(11) primary key, 
  name varchar2(20) not null,
  cgpa number(4,2) check(cgpa >= 2 and cgpa <= 10),
  roomno number(3) check(roomno >99),
  hostel_code varchar2(2) check (hostel_code in ('VK','RP','MB')));

select * from user_tables;
select * from user_constraints;

create table category_details(
  category_id numeric(2),
  category_name varchar(30));
  
create table sub_category_details(
  sub_category_id numeric(2),
  category_id numeric(2),
  sub_cateogry_name varchar(30));

create table product_details(
  product_id numeric(6),
  category_id numeric(2),
  sub_category_id numeric(2),
  product_name  varchar(30));

create table Employees(
  employeeid number(9) PRIMARY KEY,
  firstname varchar(10),
  lastname varchar(20),
  deptcode char(5),
  salary numeric(9,2));

create table departments(
  code char(5) primary key,
  name varchar(30),
  managerid numeric(9),
  subdepotof char(5));

create table projects(
  projectid char(8) primary key,
  deptcode char(5),
  description varchar(200),
  startdate date,
  stopdate date,
  revenue Numeric(12,2));

create table workson(
  employeeid numeric(9),
  projectid char(8),
  assignedtime numeric(3,2));

alter table employees add constraint
  fk_employees_deptcode foreign key(deptcode) references departments;

alter table employees drop constraint fk_employees_deptcode;

alter table employees add constraint
  fk_employees_deptcode foreign key(deptcode) references departments (code);

alter table departments add constraint
  fk_departments_managerid foreign key(managerid) references employees (employeeid);

alter table departments add constraint
  fk_departments_subdepotof foreign key(subdepotof) references departments (code);

alter table projects add constraint 
  fk_projects_deptcode foreign key(deptcode) references departments (code);
  
alter table workson add constraint
  fk_workson_employeeid foreign key(employeeid) references employees (employeeid);

alter table workson add constraint 
  fk_workson_projectid foreign key(projectid) references projects (projectid);

alter table workson add constraint
  uq_workson unique(projectid, employeeid);
