USE ResellerSales
GO

SELECT	h.SalesOrderNumber
		,r.ResellerName
		,h.EmployeeID
		,r.City
		,d.ProductKey
		,d.OrderQuantity
		,d.UnitPrice
		,p.PaymentTypeName
FROM SalesOrderHeader h
INNER JOIN SalesOrderDetail d	ON d.SalesOrderNumber = h.SalesOrderNumber
INNER JOIN Resellers r			ON h.ResellerKey = r.ResellerKey
INNER JOIN PaymentTypes p		ON h.PaymentType = p.PaymentTypeKey
ORDER BY h.SalesOrderNumber;