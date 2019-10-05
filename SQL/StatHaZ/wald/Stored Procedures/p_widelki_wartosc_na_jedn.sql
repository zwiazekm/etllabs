
CREATE procedure [wald].p_widelki_wartosc_na_jedn 	
@zakres decimal(2,2)
				
as

truncate table [wald].widelki_wartosc_na_jedn

declare @kod_cn varchar(8)
declare @sredniaSAD decimal(20,2)
declare @odchylenieSAD decimal(20,2)
declare @podchylenieSi decimal(20,2)
declare @podchylenieSe decimal(20,2)
declare @podchylenieIi decimal(20,2)
declare @podchylenieIe decimal(20,2)
declare @posredniaSi decimal(20,2)
declare @posredniaSe decimal(20,2)
declare @posredniaIi decimal(20,2)
declare @posredniaIe decimal(20,2)
declare @sredniaINTR decimal(20,2)
declare @odchylenieINTR decimal(20,2)
declare @kursor_start int
declare @kursor_stop int

declare pobor_cn cursor
	for select kod_cn
	    from wald.tbl_sl_taryfa_cn8
open pobor_cn

set @kursor_start = 1
set @kursor_stop = (select count(*) from wald.tbl_sl_taryfa_cn8)

while @kursor_start<=@kursor_stop

begin
fetch pobor_cn into @kod_cn

select 	@posredniaSe =avg((cast((cast(EKS.ek_wartosc_stat_zl as decimal(20,2)))/(cast(EKS.ek_ilosc as decimal(20,2)))as decimal(20,2)))),
	@podchylenieSe =stdevp((cast((cast(EKS.ek_wartosc_stat_zl as decimal(20,2)))/(cast(EKS.ek_ilosc as decimal(20,2)))as decimal(20,2)))) 
from	[wald].widelki_zbior_roczny_eksport EKS
where	(EKS.ek_pcn = @kod_cn) and
	(cast(EKS.ek_ilosc as int) <> 0) and
	(cast(EKS.ek_wartosc_stat_zl as int) <> 0)and
	(EKS.ek_odbiorca <> '22222222222222')and
	(EKS.ek_znacznik_kategorii_progowej = '0')

select	@posredniaSi =avg((cast((cast(IMP.im_wartosc_stat_zl as decimal(20,2)))/(cast(IMP.im_ilosc as decimal(20,2)))as decimal(20,2)))),
	@podchylenieSi =stdevp((cast((cast(IMP.im_wartosc_stat_zl as decimal(20,2)))/(cast(IMP.im_ilosc as decimal(20,2)))as decimal(20,2))))
from	[wald].widelki_zbior_roczny_import IMP
where	(IMP.im_pcn = @kod_cn)and
	(cast(IMP.im_ilosc as int) <> 0) and
	(cast(IMP.im_wartosc_stat_zl as int) <> 0)and
	(IMP.im_znacznik_kategorii_progowej = '0')and
	(IMP.im_odbiorca not in('22222222222222','33333333333333'))and
	(IMP.im_kraj_pochodzenia<> 'CN')

select 	@posredniaIe =avg((cast((cast(EKS.ek_wartosc_stat_zl as decimal(20,2)))/(cast(EKS.ek_ilosc as decimal(20,2)))as decimal(20,2)))),
	@podchylenieIe =stdevp((cast((cast(EKS.ek_wartosc_stat_zl as decimal(20,2)))/(cast(EKS.ek_ilosc as decimal(20,2)))as decimal(20,2))))
from	[wald].widelki_zbior_roczny_eksport EKS
where	(EKS.ek_pcn = @kod_cn) and
	(cast(EKS.ek_wartosc_stat_zl as int) <> 0)and
	(cast(EKS.ek_ilosc as int)) <> 0 and
	(EKS.ek_odbiorca <> '22222222222222')and
	(EKS.ek_znacznik_kategorii_progowej = '1')

select	@posredniaIi =avg((cast((cast(IMP.im_wartosc_stat_zl as decimal(20,2)))/(cast(IMP.im_ilosc as decimal(20,2)))as decimal(20,2)))),
	@podchylenieIi =stdevp((cast((cast(IMP.im_wartosc_stat_zl as decimal(20,2)))/(cast(IMP.im_ilosc as decimal(20,2)))as decimal(20,2))))
from	[wald].widelki_zbior_roczny_import IMP
where	(IMP.im_pcn = @kod_cn)and
	(cast(IMP.im_ilosc as int)) <> 0 and
	(cast(IMP.im_wartosc_stat_zl as int) <> 0)and
	(IMP.im_odbiorca <> '22222222222222')and
	(IMP.im_znacznik_kategorii_progowej = '1')and
	(IMP.im_kraj_pochodzenia <> 'CN')

create table #posredniaSAD
(sredniaS decimal(20,2),
odchylenieS decimal(20,2))

insert into #posredniaSAD
(sredniaS,odchylenieS)
values (@posredniaSi,@podchylenieSi)

insert into #posredniaSAD
(sredniaS,odchylenieS)
values (@posredniaSe,@podchylenieSe)

create table #posredniaINTR
(sredniaI decimal(20,2),
odchylenieI decimal(20,2))

insert into #posredniaINTR
(sredniaI,odchylenieI)
values (@posredniaIi,@podchylenieIi)

insert into #posredniaINTR
(sredniaI,odchylenieI)
values (@posredniaIe,@podchylenieIe)

	select @sredniaSAD = avg(sredniaS)
	from #posredniaSAD
	select @odchylenieSAD = avg(odchylenieS)
	from #posredniaSAD

	select @sredniaINTR = avg(sredniaI)
	from #posredniaINTR
	select @odchylenieINTR = avg(odchylenieI)
	from #posredniaINTR

insert into [wald].widelki_wartosc_na_jedn
select 	@kod_cn,
	(case 	when (@sredniaSAD-@odchylenieSAD*@zakres) < 0
		then 0.01
		else (@sredniaSAD-@odchylenieSAD*@zakres)end),
	@sredniaSAD+@odchylenieSAD*@zakres,
	(case	when (@sredniaINTR-@odchylenieINTR*@zakres) < 0
		then 0.01
		else (@sredniaINTR-@odchylenieINTR*@zakres)end),
	@sredniaINTR+@odchylenieINTR*@zakres

drop table #posredniaSAD
drop table #posredniaINTR

set @kursor_start = @kursor_start + 1
end

close pobor_cn
deallocate pobor_cn

print 'ZASILONO TABELĘ WIDELKI_WARTOSC_NA_JEDN; POLA "NULL" OZNACZAJĄ BRAK DANYCH HISTORYCZNYCH'