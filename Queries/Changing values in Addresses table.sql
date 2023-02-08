
select 
	*
from
	Addresses as A
where
	A.Street not like '%väg%'

select 
	*
from
	Addresses as A
where
	A.Street like '%väg%'

select
	A.Street
from
	Addresses as A
where
	A.Street like '%väg%'

select 
	*
from
	Addresses as A
where
	A.Street like 'S%'

update
	Addresses
set
	City = 'Kil', --Nytt värde
	LastUpdated = GETDATE()
 where
	City = 'Kista' --Befintligt värde

update
	Addresses
set
	City = UPPER(city) --Nytt värde
where
	City = 'stockholm' --Befintligt värde

select 
	*
from
	Addresses as A

delete from
	Addresses
where
	City = 'kil'

delete from
	Addresses
where
	LEN(Street) > 16

insert into
	Addresses([Street], [City], [ZipCode], [LastUpdated])
values 
	('Stockholmsgatan 1', 'Stockholm', '123 12', GETDATE()),
	('Stockholmsvägen 2', 'Stockholm', '987 98', GETDATE()),
	('Kistagatan 1', 'Kista', '765 54', GETDATE()),
	('Kistavägen 2', 'Kista', '712 23', GETDATE()),
	('Frontend developer street 32', 'Sillicon Valley', null, GETDATE()),
	('C# Sharp Street 98', 'Gotham', null, GETDATE())

