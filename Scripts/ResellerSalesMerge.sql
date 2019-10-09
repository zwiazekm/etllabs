MERGE INTO AWDataWarehouse.dbo.FactResellerSales AS tgt
USING
	-- Query to return staged reseller sales data and look up dimension keys
	(SELECT  p.ProductKey,
			r.ResellerKey,
			1 EmployeeKey,
			rs.SalesOrderNumber,
			rs.SalesOrderLineNumber,
			rs.OrderQuantity,
			rs.UnitPrice,
			rs.SalesAmount,
			rs.OrderDate,
			rs.ShipDate,
			rs.PaymentType,
			do.DateKey OrderDateKey,
			ds.DateKey ShipDateKey
	FROM AWDataWarehouse.dbo.DimProduct p
	INNER JOIN staging.dbo.ResellerSales rs ON rs.ProductBusinessKey = p.ProductAlternateKey
	INNER JOIN AWDataWarehouse.dbo.DimReseller r ON rs.ResellerBusinessKey = r.ResellerAlternateKey AND r.CurrentRecord = 1
	INNER JOIN AWDataWarehouse.dbo.DimDate do ON rs.OrderDate = do.FullDateAlternateKey
	INNER JOIN AWDataWarehouse.dbo.DimDate ds ON rs.ShipDate = ds.FullDateAlternateKey)
	AS src (ProductKey, ResellerKey, EmployeeKey, SalesOrderNumber, SalesOrderLineNumber, OrderQuantity, UnitPrice, SalesAmount, OrderDate, ShipDate, PaymentType, OrderdateKey, ShipDateKey)
	
	-- Match staged order/lineitem combinations to existing fact records
	ON (
		src.SalesOrderNumber = tgt.SalesOrderNumber
		AND
		src.SalesOrderLineNumber = tgt.SalesOrderLineNumber
	   )

	   -- If a record for this order/lineitem already exists, update it
	WHEN MATCHED THEN
		UPDATE 
		SET ProductKey = src.ProductKey,
			ResellerKey = src.ResellerKey,
			EmployeeKey = src.EmployeeKey,
			OrderQuantity = src.OrderQuantity,
			UnitPrice = src.UnitPrice,
			SalesAmount = src.SalesAmount,
			OrderDate = src.OrderDate,
			ShipDate = src.ShipDate,
			PaymentType = src.PaymentType,
			OrderdateKey = src.OrderdateKey,
			ShipDateKey = src.ShipDateKey

		-- If not, insert a new record
	WHEN NOT MATCHED THEN
			INSERT (ProductKey, ResellerKey, EmployeeKey, SalesOrderNumber, SalesOrderLineNumber, OrderQuantity, UnitPrice, SalesAmount, OrderDate, ShipDate, PaymentType, OrderdateKey, ShipDateKey)
			VALUES (src.ProductKey, src.ResellerKey, src.EmployeeKey, src.SalesOrderNumber, src.SalesOrderLineNumber, src.OrderQuantity, src.UnitPrice, src.SalesAmount, src.OrderDate, src.ShipDate, src.PaymentType, src.OrderdateKey, src.ShipDateKey);
