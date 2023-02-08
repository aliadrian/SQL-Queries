create table Kontaktuppgifter
(
	ID int primary key identity not null,
	Kontakttyp varchar(8) not null,
	Kontaktuppgift varchar(32) unique not null,
	PersonsID int references Persons(ID) null
)

drop table Kontaktuppgifter
drop Table Persons

insert into
	Kontaktuppgifter(Kontakttyp, Kontaktuppgift, PersonsID)
values
	('E-mail', 'foo@gmail.se', 1),
	('Telefon', '070 464 74 31', 1),
	('E-mail', 'li@gmail.com', 2),
	('E-mail', 'jack@gmail.com', 3)

select *
from Kontaktuppgifter

select *
from Persons

insert into
	Kontaktuppgifter(Kontakttyp, Kontaktuppgift, PersonsID)
values
	('E-mail', 'boo@gmail.se', 11)

insert into
	Kontaktuppgifter(Kontakttyp, Kontaktuppgift, PersonsID)
values
	('E-mail', 'foo@gmail.se', 1)

delete from Kontaktuppgifter;
delete from Persons;

insert into Persons(Personnr, FirstName, LastName, YearOfBirth)
	values
	('19620601-1234', 'Håkan', 'Johansson', 1962),
	('19760809-1234', 'Marilyn', 'Johansson', 1976),
	('20091205-1234', 'Kenneth', 'Johansson', 2009)

insert into
	Kontaktuppgifter(Kontakttyp, Kontaktuppgift, PersonsID)
values
	('Telefon', '070 464 74 31', 7),
	('E-post', 'hakan@kvarnskogen.st', 7),
	('Telefon', '073 839 44 13', 8),
	('Telefon', '08 123 45 67', NULL)

select 
	*
from
	Persons join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID

select 
	Persons.*,
	Kontaktuppgifter.Kontakttyp,
	Kontaktuppgifter.Kontaktuppgift
from
	Persons join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID

select *
from Kontaktuppgifter

select *
from Persons

--/* Get the data into a temp table */
--SELECT * INTO #TempTable
--FROM Persons join Kontaktuppgifter on 
--	Persons.ID = Kontaktuppgifter.PersonsID 
--/* Drop the columns that are not needed */
--ALTER TABLE #TempTable
--DROP COLUMN PersonsID
--/* Get results and drop temp table */
--SELECT * FROM #TempTable
--DROP TABLE #TempTable
	
select 
	Persons.*,
	Kontaktuppgifter.Kontakttyp,
	Kontaktuppgifter.Kontaktuppgift
from
	Persons left join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID

select
[FirstName], [LastName]
from 
	Persons left join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID
where 
	Kontaktuppgift is NULL

select 
	Persons.*,
	Kontaktuppgifter.*
from
	Persons right join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID

select
	Kontaktuppgifter.ID,
	Kontaktuppgifter.Kontaktuppgift
from 
	Persons right join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID
where 
	Kontaktuppgifter.PersonsID is NULL

select 
	Persons.*,
	Kontaktuppgifter.*
from
	Persons full join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID

select 
	Persons.*,
	Kontaktuppgifter.*
from
	Persons full join Kontaktuppgifter on 
	Persons.ID = Kontaktuppgifter.PersonsID
where
	Kontaktuppgifter.Kontaktuppgift is NULL
	or
	PersonsID is NULL

update 
	Kontaktuppgifter 
set 
	PersonsID = 6
where 
	ID = 10