select * from ResellerSales.dbo.SalesOrderHeader
select * from ResellerSales.dbo.SalesOrderDetail
select * from ResellerSales.dbo.PaymentTypes
select * from Stagingmz.dbo.ResellerSales

select 
	od.ProductKey,
	oh.ResellerKey,
	oh.EmployeeID,
	od.SalesOrderNumber,
	od.SalesOrderLineNumber,
	od.OrderQuantity,
	od.UnitPrice,
	oh.OrderDate,
	oh.ShipDate,
	pt.PaymentTypeName
from SalesOrderDetail od 
	inner join SalesOrderHeader oh 
		on od.SalesOrderNumber=oh.SalesOrderNumber
	inner join PaymentTypes pt
		on oh.PaymentType=pt.PaymentTypeKey
WHERE LastModified > '20010101' and LastModified <= getdate()
