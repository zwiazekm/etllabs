select * from Products.dbo.ProductCategory
select * from AWDataWarehouseMZ.dbo.DimProductCategory

select * from Products.dbo.ProductSubcategory
select * from AWDataWarehouseMZ.dbo.DimProductSubcategory

select * from Products.dbo.Product
select * from AWDataWarehouseMZ.dbo.DimProduct
go

select * from StagingMZ.dbo.Payments
select * from AWDataWarehouseMZ.dbo.FactPayments
select * from AWDataWarehouseMZ.dbo.DimDate

select LastExtract from ExtractLog
where DataSource ='ResellerSales'

select LastVersion from ExtractLog
where DataSource ='ResellerSales'

select getdate()

select * from ResellerSales.dbo.resellers
select * from Stagingmz.dbo.resellers

declare @recordversion bigint =-1
exec [ResellerSales].dbo.[GetChangedResellers] @lastversion= @recordversion out
select @recordversion

select * from ResellerSales.dbo.SalesOrderHeader
select * from ResellerSales.dbo.SalesOrderDetail
select * from ResellerSales.dbo.PaymentTypes

select * from dbo.Resellers
select * from AWDataWarehouseMZ.dbo.DimReseller

select * from dbo.ResellerSales
select * from AWDataWarehouseMZ.dbo.FactResellerSales


select * from AWDataWarehouseMZ.dbo.DimEmployee



declare @newName as nvarchar(50) = 'Test'
declare @kategoryKey as int = 1
declare @subCategoryKey int = 1

--Update DimProductCategory
--set ProductCategoryName = ?
--WHERE ProductCategoryKey = ?

--Update DimProductSubcategory
--set ProductSubcategoryName = ?,
--ProductCategoryKey = ?
--where ProductSubcategoryKey = ?
--ProductSubcategoryName <> ?

--UPdate DimProduct
--set
--	ProductName = ?,
--	StandardCost =?,
--	Color = ?,
--	ListPrice = ?,
--	Size = ?,
--	Weight = ?,
--	Description =?,
--	ProductSubcategoryKey=?
--where ProductKey =?