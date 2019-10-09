
insert AWDataWarehouseMZ.dbo.DimEmployee
select e.EmployeeID, e.FirstName, e.LastName, e.EmailAddress, 
e.Title, e.HireDate, 0
from HumanResources.dbo.employee e
 left join AWDataWarehouseMZ.dbo.DimEmployee de
	on e.EmployeeID=de.EmployeeAlternateKey
where de.EmployeeKey is null