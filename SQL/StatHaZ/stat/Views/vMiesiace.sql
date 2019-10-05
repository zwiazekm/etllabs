CREATE VIEW [stat].[vMiesiace]
AS 
with numbers as (
	SELECT TOP (12) n = ROW_NUMBER() OVER (ORDER BY [object_id]) FROM sys.all_objects ORDER BY n
)
SELECT DISTINCT Miesiac = n , Kwartal = (n+2) / 3
FROM numbers
WHERE n BETWEEN 1 AND 12;