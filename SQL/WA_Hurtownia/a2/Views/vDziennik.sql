CREATE VIEW [a2].[vDziennik]
AS
select d.Id
, d.Data
, d.[Status]
, Cast(d.ContextInfo as varchar(16)) as ContextName
,ISNULL(REPLICATE('  ', d.Poziom-1),'') + OBJECT_NAME(d.Procedura) as Procedura
,d.Poziom
,ISNULL(REPLICATE('  ', d.Poziom-1),'') + d.Informacja as Informacja
, d.CzasWykonaniaMs as CzasMs
, d.RowCnt
from a2.Dziennik as d