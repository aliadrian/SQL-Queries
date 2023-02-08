create function AvgWage (@Titel varchar(32)) returns money
begin
    declare
        @returnvalue money
    select
        @returnvalue = AVG(P.Lön)
    from
        Personal as P
    where
        @Titel = Titel
    return
        @returnvalue
end
go

select 
    Titel,
    Namn, 
    Lön, 
    dbo.AvgWage(Titel) as MedelLön
from
    Personal
where 
Lön < dbo.AvgWage(Titel)
group by
    Namn, Lön, Titel
order by 
    Titel,
    Lön
go

create table Products
(
    ID int identity primary key not null,
    ProductName varchar(32) not null,
    Price money not null
)

create table HistoricalPrices
(
ID int identity primary key not null,
ProductsID int references Products(ID)not null,
ChangeDate datetime not null,
NewPrice money not null,
OldPrice money not null
)
go

create trigger Products_update on Products for update as 
begin
    if update(Price)
        insert into
            HistoricalPrices
        select
            D.ID, GETDATE(), I.Price, D.Price
        from
            inserted as I
        join
            deleted as D on
            I.ID = D.ID
end

insert into
    Products
values
    ('Minigris', 3500),
    ('Megagris', 7000),
    ('Ultramegagris', 15000)
go

update
    Products 
set
    Price = 6000
where
    ProductName = 'Megagris'
go

update
    Products 
set
    Price = Price * 1.1
where
    ProductName = ProductName
go

select 
    * 
from 
    HistoricalPrices 
order by 
    ProductsID, 
    ChangeDate desc