CREATE VIEW [dbo].[vColumnTypeList] AS 

with 
b as (
select 
	SCHEMA_NAME(o.schema_id) as SchemaName, OBJECT_NAME(o.object_id) as TableName, 
	c.column_id, c.[name] as ColName, t.[name] as ColType, c.[precision], c.[scale], c.max_length as Size, abs(c.is_nullable-1) as isRequired
from sys.all_columns c
inner join sys.types t on t.user_type_id = c.user_type_id
inner join sys.all_objects as o on o.object_id = c.object_id
inner join syscolumns sc on sc.id = c.object_id and sc.colid = c.column_id
where o.[type]='U'
)
select b.SchemaName, b.TableName, b.ColName, b.TableName+'.'+b.ColName as FullName, b.ColType, b.isRequired
from b