# SQL til opgaven Onsdag d. 7. marts 2018

## Opgave 1
```SQL
CREATE VIEW AllEmployees  
AS  
SELECT e.Emp_Id, e.FName, e.LName, d.Dept_Name, e.Zip, zc.City, m.Manager 
  FROM EX32_Employee AS e join EX32_Department as d on e.Dep_Id = d.Dep_Id 
    join EX32_ZipCity as zc on e.Zip = zc.Zip join EX32_Manager as m on d.Dep_Id = m.Dep_Id;   
GO  
-- Query the view  
SELECT *
FROM AllEmployees
```

## Opgave 2
```SQL
ALTER VIEW AllOrderLines
AS
  SELECT 
    O.Order_Id, c.FName, c.LName, CONVERT(DATE,O.Order_Date) AS Order_date, p.Prod_Name,p.Price,ol.Amount
    FROM EX32_Order as O Join EX32_Customer as c on o.Customer = c.Customer_Id 
      join EX32_OrderLine as ol on o.Order_Id = ol.Order_Id 
      join EX32_Product as p on ol.Product_Id = p.Product_Id
go
-- Query the view
Select * from AllOrderLines
```

## Opgave 3
```SQL
Alter VIEW Administration
AS
  SELECT e.FName, e.LName, zc.Zip, zc.City
    FROM EX32_Employee as e join EX32_ZipCity as zc on e.Zip = zc.Zip   
      join EX32_Department as d on e.Dep_Id = d.Dep_Id
    where d.Dept_Name = 'Administration'
go
-- Query the view
Select * from Administration
```
## Opgave 4
```SQL
Create Table EX32_DeletedCustomer
(
-- Note no PK or even identity as data are inserted "as is"
  Id int,
  FName NVARCHAR(40),
  LName NVARCHAR(40),
  Zip NVARCHAR(4)
)
```

### Opgave 4 trigger
```SQL
Create trigger AfterDeleteCustomer on EX32_Customer
AFTER DELETE
as
	declare @CustormerId int;
	declare @FName NVARCHAR(40);
	declare @LName NVARCHAR(40);
	declare @hest NVARCHAR(4);

	select @CustormerId=d.Customer_Id from deleted d;
	select @FName=d.FName from deleted d;
	select @LName=d.LName from deleted d;
	select @hest=d.Zip from deleted d;

	insert into EX32_DeletedCustomer (Id, FName, LName, Zip) values (@CustormerId,@FName,@LName,@hest);

	Print 'AFTER DELETE TRIGGER fired'
go
```
### test trigger
```SQL
-- Try inserting a new customer, and the deleting same customer.
select * from EX32_Customer;
delete from EX32_Customer where Customer_Id = 1;
select * from EX32_DeletedCustomer;

```

## Opgave 5 forsøg med værdier
```SQL
Select o.Customer, sum(ol.Amount*p.Price)
  From EX32_Order as o join EX32_OrderLine as ol on o.Order_Id = ol.Order_Id
	  join EX32_Product as p on ol.Product_Id = p.Product_Id
  where Paid = 0 and Customer = 5 group by Customer --order by o.Customer asc

 -- trigger, not done
 Create Trigger Exercise5Over1600 on EX32_Order
 After Insert
	declare @CustomerIdBob int;
 ```



