--Create historical schema to make a historical entity
--Demonstrate knowledge of creating schema
--Demonstrate knowledge of linking historical entitys

create schema historical;

drop table historical.supervisor;
drop table historical.employee;
drop table employee;

create table Employee(
empid int primary key,
name varchar(20),
salary varchar(10),
title varchar(20),
supervisorid int not null);

alter table Employee add constraint employee_supervisoryid_fk foreign key (supervisorid) references Employee(empid);

create table historical.employee(
empid int primary key,
name varchar(20),
salary varchar(10),
title varchar(20));

create table historical.supervisor(
empid int not null,
supervisorid int not null,
startdate date,
enddate date);


alter table historical.supervisor add constraint historicalsupervisor_fk foreign key (supervisorid) references historical.employee(empid);
alter table historical.supervisor add constraint historicalsupervisor_fk2 foreign key (empid) references historical.employee(empid);
alter table historical.supervisor add constraint historicalsupervisor_pk primary key (empid, supervisorid);
