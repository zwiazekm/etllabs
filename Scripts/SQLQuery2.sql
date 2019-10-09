select * from ProductCategory
select * from ProductSubcategory
select * from Product
insert ProductCategory (ProductCategoryKey, ProductCategoryName)
values (10, 'Cars')

update ProductCategory
set ProductCategoryName = 'Bike Components'
where ProductCategoryKey = 2

update ProductCategory
set ProductCategoryName = 'Components'
where ProductCategoryKey = 2

insert ProductSubcategory 
values (100, 'Volvo', 10)

update ProductSubcategory
SET ProductSubcategoryName= 'Street Bikes'
where ProductSubCategoryKey=2


update ProductSubcategory
SET ProductSubcategoryName= 'Road Bikes'
where ProductSubCategoryKey=2

insert Product (ProductSubcategoryKey, ProductName, Color)
values ( 2, 'Road test', 'Navy Blue')

update Product
set ProductName ='Broken Road frame'
where ProductKey=210

update Product
set ProductName ='HL Road Frame - Black, 58'
where ProductKey=210