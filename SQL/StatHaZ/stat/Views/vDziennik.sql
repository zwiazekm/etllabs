CREATE VIEW [stat].[vDziennik]
AS
select d.Id, d.Data, d.[Status], d.ContextInfo, OBJECT_NAME(d.Procedura) as Procedura
,d.Poziom
,REPLICATE('  ', d.Poziom-1) + d.Informacja as Informacja
, d.CzasWykonaniaMs as CzasMs
from stat.Dziennik as d