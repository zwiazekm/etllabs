USE master
GO

-- Turn off CDC in Internet Sales
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'InternetSales')
BEGIN
	EXEC InternetSales.sys.sp_cdc_disable_table
	@source_schema = N'dbo',
	@source_name   = N'Customers',
	@capture_instance = 'all'

	EXEC sys.sp_cdc_disable_db
END
GO

-- Turn off CDC in Human Resources
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'HumanResources')
BEGIN
	EXEC HumanResources.sys.sp_cdc_disable_table
	@source_schema = N'dbo',
	@source_name   = N'Employees',
	@capture_instance = 'all'

	EXEC sys.sp_cdc_disable_db
END
GO

-- remove CDC jobs from SQL Agent
DECLARE @numJobs int
SET @numJobs = (SELECT count(*) FROM msdb.dbo.sysjobs_view WHERE name LIKE 'cdc.InternetSales%')
WHILE @numJobs > 0
BEGIN
 DECLARE @jobName nvarchar(128)
 SELECT @jobName = (SELECT MIN(name) FROM msdb.dbo.sysjobs_view WHERE name LIKE 'cdc.InternetSales%')
 EXEC msdb.dbo.sp_delete_job @job_name = @jobName
 SET @numJobs = (SELECT count(*) FROM msdb.dbo.sysjobs_view WHERE name LIKE 'cdc.InternetSales%')
END
SET @numJobs = (SELECT count(*) FROM msdb.dbo.sysjobs_view WHERE name LIKE 'cdc.HumanResources%')
WHILE @numJobs > 0
BEGIN
 SELECT @jobName = (SELECT MIN(name) FROM msdb.dbo.sysjobs_view WHERE name LIKE 'cdc.HumanResources%')
 EXEC msdb.dbo.sp_delete_job @job_name = @jobName
 SET @numJobs = (SELECT count(*) FROM msdb.dbo.sysjobs_view WHERE name LIKE 'cdc.HumanResources%')
END
GO


--Disable change tracking in Reseller Sales
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'ResellerSales')
BEGIN
ALTER TABLE ResellerSales.dbo.Resellers
DISABLE CHANGE_TRACKING
END
GO

IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'ResellerSales')
BEGIN
ALTER DATABASE ResellerSales
SET CHANGE_TRACKING = OFF
END
GO


-- Drop Staging
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'Staging')
BEGIN
	DROP Database Staging
END
GO

-- Drop AWDataWarehouse
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'AWDataWarehouse')
BEGIN
	DROP Database AWDataWarehouse
END
GO

-- Drop and restore HumanResources
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'HumanResources')
BEGIN
	DROP DATABASE HumanResources
END
GO
RESTORE DATABASE HumanResources FROM  DISK = N'F:\20767\SetupFiles\HumanResources.bak' WITH  REPLACE,
MOVE N'HumanResources' TO N'$(SUBDIR)SetupFiles\HumanResources.mdf', 
MOVE N'HumanResources_Log' TO N'$(SUBDIR)SetupFiles\HumanResources_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::HumanResources TO [ADVENTUREWORKS\Student];
GO

-- Drop and restore InternetSales
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'InternetSales')
BEGIN
	DROP DATABASE InternetSales
END
GO
RESTORE DATABASE InternetSales FROM  DISK = N'F:\20767\SetupFiles\InternetSales.bak' WITH  REPLACE,
MOVE N'InternetSales' TO N'$(SUBDIR)SetupFiles\InternetSales.mdf', 
MOVE N'InternetSales_Log' TO N'$(SUBDIR)SetupFiles\InternetSales_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::InternetSales TO [ADVENTUREWORKS\Student];
GO

-- Drop and restore ResellerSales
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'ResellerSales')
BEGIN
	DROP Database ResellerSales
END
GO
RESTORE DATABASE ResellerSales FROM  DISK = N'F:\20767\SetupFiles\ResellerSales.bak' WITH  REPLACE,
MOVE N'ResellerSales' TO N'$(SUBDIR)SetupFiles\ResellerSales.mdf', 
MOVE N'ResellerSales_Log' TO N'$(SUBDIR)SetupFiles\ResellerSales_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::ResellerSales TO [ADVENTUREWORKS\Student];
GO

-- Drop and restore Products
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'Products')
BEGIN
	DROP Database Products
END
GO
RESTORE DATABASE Products FROM  DISK = N'F:\20767\SetupFiles\Products.bak' WITH  REPLACE,
MOVE N'Products' TO N'$(SUBDIR)SetupFiles\Products.mdf', 
MOVE N'Products_Log' TO N'$(SUBDIR)SetupFiles\Products_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::Products TO [ADVENTUREWORKS\Student];
GO

-- Create the Staging database
CREATE DATABASE Staging
ON  PRIMARY 
( NAME = N'Staging', FILENAME = N'$(SUBDIR)\SetupFiles\Staging.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Staging_log', FILENAME = N'$(SUBDIR)\SetupFiles\Staging_log.ldf' , SIZE = 560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

-- Create staging tables
USE Staging
GO

-- Resellers
CREATE TABLE [dbo].[Resellers](
	[ResellerBusinessKey] [nvarchar](15),
	[Phone] [nvarchar](25) NULL,
	[BusinessType] [varchar](20) NOT NULL,
	[ResellerName] [nvarchar](50) NOT NULL,
	[NumberEmployees] [int] NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[YearOpened] [int] NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL
)
GO

-- ResellerSales
CREATE TABLE [dbo].[ResellerSales](
	[ProductBusinessKey] [nvarchar](25) NOT NULL,
	[ResellerBusinessKey] [int] NOT NULL,
	[EmployeeBusinessKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NULL,
	[UnitPrice] [money] NULL,
	[SalesAmount] [money] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[PaymentType] [varchar](15) NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[StandardCost] [money] NULL,
	[Color] [nvarchar](15) NOT NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[Description] [nvarchar](400) NULL,
	[ProductSubcategoryBusinessKey] [int] NULL,
	[ProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryBusinessKey] [int] NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL
)
GO

-- Customers
CREATE TABLE [dbo].[Customers](
	[CustomerBusinessKey] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Suffix] [nvarchar](10) NULL,
	[Gender] [nvarchar](1) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Occupation] [nvarchar](100) NULL,
	[HouseOwnerFlag] [nchar](1) NULL,
	[NumberCarsOwned] [tinyint] NULL,
	[AddressLine1] [nvarchar](120) NULL,
	[AddressLine2] [nvarchar](120) NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[Phone] [nvarchar](20) NULL,
	[CommuteDistance] [nvarchar](15) NULL
)

-- InternetSales
CREATE TABLE [dbo].[InternetSales](
	[ProductBusinessKey] [nvarchar](25) NOT NULL,
	[CustomerBusinessKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NULL,
	[UnitPrice] [money] NULL,
	[SalesAmount] [money] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[PaymentType] [varchar](15) NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[StandardCost] [money] NULL,
	[Color] [nvarchar](15) NOT NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[Description] [nvarchar](400) NULL,
	[ProductSubcategoryBusinessKey] [int] NULL,
	[ProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryBusinessKey] [int] NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL
)
GO

CREATE TABLE Payments
(
	PaymentBusinessKey integer not null,
	ResellerBusinessKey integer NOT NULL,
	SalesOrderNumber varchar(50) NOT NULL,
	PaymentDate datetime NOT NULL,
	PaymentAmount money NOT NULL

)



CREATE TABLE [dbo].[EmployeeInserts](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [date] NOT NULL,
)
GO

CREATE TABLE [dbo].[EmployeeUpdates](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [date] NOT NULL,
)
GO

CREATE TABLE [dbo].[EmployeeDeletes](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [date] NOT NULL,
)
GO

CREATE TABLE ExtractLog
(
DataSource varchar(20),
 LastExtract datetime,
 LastVersion int
)
GO

INSERT INTO ExtractLog VALUES
('InternetSales', '1/1/1900', NULL)

INSERT INTO ExtractLog VALUES
('ResellerSales', '1/1/1900', -1)
GO

CREATE TABLE [dbo].[cdc_states] 
 ([name] [nvarchar](256) NOT NULL, 
 [state] [nvarchar](256) NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON 
 [dbo].[cdc_states] 
 ( [name] ASC ) 
 WITH (PAD_INDEX  = OFF) ON [PRIMARY]
GO


Use master
GO

-- Drop the AWDataWarehouse database if it already exists
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'AWDataWarehouse')
BEGIN
	DROP DATABASE AWDataWarehouse
END

-- Create the AWDataWarehouse database
CREATE DATABASE AWDataWarehouse
ON  PRIMARY 
( NAME = N'AWDataWarehouse', FILENAME = N'$(SUBDIR)\SetupFiles\AWDataWarehouse.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AWDataWarehouse_log', FILENAME = N'$(SUBDIR)\SetupFiles\AWDataWarehouse_log.ldf' , SIZE = 560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

-- Create dimension tables
USE AWDataWarehouse
GO

-- Reseller
CREATE TABLE [dbo].[DimReseller](
	[ResellerKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[ResellerAlternateKey] [nvarchar](15) NULL,
	[Phone] [nvarchar](25) NULL,
	[BusinessType] [varchar](20) NOT NULL,
	[ResellerName] [nvarchar](50) NOT NULL,
	[NumberEmployees] [int] NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[YearOpened] [int] NULL,
	[CurrentRecord] bit
)
GO

-- Product
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[ProductAlternateKey] [nvarchar](25) NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL,
	[StandardCost] [money] NULL,
	[Color] [nvarchar](15) NOT NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[Description] [nvarchar](400) NULL
)

GO

CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY NONCLUSTERED,
	[EmployeeAlternateKey] [nvarchar](15) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [date] NOT NULL,
	[Deleted] bit NOT NULL DEFAULT 0
)
GO

-- Create Fact Tables
CREATE TABLE [dbo].[FactResellerSales](
	[ProductKey] [int] NOT NULL REFERENCES [dbo].[DimProduct] ([ProductKey]),
	[ResellerKey] [int] NOT NULL REFERENCES [dbo].[DimReseller] ([ResellerKey]),
	[EmployeeKey] int NOT NULL REFERENCES [dbo].[DimEmployee] ([EmployeeKey]),
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NULL,
	[UnitPrice] [money] NULL,
	[SalesAmount] [money] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[PaymentType] [nvarchar](15) NULL,
	 CONSTRAINT [PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY CLUSTERED 
	(
		[SalesOrderNumber] ASC,
		[SalesOrderLineNumber] ASC
	)
) 

GO

-- Create Internet Customer dimension table
USE [AWDataWarehouse]
GO

CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[CustomerAlternateKey] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Suffix] [nvarchar](10) NULL,
	[Gender] [nvarchar](1) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Occupation] [nvarchar](100) NULL,
	[HouseOwnerFlag] [nchar](1) NULL,
	[NumberCarsOwned] [tinyint] NULL,
	[AddressLine1] [nvarchar](120) NULL,
	[AddressLine2] [nvarchar](120) NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[Phone] [nvarchar](20) NULL,
	[CommuteDistance] [nvarchar](15) NULL,
	[CurrentRecord] bit
)

GO

-- Create Internet Sales fact table
CREATE TABLE [dbo].[FactInternetSales](
	[ProductKey] [int] NOT NULL REFERENCES [dbo].[DimProduct] ([ProductKey]),
	[CustomerKey] [int] NOT NULL REFERENCES [dbo].[DimCustomer] ([CustomerKey]),
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[PaymentType] [nvarchar](15) NULL,
	 CONSTRAINT [PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY CLUSTERED 
	(
		[SalesOrderNumber] ASC,
		[SalesOrderLineNumber] ASC
	)
) 

GO

USE AWDataWarehouse
GO


-- IMPLEMENT PRODUCT CATEGORY SNOWFLAKE TO CREATE A NATURAL HIERARCHY

--Create DimProductCategory table
CREATE TABLE [dbo].[DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[ProductCategoryAlternateKey] [int] NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL
)
GO

-- Create DimProductSubcategory table
CREATE TABLE [dbo].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[ProductSubcategoryAlternateKey] [int] NULL,
	[ProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryKey] [int] NULL REFERENCES [dbo].DimProductCategory(ProductCategoryKey)
)
GO

-- Modify DimProduct table to remove ProductSubcategoryName and ProductCategoryName columns and add foreign key to DimProductSubcategory
ALTER TABLE [dbo].DimProduct
DROP
	COLUMN ProductSubcategoryName, 
	COLUMN ProductCategoryName
GO

ALTER TABLE [dbo].DimProduct
ADD ProductSubcategoryKey int NULL REFERENCES [dbo].DimProductSubcategory(ProductSubcategoryKey)
GO


-- IMPLEMENT GEOGRAPHY SNOWFLAKE TO SHARE A HIERARCHY ACROSS DIMENSIONS

-- Create DimGeography Table
CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[City] [nvarchar](30) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
 ) 

GO

-- Modify DimReseller table to remove geography hierarchy columns and add foreign key to DimGeography
ALTER TABLE [dbo].DimReseller
DROP
	COLUMN City, 
	COLUMN [StateProvinceName],
	COLUMN [CountryRegionCode],
	COLUMN [CountryRegionName],
	COLUMN [PostalCode]

GO

ALTER TABLE [dbo].DimReseller
ADD GeographyKey int NULL REFERENCES [dbo].DimGeography(GeographyKey)
GO

-- Modify DimCustomer table to remove geography hierarchy columns and add foreign key to DimGeography
ALTER TABLE [dbo].DimCustomer
DROP
	COLUMN City, 
	COLUMN [StateProvinceName],
	COLUMN [CountryRegionCode],
	COLUMN [CountryRegionName],
	COLUMN [PostalCode]

GO

ALTER TABLE [dbo].DimCustomer
ADD GeographyKey int NULL REFERENCES [dbo].DimGeography(GeographyKey)
GO

USE AWDataWarehouse
GO

-- Create DimDate dimension table
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL PRIMARY KEY CLUSTERED,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[DayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[MonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL
)
GO

-- Create relationships to DimDate
ALTER TABLE [dbo].FactInternetSales
ADD
	OrderDateKey int NULL REFERENCES [dbo].DimDate(DateKey),
	ShipDateKey int NULL REFERENCES [dbo].DimDate(DateKey)
GO

ALTER TABLE [dbo].FactResellerSales
ADD
	OrderDateKey int NULL REFERENCES [dbo].DimDate(DateKey),
	ShipDateKey int NULL REFERENCES [dbo].DimDate(DateKey)
GO

-- Create indexes on date key fields
CREATE NONCLUSTERED INDEX [IX_FactInternetSales_OrderDateKey] ON [dbo].FactInternetSales
(
	[OrderDateKey] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_FactInternetSales_ShipDateKey] ON [dbo].FactInternetSales
(
	[ShipDateKey] ASC
)
GO

-- Create indexes on date key fields
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_OrderDateKey] ON [dbo].FactResellerSales
(
	[OrderDateKey] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_FactResellerSales_ShipDateKey] ON [dbo].FactResellerSales
(
	[ShipDateKey] ASC
)
GO

-- Populate DimDate dimension table with values from 1/1/2000 to 1/1/2003
-- declare variables to hold the start and end date
DECLARE @StartDate datetime
DECLARE @EndDate datetime

--- assign values to the start date and end date we 
-- want our reports to cover (this should also take
-- into account any future reporting needs)
SET @StartDate = '01/01/2000'
SET @EndDate = getdate() 

-- using a while loop increment from the start date 
-- to the end date
DECLARE @LoopDate datetime
SET @LoopDate = @StartDate

WHILE @LoopDate <= @EndDate
BEGIN
 -- add a record into the date dimension table for this date
  INSERT INTO dbo.DimDate VALUES
	(
		CAST(CONVERT(VARCHAR(8), @LoopDate, 112) AS int) , -- date key
		@LoopDate, -- date alt key
		datepart(dw, @LoopDate), -- day number of week
		datename(dw, @LoopDate), -- day name of week
	    Day(@LoopDate),  -- day number of month
		datepart(dy, @LoopDate), -- day of year
		datepart(wk, @LoopDate), --  week of year
		datename(mm, @LoopDate), -- month name
		Month(@LoopDate), -- month number of year
		datepart(qq, @LoopDate), -- calendar quarter
		Year(@LoopDate), -- calendar year
		CASE
			WHEN Month(@LoopDate) < 7 THEN 1
			ELSE 2
		 END, -- calendar semester
		 CASE
			WHEN Month(@LoopDate) IN (1, 2, 3) THEN 3
			WHEN Month(@LoopDate) IN (4, 5, 6) THEN 4
			WHEN Month(@LoopDate) IN (7, 8, 9) THEN 1
			WHEN Month(@LoopDate) IN (10, 11, 12) THEN 2
		 END, -- fiscal quarter (assuming fiscal year runs from Jul to June)
		CASE
			WHEN Month(@LoopDate) < 7 THEN Year(@LoopDate)
			ELSE Year(@Loopdate) + 1
		 END, -- Fiscal year
		CASE
			WHEN Month(@LoopDate) > 6 THEN 1
			ELSE 2
		 END -- fiscal semester
	)  		  
	 -- increment the date by 1 day and do next loop
	SET @LoopDate = DateAdd(dd, 1, @LoopDate)
END
GO

-- Create Payments fact table
CREATE TABLE FactPayments
(
	PaymentKey int IDENTITY PRIMARY KEY CLUSTERED,
	PaymentAlternateKey int,
	ResellerKey int REFERENCES DimReseller(ResellerKey),
	PaymentDateKey int REFERENCES DimDate(DateKey),
	SalesOrderNumber varchar(50),
	PaymentAmount money
)
GO


--Re-enable CDC in Internet Sales
USE InternetSales
GO

--Error around db ownership
EXEC sys.sp_changedbowner 'sa'
GO

EXEC sys.sp_cdc_enable_db
GO

EXEC sys.sp_cdc_enable_table
	@source_schema = N'dbo',
	@source_name   = N'Customers',
	@role_name     = NULL,
	@supports_net_changes = 1
GO


-- Make a change to all customers (to create CDC records)
UPDATE Customers
SET FirstName = REVERSE(FirstName)
GO
-- and then return the data to its original state
UPDATE Customers
SET FirstName = REVERSE(FirstName)
GO

UPDATE Customers
SET StateProvinceName = 'California'
WHERE StateProvinceName = 'CA'

UPDATE Customers
SET StateProvinceName = 'Washington'
WHERE StateProvinceName = 'WA'

UPDATE Customers
SET StateProvinceName = 'New South Wales'
WHERE StateProvinceName = 'NSW'

UPDATE Customers
SET Gender = 'F'
WHERE Gender = 'W'

UPDATE Customers
SET CountryRegionName = 'United States'
WHERE CountryRegionName = 'America'


UPDATE Customers
SET CountryRegionName = 'United Kingdom'
WHERE CountryRegionName = 'Great Britain'

UPDATE Customers
SET CountryRegionName = 'Australia'
WHERE CountryRegionName = 'Astralia'
GO




-- Create a stored procedure to return customer changes between two given dates 
CREATE PROCEDURE GetChangedCustomers	
	@StartDate datetime,
	@EndDate datetime
AS
DECLARE @from_lsn binary(10), @to_lsn binary(10);
SET @from_lsn = sys.fn_cdc_map_time_to_lsn('smallest greater than', @StartDate)
SET @to_lsn = sys.fn_cdc_map_time_to_lsn('largest less than or equal', @EndDate)

-- If there have been any transactions in the timeframe, return any changed Customer records
IF @from_lsn IS NOT NULL AND @to_lsn IS NOT NULL
SELECT [CustomerKey]
		  ,[Title]
		  ,[FirstName]
		  ,[MiddleName]
		  ,[LastName]
		  ,[BirthDate]
		  ,[MaritalStatus]
		  ,[Suffix]
		  ,[Gender]
		  ,[EmailAddress]
		  ,[Occupation]
		  ,[HouseOwnerFlag]
		  ,[NumberCarsOwned]
		  ,[AddressLine1]
		  ,[AddressLine2]
		  ,[City]
		  ,[StateProvinceName]
		  ,[CountryRegionCode]
		  ,[CountryRegionName]
		  ,[PostalCode]
		  ,[Phone]
		  ,[CommuteDistance]
	FROM cdc.fn_cdc_get_net_changes_dbo_Customers(@from_lsn, @to_lsn, 'all')
	ORDER BY CustomerKey
ELSE
	-- Otherwise, there have been no transactions at all in the timeframe
	-- so return an empty rowset
	SELECT TOP 0 * FROM Customers
GO

-- Enable CDC in the HumanResources database
USE HumanResources
GO

--Error around db ownership
EXEC sys.sp_changedbowner 'sa'
GO

EXEC sys.sp_cdc_enable_db
GO

EXEC sys.sp_cdc_enable_table
	@source_schema = N'dbo',
	@source_name   = N'Employee',
	@role_name     = NULL,
	@supports_net_changes = 1
GO


-- Enable change tracking in the ResellerSales database
use master
GO
ALTER DATABASE ResellerSales
SET CHANGE_TRACKING = ON
	(CHANGE_RETENTION = 7 DAYS, AUTO_CLEANUP = ON)
GO

USE ResellerSales
GO

-- Enable change tracking on the Resellers table
ALTER TABLE Resellers
ENABLE CHANGE_TRACKING
WITH (TRACK_COLUMNS_UPDATED = OFF)
GO

-- Enable Snapshot Transactions to ensure consistency
ALTER DATABASE ResellerSales
SET ALLOW_SNAPSHOT_ISOLATION ON
GO

-- Create a stored procedure to return all resellers that have changed since the previous extract
CREATE PROCEDURE GetChangedResellers @LastVersion BigInt OUTPUT
AS
	SET TRANSACTION ISOLATION LEVEL SNAPSHOT
	DECLARE @CurrentVersion BigInt
	SET @CurrentVersion = CHANGE_TRACKING_CURRENT_VERSION();
	IF @Lastversion = -1
	BEGIN
		SELECT ResellerKey,
			   [Phone]
			  ,[BusinessType]
			  ,[ResellerName]
			  ,[NumberEmployees]
			  ,[AddressLine1]
			  ,[AddressLine2]
			  ,[City]
			  ,[StateProvinceName]
			  ,[CountryRegionCode]
			  ,[CountryRegionName]
			  ,[PostalCode]
			  ,[YearOpened]
		FROM Resellers
	END
	ELSE
	BEGIN
		SELECT  R.ResellerKey,
				R.[Phone]
			  ,R.[BusinessType]
			  ,R.[ResellerName]
			  ,R.[NumberEmployees]
			  ,R.[AddressLine1]
			  ,R.[AddressLine2]
			  ,R.[City]
			  ,R.[StateProvinceName]
			  ,R.[CountryRegionCode]
			  ,R.[CountryRegionName]
			  ,R.[PostalCode]
			  ,R.[YearOpened]
				FROM
				 CHANGETABLE(CHANGES Resellers, @LastVersion) CT
				 INNER JOIN Resellers R ON CT.ResellerKey = r.ResellerKey
	END
	SET @LastVersion = @CurrentVersion
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
