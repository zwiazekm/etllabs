
CREATE VIEW [dbo].[vColumnTypeList] AS 

with pk as (
SELECT A.CONSTRAINT_NAME, A.TABLE_SCHEMA, B.TABLE_NAME, B.COLUMN_NAME
FROM   INFORMATION_SCHEMA.TABLE_CONSTRAINTS A,   
       INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE B  
WHERE  B.CONSTRAINT_NAME = A.CONSTRAINT_NAME   
       AND B.TABLE_NAME = A.TABLE_NAME   AND CONSTRAINT_TYPE = 'PRIMARY KEY '  
),
b as (
select 
	SCHEMA_NAME(o.schema_id) as SchemaName, OBJECT_NAME(o.object_id) as TableName, 
	c.column_id, c.[name] as ColName, t.[name] as ColType, c.[precision], c.[scale], c.max_length as Size, abs(c.is_nullable-1) as isRequired,
		t.[name] 
		+ case when t.[name]='decimal' or t.[name]='numeric' then '(' + cast(c.[precision] as varchar(9)) + ',' + cast(c.[scale] as varchar(9)) + ')' else '' end
		+ case when t.[name] like '%char' then '(' + cast(sc.prec as varchar(9)) + ')' else '' end
	--	+ case when isRequired = 1 then ' NOT NULL' else ' NULL' end
		as ColDesc,
		case (select count(*) from pk where pk.TABLE_NAME = OBJECT_NAME(o.object_id) and pk.TABLE_SCHEMA = SCHEMA_NAME(o.schema_id) and pk.COLUMN_NAME = c.[name]) 
		  when 0 then '-' else 'PK' end as IsPK
from sys.all_columns c
inner join sys.types t on t.user_type_id = c.user_type_id
inner join sys.all_objects as o on o.object_id = c.object_id
inner join syscolumns sc on sc.id = c.object_id and sc.colid = c.column_id
where o.[type]='U'
)
select b.SchemaName, b.column_id,
b.TableName, b.ColName, b.TableName+'.'+b.ColName as FullName, b.ColDesc, cast(b.isRequired as char(1)) + case when b.IsPK = 'PK' then ' (PK)' else '' end as isRequired
from b