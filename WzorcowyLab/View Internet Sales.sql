USE InternetSales
GO

SELECT	h.SalesOrderNumber
		,c.FirstName
		,c.LastName
		,d.ProductKey
		,d.OrderQuantity
		,d.UnitPrice
		,p.PaymentTypeName
FROM SalesOrderHeader h
INNER JOIN SalesOrderDetail d	ON d.SalesOrderNumber = h.SalesOrderNumber
INNER JOIN Customers c			ON h.CustomerKey = c.CustomerKey
INNER JOIN PaymentTypes p		ON h.PaymentType = p.PaymentTypeKey
ORDER BY h.SalesOrderNumber;