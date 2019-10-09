select p.ProductKey,
p.ProductName,
p.Color,
c.ProductCategoryKey,
c.ProductCategoryName,
s.ProductSubCategoryKey,
s.ProductSubcategoryName
from ProductCategory c
join ProductSubcategory s 
	on c.ProductCategoryKey=s.ProductCategoryKey
join Product p 
	on p.ProductSubcategoryKey =s.ProductSubCategoryKey
