-- =============================================
-- Autor:		    <KRNA>
-- Data utworzenia: <04.06.2014>
-- Opis: <testowa>
-- =============================================

create procedure [stat].[dop_przygotuj_mapowanie_cn_tmp]
@p_year int, 
@pGeneracjaId int
as
begin
	declare @v_cn varchar(8)
	declare @v_cn_int int
	declare @v_diff int

-- czyszczenie istniejącego mapowania "systemowego"
	delete from stat.dot_mapowanie_cn 
	      where rok = @p_year and wstawil = 'S';

	create table #cn_numeric (
		code varchar(8),
		code_numeric int, 
		diff int);

-- wypełnienie tabeli danymi ze zbioru
	declare cr_import_cn cursor for 
	    select im_pcn 
		  from dgt_kopia_dgt_import_intr_agr
	 	 where generacjaId = @pGeneracjaId and 
			   im_znacznik_kategorii_progowej = 1
		 group by im_pcn	

	open cr_import_cn;

	while (1=1)
	begin
		fetch cr_import_cn into @v_cn
    		if @@FETCH_STATUS = 0
				insert into dot_mapowanie_cn (stary_cn, nowy_cn, rok, wstawil) 
					 values (@v_cn, '@@@@@@@@', @p_year, 'S');

    		if @@FETCH_STATUS <> 0
			  break;
	end;

	close cr_import_cn;
	deallocate cr_import_cn;

	declare cr_eksport_cn cursor for 
	    select ek_pcn 
		  from dgt_kopia_dgt_eksport_intr_agr
		 where	generacjaId = @pGeneracjaId
		   and  ek_znacznik_kategorii_progowej = 1 
		   and  not exists (select 1 
		                      from stat.dot_mapowanie_cn 
							 where stary_cn = ek_pcn)	
		 group by ek_pcn;

	open cr_eksport_cn
	while (1=1)
	begin
		fetch cr_eksport_cn into @v_cn
    		if @@FETCH_STATUS = 0
			    insert into dot_mapowanie_cn (stary_cn, nowy_cn, rok, wstawil) 
				     values (@v_cn, '@@@@@@@@', @p_year, 'S');
    		if @@FETCH_STATUS <> 0
			    break;
	end;

	close cr_eksport_cn
	deallocate cr_eksport_cn

-- uzupełnienie mapowania o kody które mają swoje odpowiedniki w bieżącej taryfie
	update dot_mapowanie_cn
	   set nowy_cn = a.kod_cn 
      from tbl_sl_taryfa_cn8 a 
     where a.kod_cn = dot_mapowanie_cn.stary_cn;

-- usunięcie z mapowania pozycji które się nie zmieniły
	delete from stat.dot_mapowanie_cn
	 where stary_cn = nowy_cn 
	   and rok = @p_year 
	   and wstawil = 'S';

-- uzupełnienie mapowania o kody najbliższe matematycznie
	insert into #cn_numeric (code, code_numeric)
	select stary_cn, 
	       convert (int, stary_cn) 
	  from stat.dot_mapowanie_cn 
	 where nowy_cn = '@@@@@@@@';

	declare cr_diff cursor for select code, code_numeric from #cn_numeric
	open cr_diff
	while (1=1)
	begin
		fetch cr_diff into @v_cn, @v_cn_int
		  if @@FETCH_STATUS = 0
		  begin
			select @v_diff = Min (Abs ((@v_cn_int - convert(bigint, kod_cn)))) 
			  from tbl_sl_taryfa_cn8;

			update #cn_numeric 
			   set diff = @v_diff 
			 where code = @v_cn;
		  end;
		  	
		if @@FETCH_STATUS <> 0
			break;
	end;
	
	close cr_diff;
	deallocate cr_diff;

	update dot_mapowanie_cn
	   set nowy_cn = (select top 1 a.kod_cn 
			            from tbl_sl_taryfa_cn8 a, 
						     #cn_numeric b
			           where Abs (b.code_numeric - convert(bigint, a.kod_cn)) = b.diff 
					     and b.code = stary_cn)
	 where nowy_cn = '@@@@@@@@';

	drop table #cn_numeric;
end;