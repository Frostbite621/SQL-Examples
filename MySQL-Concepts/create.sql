--Create tables from an erd
--Demonstrate knowledge of CREATE statements in MySQL 
--alter table statements to create foreign keys and link the tables together

drop table shipmentline;
drop table shipment;
drop table Orderline;
drop table Inventory;
drop table Category;
drop table Orders;
drop table Customer;
drop table OrderSource;

create table OrderSource(
osid int primary key,
osdec varchar(30));

create table Customer(
CID int primary key,
CLast varchar(30),
CFirst varchar(30),
cmi char(1),
cbirthdate date,
caddress varchar(50),
ccity varchar(30),
cstate char(2),
czip varchar(10),
CPhone1 varchar(12),
CPhone2 varchar(12),
cuserid varchar(50),
cpassword varchar(15));

create table Orders(
oid int primary key,
odate date,
omethpmt varchar(10),
CID int,
osid int);

alter table Orders add constraint ordersCIDfk foreign key (CID) references Customer(CID);
alter table Orders add constraint ordersosidfk foreign key (osid) references OrderSource(osid);

create table Category(
catid int primary key,
catdesc varchar(40));

create table Inventory(
invid int primary key,
invsize varchar(10),
invprice decimal(6,2),
invqoh int,
itemdesc varchar(30),
color varchar(20),
catid int);

alter table Inventory add constraint inventorycatidfk foreign key (catid) references Category(catid);

create table Orderline(
oid int not null,
invid int not null,
olquantity int);

alter table Orderline add constraint orderlinepk primary key (oid, invid);
alter table Orderline add constraint orderlineoidfk foreign key (oid) references Orders(oid);
alter table Orderline add constraint orderlineinvidfk foreign key (invid) references Inventory(invid);

create table Shipment(
shipid int primary key,
shipdate date,
arrivaldate date);

create table shipmentline(
shipid int not null,
invid int not null,
slquantityordered int,
slquantityreceived int);

alter table shipmentline add constraint shipmentlinepk primary key (shipid, invid);
alter table shipmentline add constraint shipmentlineshipidfk foreign key (shipid) references shipment(shipid);
alter table shipmentline add constraint shipmentlineinvidfk foreign key (invid) references inventory(invid);
