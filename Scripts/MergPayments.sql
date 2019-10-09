
--Nalezy zamienić inicjały na właściwe
MERGE INTO AWDataWarehouseMZ.dbo.FactPayments as fp
USING
 (select 
	p.PaymentBusinessKey paymentAlternateKey,
	r.ResellerKey,
	d.DateKey PaymentDateKey,
	p.SalesOrderNumber,
	p.PaymentAmount
  from StagingMZ.dbo.Payments p
    inner join AWDataWarehouseMZ.dbo.DimReseller r
      on p.ResellerBusinessKey =r.ResellerAlternateKey
    inner join AWDataWarehouseMZ.dbo.DimDate d
      on p.PaymentDate=d.FullDateAlternateKey
 ) as src (PaymentAlternateKey, ResellerKey, PaymentDateKey, SalesOrderNumber, PaymentAmount)
ON (src.PaymentAlternateKey = fp.PaymentAlternateKey)
WHEN MATCHED THEN
	UPDATE
	SET SalesORderNumber = src.SalesOrderNumber,
	ResellerKey = src.ResellerKey,
	PaymentDateKey=src.PaymentDateKey,
	PaymentAmount=src.PaymentAmount
WHEN NOT MATCHED THEN
	INSERT (PaymentAlternateKey, ResellerKey, PaymentDateKey, SalesOrderNumber, PaymentAmount)
	Values(src.PaymentAlternateKey, src.ResellerKey, src.SalesOrderNumber, src.PaymentDateKey, src.PaymentAmount);

select *
from AWDataWarehouseMZ.dbo.FactPayments


truncate table Payments