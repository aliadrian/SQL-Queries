drop table Addresses

create table Addresses
(
	ID int primary key identity not null,
	Street varchar (32) not null,
	City varchar (32)not null,
	ZipCode varchar (16) null,
	LastUpdated datetime not null,
	unique (Street,City,ZipCode)
)

create table Persons
(
	ID int primary key identity not null,
	Personnr varchar(13) unique not null,--ÅÅÅÅMMDD-NNNN...)
	FirstName varchar(32) null,
	LastName varchar(32) null,
	YearOfBirth int null,
)

insert into
	Addresses([Street], [City], [ZipCode], [LastUpdated])
values 
	('Stockholmsgatan 1', 'Stockholm', '123 12', GETDATE()),
	('Stockholmsvägen 2', 'Stockholm', '987 98', GETDATE()),
	('Kistagatan 1', 'Kista', '765 54', GETDATE()),
	('Kistavägen 2', 'Kista', '712 23', GETDATE()),
	('Frontend developer street 32', 'Sillicon Valley', null, GETDATE())


insert into 
	Persons([Personnr], [FirstName], [LastName], [YearOfBirth])
values
	(20021201-0102, 'Foo', 'Bar', 2002),
	(20010713-3212, 'Li', 'An', 2001),
	(19970326, 'Jack', 'Sparrow', 1997),
	(19991109, 'Nathalie', 'Portman', 1999),
	(19930713, 'Brad', 'Pitt', 1993)

select 
	*
from 
	Addresses

select 
	*
from 
	Persons

create table Fruits
(
	ID int primary key identity not null,
	FruitType varchar(13) not null,
	FruitName varchar(32) null,
	PricePerKg money null,
	unique (FruitType, FruitName)
)

insert into 
	Fruits([FruitType], [FruitName], [PricePerKg])
values

	('Pear', 'Valencia', 20),
	('Pear', 'Mandarin', 26),
	('Orange', 'Valencia', 20),
	('Orange', 'Mandarin', 27),
	('Orange', 'Blood', 22),
	('Banana', 'Chiquita', 20),
	('Banana', 'Dole', 27),
	('Banana', 'Del Monte', 22)

select *
from Fruits
	
	update
	Fruits
set
	FruitName = 'Bartlett' --Nytt värde
	
 where
	ID = 7 --Befintligt värde

select 
	*
from Fruits

where PricePerKg < 30

select
	*
from Fruits
where FruitType = 'Orange' and PricePerKg > 25

select *
from Fruits
where (FruitType = 'Pear' or FruitType = 'Orange') and PricePerKg > 25

select
P.FirstName,P.LastName,P.YearOfBirth 
from Persons as P
order by
--P.LastName asc,--asc är förvaltoch behöver inte anges!
--P.YearOfBirth desc
--P.FirstName asc,
P.YearOfBirth asc

select
 *
from Fruits
order by
--FruitType asc,
PricePerKg desc

select
 *
from Fruits
order by
FruitType,
PricePerKg asc