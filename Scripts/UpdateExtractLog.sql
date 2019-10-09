use StagingMZ
go

select * from ExtractLog

UPDATE ExtractLog
SET LastExtract = Getdate(),
LastVersion = -1
WHERE DataSource='ResellerSales'

--UPDATE ExtractLog
--SET LastExtract = ?,
--LastVersion = ?
--WHERE DataSource='ResellerSales'