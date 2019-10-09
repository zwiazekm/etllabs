declare @recordversion bigint =-1
exec [ResellerSales].dbo.[GetChangedResellers] @lastversion= @recordversion out
select @recordversion

exec [ResellerSales].dbo.[GetChangedResellers] ? OUT