
CREATE PROCEDURE [dbo].[GetAllTableSizes] (@schema varchar(30) = null) AS
/*
     Obtains spaced used data for ALL user tables in the database 
*/ 
DECLARE @TableName VARCHAR(100);  
DECLARE @SchemaName VARCHAR(30);

--For storing values in the cursor 
--Cursor to get the name of all user tables from the sysobjects listing 
DECLARE tableCursor CURSOR 
FOR  
select SCHEMA_NAME(schema_id) as SchemaName, [name] as TableName from sys.tables 
WHERE (@schema IS NULL OR SCHEMA_NAME(schema_id) = @schema)
FOR READ ONLY 

--A procedure level temp table to store the results 
CREATE TABLE #TempTable
(     
	 --schemaName varchar(30),
	 tableName varchar(100),
	 numberofRows varchar(100),
     reservedSize varchar(50),     
	 dataSize varchar(50),     
	 indexSize varchar(50),     
	 unusedSize varchar(50) 
) 

--Open the cursor 
OPEN tableCursor 

--Get the first table name from the cursor 
FETCH NEXT FROM tableCursor INTO @SchemaName, @TableName 

DECLARE @FullName VARCHAR(150);
--Loop until the cursor was not able to fetch 
WHILE (@@Fetch_Status >= 0) 
BEGIN     
	--Dump the results of the sp_spaceused query to the temp table     
	SET @FullName = @SchemaName + '.' + @TableName;
	INSERT  #TempTable         
	EXEC sp_spaceused @FullName;
	--Get the next table name     
	FETCH NEXT FROM tableCursor INTO @SchemaName, @TableName 
END 

--Get rid of the cursor 
CLOSE tableCursor 
DEALLOCATE tableCursor 

--Select all records so we can use the reults 
SELECT *  FROM #TempTable 

--Final cleanup! 
DROP TABLE #TempTable