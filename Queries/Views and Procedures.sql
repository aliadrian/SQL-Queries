alter view Adressbok as
 select 
	Personnr,
	FirstName as [Förnamn],
	LastName as [Efternamn],
	Street as [Gata],
	City as [Stad],
	ZipCode as [Postnummer],
	Kontakttyp,
	Kontaktuppgift
 from 
	Addresses as A 
join 
	P2A on A.ID = P2A.AddressesID
join 
	Persons as P on P.ID = P2A.PersonsID
join 
	Kontaktuppgifter as K on K.PersonsID = P.ID
 go

select 
	FirstName, 
	LastName, 
	Kontaktuppgift 
from 
	Adressbok
order by 
	LastName asc, 
	FirstName asc

select 
	Förnamn, Efternamn, Kontaktuppgift 
from 
	Adressbok
group by
	Förnamn, Efternamn, Kontaktuppgift 
order by 
	Efternamn asc, 
	Förnamn asc

select * from Persons;
select * from Kontaktuppgifter;
select * from Addresses;
go

create procedure HighestWages as
begin
	select 
		Namn, Lön
	from 
		Personal
	where 
		Lön > 30000
	order by 
		Lön desc
end
go

execute HighestWages
go

create procedure AverageSalary @titel varchar(32), @sektion int as
select 
	Namn,
	AVG(Lön) as Medellön
from Personal
where 
Titel = @titel
 and Sektion = @sektion
group by Namn
go

execute AverageSalary 'Lagerarbetare', 1

execute AverageSalary 'Chaufför', 3
go

alter procedure AddFruit @typ varchar(32), @namn varchar(32), @pris money as
insert into Fruits
values (@typ, @namn, @pris)
select *
from Fruits
where 
@typ = Fruits.FruitType
go

execute AddFruit 'Banana', 'Helt annat', 32

select * from Fruits
go

alter procedure AverageSalary @titel varchar(32), @sektion int as
select 
	Titel,
	Sektion,
	COUNT(*) as [Antalet anställda]
from Personal
where 
Titel = @titel
 and Sektion = @sektion
 group by Titel, Sektion
go

execute AverageSalary 'Lagerarbetare', 1