USE Products
GO

SELECT	p.ProductKey
	    ,c.ProductCategoryName
		,s.ProductSubcategoryName
		,p.ProductName
		,p.Color
		,p.Size
		,p.Weight
		,p.ListPrice
FROM Product p
INNER JOIN ProductSubcategory s ON p.ProductSubcategoryKey = s.ProductSubCategoryKey
INNER JOIN ProductCategory c	ON s.ProductCategoryKey = c.ProductCategoryKey
ORDER BY c.ProductCategoryName, s.ProductSubcategoryName, p.ProductName;