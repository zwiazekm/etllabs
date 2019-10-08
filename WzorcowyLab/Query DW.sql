USE AWDataWarehouse
GO

SELECT	d.FiscalYear
		,g.CountryRegionName
		,SUM(i.SalesAmount) AS TotalSales
FROM FactInternetSales i
INNER JOIN DimCustomer c	ON i.CustomerKey =c.CustomerKey
INNER JOIN DimGeography g	ON c.GeographyKey = g.GeographyKey
INNER JOIN DimDate d		ON i.OrderDateKey = d.DateKey
GROUP BY d.FiscalYear, g.CountryRegionName
ORDER BY d.FiscalYear, g.CountryRegionName;
GO

SELECT	d.CalendarYear
		,c.ProductCategoryName
		,SUM(rs.OrderQuantity) AS UnitsSold
FROM FactResellerSales rs
INNER JOIN DimReseller r			ON r.ResellerKey =rs.ResellerKey
INNER JOIN DimDate d				ON rs.OrderDateKey = d.DateKey
INNER JOIN DimProduct p				ON rs.ProductKey = p.ProductKey
INNER JOIN DimProductSubcategory s	ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
INNER JOIN DimProductCategory c		ON s.ProductCategoryKey = c.ProductCategoryKey
GROUP BY d.CalendarYear, c.ProductCategoryName
ORDER BY d.CalendarYear, c.ProductCategoryName;
GO