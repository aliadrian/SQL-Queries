create database Mercury

create table Persons
(
	FirstName nvarchar(32) null,
	LastName nvarchar(64) not null,
	Age int null
)

create table Addresses
(
	Street nvarchar(64) not null,
	City nvarchar(32) not null,
	ZipCode nvarchar(6) null,
	LastUpdated datetime not null
)

insert into
	Addresses([Street], [City], [ZipCode], [LastUpdated])
values 
	('Stockholmsgatan 1', 'Stockholm', '123 12', GETDATE()),
	('Stockholmsvägen 2', 'Stockholm', '987 98', GETDATE()),
	('Kistagatan 1', 'Kista', '765 54', GETDATE()),
	('Kistavägen 2', 'Kista', '712 23', GETDATE()),
	('Frontend developer street 32', 'Sillicon Valley', null, GETDATE()),
	('C# Sharp Street 98', 'Gotham', null, GETDATE())


insert into 
	Persons
values
	('Foo', 'Bar', 20),
	('Li', 'Ann', 21)
	
go

	ALTER TABLE [dbo.Persons] ALTER COLUMN [LastName] INTEGER NOT NULL

select *
from Addresses

select
A.Street,A.ZipCode
from
Addresses as A --A är ett tabell-alias 
where A.City ='Stockholm'

select
A.Street as Gata,--Gata är ett fält-alias
A.ZipCode as Postnummer --Postnummer är ett fält-alias
from Addresses as A
where A.City ='Stockholm'

select --Lista personer med okänd ålder.
*
from
Persons
where
Age is null