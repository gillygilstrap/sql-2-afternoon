SQL 2 Afternoon



----------------------------------------- PRACTICE JOINS ---------------------------------------------------

------------ 1 ------------
-- Select *
-- from Invoice i
-- join InvoiceLine il
-- on il.invoiceId = i.invoiceId
-- where il.UnitPrice > 0.99;

------------ 2 ------------
-- select i.InvoiceDate, c.FirstName, c.Lastname, i.Total
-- from Invoice i
-- join Customer c on i.CustomerId = c.CustomerId;

------------ 3 ------------
-- select c.FirstName, c.LastName, e.FirstName, e.Lastname
-- from Customer c
-- join Employee e
-- on c.SupportRepId = e.EmployeeId;

------------ 4 ------------
-- select al.Title, ar.Name
-- from Album al
-- join Artist ar
-- on al.ArtistId = ar.ArtistId

------------ 5 ------------
-- select pt.TrackId
-- from PlaylistTrack pt
-- join Playlist p on pt.PlaylistId = p.PlaylistId
-- where p.Name = "Music";

------------ 6 ------------
-- select t.name, pt.PlaylistId
-- from Playlist p
-- join PlaylistTrack pt
-- on p.PlaylistId = pt.PlaylistID
-- join Track t
-- on t.TrackId = pt.TrackId
-- where pt.PlaylistId = 5;

------------ 7 ------------
-- select t.Name, p.Name
-- from Playlist p
-- join PlaylistTrack pt
-- on p.PlaylistId = pt.PlaylistId
-- join Track t
-- on pt.TrackId = t.TrackId

------------ 8 ------------
-- select t.name , a.Title
-- from Track t
-- join Genre g
-- on t.GenreId = g.GenreId
-- join Album a
-- on t.AlbumId = a.AlbumId
-- where g.Name = "Alternative"



----------------------------------------- PRACTICE NESTED QUERIES ---------------------------------------------------

------------ 1 ------------
-- select * 
-- from Invoice 
-- where InvoiceId in (select InvoiceId from InvoiceLine where UnitPrice > 0.99);

------------ 2 ------------
-- SELECT *
-- FROM PlaylistTrack
-- WHERE PlaylistId IN ( SELECT PlaylistId FROM Playlist WHERE Name = "Music" );

------------ 3 ------------
-- elect t.Name
-- from Track t
-- where t.TrackId in (select TrackId from PlayListTrack where PlaylistId = 5)

------------ 4 ------------
-- select *
-- from Track
-- where GenreId in (select GenreId from Genre where Name = "Comedy")

------------ 5 ------------
-- select *
-- from Track 
-- where AlbumId in (select AlbumId from Album where Title = "Fireball");

------------ 6 ------------
/* select *
from Track 
where AlbumId in (
	select AlbumId from Album
  	where ArtistId in (
      select ArtistId from Artist
      where Name = "Queen" 
    )
) */



----------------------------------------- PRACTICE NESTED QUERIES ---------------------------------------------------

------------ 1 ------------
-- UPDATE Customer
-- SET fax = null
-- where fax is not null;

------------ 2 ------------
-- UPDATE Customer
-- SET Company = "Self"
-- where Company is null;
    
------------ 3 ------------
-- update Customer
-- set LastName = "Thompson"
-- where FirstName = "Julia" and LastName = "Barnett";

------------ 4 ------------
-- update Customer
-- set SupportRepId = 4
-- where Email = "luisrojas@yahoo.cl";

------------ 5 ------------
-- update Track
-- set Composer = "The darkness around us"
-- where GenreId in (select GenreId from Genre where Name = "Metal")
-- and Composer is null;


----------------------------------------- PRACTICE GROUP BY --------------------------------------------------

------------ 1 ------------
-- select g.Name, count(t.TrackId) 
-- from Track t
-- join Genre g
-- on g.GenreId = t.GenreId
-- group by g.name

------------ 2 ------------
-- select count(*), g.Name
-- from Track t
-- join Genre g
-- on g.GenreId = t.GenreId
-- where g.Name = "Pop" or g.Name = "Rock"
-- group by g.Name

------------ 3 ------------
-- select ar.Name, count(al.AlbumId)
-- from Artist ar
-- join Album al
-- on ar.ArtistId = al.ArtistId
-- group by ar.Name;


----------------------------------------- PRACTICE USE DISTINCT --------------------------------------------------

------------ 1 ------------
-- select distinct Composer
-- from Track

------------ 2 ------------
-- select distinct BillingPostalCode
-- from Invoice;

------------ 3 ------------
-- select distinct Company
-- from Customer;


----------------------------------------- PRACTICE DELETE ROW --------------------------------------------------

------------ 1 ------------
-- delete from practice_delete where Type = "bronze";

------------ 2 ------------
-- delete from practice_delete where Type = "silver"

------------ 3 ------------
-- delete from practice_delete where Value = 150


----------------------------------------- PRACTICE DELETE ROW --------------------------------------------------

------------ 1 ------------
create table Users (
    id integer primary key AUTOINCREMENT,
	Name string,
    Email string
);

create table Products (
  	id integer primary key AUTOINCREMENT,
	Name string,
    Price decimal
);
create table Orders (
  	id integer primary key AUTOINCREMENT,
	product_id refrences Products (id)
);

------------ 2 ------------

insert into Users (Name, Email)
Values
  ('Daniel', 'gmail@daniel.com'),
  ('Tyler', 'gmail@t$.com'),
  ('Daniel', 'gmail@danny.luv');

insert into Products (Name, Price)
Values
	("chair", 23.00),
    ("towell", 1.89),
    ("cup", 22.00);

insert into Orders (product_id)
Values
  (1),
  (2),
  (3);

------------ 4 ------------

select p.Name
from Orders o 
join Products p
on p.id = o.product_id
where o.id = 1;
--
select * from Orders
--------------

select sum(p.price)
from Orders o
join Products p
on p.id = o.product_id
where o.product_id = 1

--

Alter Table Orders add column user_id integer references Users (id);

----

 update Orders 
set user_id = 1
where Orders.id = 2;
 
 update Orders 
set user_id = 6
where Orders.id = 3;

update Orders 
set user_id = 2
where Orders.id = 4;

update Orders 
set user_id = 5
where Orders.id = 5;

update Orders 
set user_id = 7
where Orders.id = 6;

update Orders 
set user_id = 4
where Orders.id = 7;
---
select  *
from Orders 
where user_id = 1;
------------------------------------------
select  u.Name, count(o.id)
from Orders o
join Users u
on u.id = o.user_id
group by user_id;






