create table P2A
(
	ID int primary key identity not null,
	PersonsID int references Persons(ID) not null,
	AddressesID int references Addresses(ID) not null,
	unique(PersonsID,AddressesID)
)

select * from Persons;
select * from Addresses;
select * from P2A;

insert into
	P2A([PersonsID], [AddressesID])
values 
	(6, 1),
	(6, 2),
	(6, 3),
	(7, 2),
	(7, 4)

select 
	Persons.*,
	P2A.*
from
	Persons join P2A on 
	Persons.ID = P2A.PersonsID

select 
	Addresses.*,
	P2A.*
from
	Addresses join P2A on 
	Addresses.ID = P2A.ID

select 
	Persons.*,
	Addresses.*
from
	Persons join P2A on 
	Persons.ID = P2A.PersonsID 
	join Addresses on 
	Addresses.ID = P2A.AddressesID

select 
	Persons.*,
	Addresses.*,
	Kontaktuppgifter.*
from
	Persons join P2A on 
	Persons.ID = P2A.PersonsID 
	join Addresses on 
	Addresses.ID = P2A.AddressesID
	join Kontaktuppgifter on
	Kontaktuppgifter.PersonsID = Persons.ID

select 
	Persons.*,
	Addresses.*,
	Kontaktuppgifter.*
from
	Persons join P2A on 
	Persons.ID = P2A.PersonsID 
	join Addresses on 
	Addresses.ID = P2A.AddressesID
	join Kontaktuppgifter on
	Kontaktuppgifter.ID = Kontaktuppgifter.PersonsID
where
	Persons.FirstName = 'Håkan'
order by 
	ZipCode desc