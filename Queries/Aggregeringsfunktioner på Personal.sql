select
	AVG(Lön) as Medellön,
	SUM(Lön) as [Summan av alla löner],
	COUNT(*) as [Antal anställda],
	MAX(Lön) as [Högsta lön],
	MIN(Lön) as [Lägsta lön]
from
	Personal

select 
	*
from 
	Personal
go

select 
	P.Titel,
	P.Sektion,
	AVG(Lön) as Medellön,
	SUM(Lön) as [Summan av alla löner],
	COUNT(*) as [Antal anställda],
	MAX(Lön) as [Högsta lön],
	MIN(Lön) as [Lägsta lön]
from
	Personal as P
--where 
--	P.Titel = 'Lagerarbetare'
group by 
	P.Titel,
	P.Sektion
having 
	MAX(Lön) < 10000
order by
	P.Titel,
	P.Sektion

select
	P.Titel,
	MIN(Lön) as [Lägsta Lön],
	MAX(Lön) as [Högsta Lön],
	COUNT(*) as [Antal anställda]
from 
	Personal as P
group by
	P.Titel
having
	COUNT(*) > 1
order by 
	MAX(Lön) desc




	use
	Mercury

--drop table Personal
--go

create table Personal
(
	ID int primary key not null,
	Sektion int null,
	Titel varchar(32) null,
	Namn varchar(32) not null,
	Lön money not null,
	ChefsID int references Personal(ID) null
)
go

insert into
	Personal(ID, Sektion, Titel, Namn, Lön, ChefsID)
values
	(1000, 1, 'Ägare', 'Tord Lantz', 45000.00, NULL),
	(1001, 2, 'Ägare', 'Tony Lantz', 45000.00, NULL),	
	(1002, 1, 'Verksamhetschef', 'Magnus Palmgren', 38500.00, 1000),
	
	(1003, 1, 'Marknadschef', 'Peter Andersson', 37250.00, 1000),
	
	(1004, 2, 'Inköpare', 'Jonas Karlström', 26000.00, 1003),
	
	(1005, 2, 'Säljare/Färskvaruansvarig', 'Håkan Lundberg', 21000.00, 1003),
	(1006, 2, 'Säljare', 'Tomas Müller', 23750, 1003),
	(1007, 3, 'Säljare', 'Jakob Werkelin', 22400.00, 1003),
	
	(1008, 2, 'Innesäljare', 'Claes Danielsson', 15800.00, 1006),
	(1009, 2, 'Innesäljare', 'Jennie Larsson', 13900.00, 1006),
	(1010, 3, 'Innesäljare', 'Kicki Sortti', 16650.00, 1006),
	
	(1011, 2, 'Lagerchef', 'Per Funck', 32200.00, 1002),
	(1012, 2, 'Transportledare', 'Patrik Norberg', 22250.00, 1011),
	(1013, 2, 'Teknik & service', 'Mattias Öhman', 18100.00, 1012),
	
	(1014, 2, 'Chaufför', 'Johan Alm', 12000.00, 1012),
	(1015, 2, 'Chaufför', 'Stefan Bandinge', 9950.00, 1012),
	(1016, 3, 'Chaufför', 'Ludvig Molin', 11200.00, 1012),
	(1017, 3, 'Chaufför', 'Kjell "Charlie" Zetterblom', 7500.00, 1012),	
	
	(1018, 3, 'Lagerarbetare', 'Johnny Andersson', 8000.00, 1011),
	(1019, 3, 'Lagerarbetare', 'Tobias Olsson', 9000.00, 1011),
	(1020, 1, 'Lagerarbetare', 'Christer Sjögren', 10000.00, 1011),
	(1021, 1, 'Lagerarbetare', 'Kent Thomsson', 11800.00, 1011),

	(1022, 2, 'Grönsaksansvarig', 'Johan Andersson', 23300.00, 1002),
	(1023, 3, 'Godsmottagare', 'Christer Olofsson', 13450.00, 1011),
	
	(1024, null, '', 'Jerry Söderberg', 6000.00, 1002),
	(1025, null, '', 'Johan Sjögren', 17700.00, 1002),
	
	(1026, 4, 'IT-ansvarig/Anbud', 'Thomas Häggqvist', 34000.00, 1000),
	(1027, 4, 'IT', 'John Lantz', 28250.00, 1026),
	
	(1028, 1, 'Administration', 'Ingela Buskas', 14500.00, 1002),
	(1029, 1, 'Ekonomi/Lönehandläggare', 'Tina Karlsson', 22300.00, 1002),
	(1030, 2, 'Receptionist', 'Pernilla Norberg', 12800.00, 1002),
	(1031, 4, 'Jeevesutvecklare', 'Håkan Johansson', 10000.00, 1026)

select *
from personal
order by 
ID asc

select 
	p.*, 
	'***',
	c.*
from 
	personal as P
join 
	personal as C
	on p.ChefsID = c.ID
order by 
	c.ID,
	p.Titel

select 
	p.*, 
	'***',
	c.*
from 
	personal as P
left join 
	personal as C
	on p.ChefsID = c.ID
order by 
	c.ID,
	p.Titel