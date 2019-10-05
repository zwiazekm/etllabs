CREATE PROCEDURE [stat].dgp_tablice_kontrolne
  @p_data_od datetime,
  @p_data_do datetime,
  @p_rodzaj_danych varchar (100)
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_tablice_kontrolne'
  -- ... ustawienie poczatkowej daty
  print '-- ... ustawienie poczatkowej daty'
  declare @v_data_od datetime
  if     year (@p_data_od) = year (@p_data_do)
     and year (@p_data_do) != 2004
    begin
      select @v_data_od = convert (datetime, convert (varchar, year (@p_data_do)) + '0101', 112)
    end
  else
    begin
      -- ... ... dla roku 2004 i pierwszych 2 miesiecy roku 2005 procedury doszacowania
      --         beda generowane od 06.2004
      if    year (@p_data_do) = 2004
         or (     year (@p_data_do) = 2005
              and month (@p_data_do) <= 2)
        begin
           select @v_data_od = convert (datetime, convert (varchar, case when year (@p_data_do) = 2004 then year (@p_data_do) else year (@p_data_do) - 1 end) + '0501', 112)
        end
      else
        -- ... ... od roku 2006 i pierwszych 2 miesiecy danego roku procedury doszacowania
        --         beda generowane od stycznia roku poprzedniego
        if     year (@p_data_do) >= 2006
           and month (@p_data_do) <= 2
          begin
            select @v_data_od = convert (datetime, convert (varchar, year (dateadd (year, -1, @p_data_do))) + '0101', 112)
          end
        else
          -- ... ... od roku 2006 i kolejnych miesiecy powyzej pierwszych 2 danego roku procedury doszacowania
          --         beda generowane od stycznia danego roku
          select @v_data_od = convert (datetime, convert (varchar, year (@p_data_do)) + '0101', 112)
    end
  print '@v_data_biez = ' + convert (varchar, @v_data_od, 111)
  --
  -- Generacja danych
  -- ... intr
  if @p_rodzaj_danych = 'INTR'
    begin
      -- ... ... dgt_tablica_i1p
      truncate table [stat].dgt_tablica_i1p;

	with on2 as (
		select left (im_pcn, 2) ti_on2_pcn,
				sum (im_wartosc_faktury) ti_on2_wartosc,
				sum (im_masa_netto) ti_on2_masa,
				sum (im_wartosc_faktury) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ti_on2_srednia_cena
		from [stat].dgt_import_intr_agr
		where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
		group by left (im_pcn, 2)) ,
	op2 as (-- op2
		select left (im_pcn, 2) ti_op2_pcn,
				sum (im_wartosc_faktury) ti_op2_wartosc,
				sum (im_masa_netto) ti_op2_masa,
				sum (im_wartosc_faktury) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ti_op2_srednia_cena
		from [stat].dgt_import_intr_agr
		where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
		group by left (im_pcn, 2)) ,
	mb2 as (-- mb2
		select left (im_pcn, 2) ti_mb2_pcn,
				sum (im_wartosc_faktury) ti_mb2_wartosc,
				sum (im_masa_netto) ti_mb2_masa,
				sum (im_wartosc_faktury) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ti_mb2_srednia_cena
		from [stat].dgt_import_intr_agr
		where im_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
		group by left (im_pcn, 2)) ,
	on4 as	(-- on4
		select left (im_pcn, 4) ti_on4_pcn,
				sum (im_wartosc_faktury) ti_on4_wartosc,
				sum (im_masa_netto) ti_on4_masa,
				sum (im_wartosc_faktury) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ti_on4_srednia_cena
		from [stat].dgt_import_intr_agr
		where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
		group by left (im_pcn, 4)) ,
	op4 as	(-- op4
		select left (im_pcn, 4) ti_op4_pcn,
				sum (im_wartosc_faktury) ti_op4_wartosc,
				sum (im_masa_netto) ti_op4_masa,
				sum (im_wartosc_faktury) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ti_op4_srednia_cena
		from [stat].dgt_import_intr_agr
		where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
		group by left (im_pcn, 4)) ,
	mb4 as	(-- mb4
		select left (im_pcn, 4) ti_mb4_pcn,
				sum (im_wartosc_faktury) ti_mb4_wartosc,
				sum (im_masa_netto) ti_mb4_masa,
				sum (im_wartosc_faktury) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ti_mb4_srednia_cena
		from [stat].dgt_import_intr_agr
		where im_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
		group by left (im_pcn, 4)) ,
	calosc as (
		SELECT * FROM on2
		inner join on4 on ti_on2_pcn = left (ti_on4_pcn, 2)
		left join op2 on ti_on2_pcn = ti_op2_pcn
		left join mb2 on ti_on2_pcn = ti_mb2_pcn
		left join op4 on ti_on4_pcn = ti_op4_pcn
		left join mb4 on ti_on4_pcn = ti_mb4_pcn
	)

      insert into [stat].dgt_tablica_i1p
      select distinct
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_pcn else ti_on2_pcn end ti_pcn,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_wartosc else ti_on2_wartosc end ti_on_wartosc,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_masa else ti_on2_masa end ti_on_masa,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_srednia_cena else ti_on2_srednia_cena end ti_on_srednia_cena,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_op4_wartosc else ti_op2_wartosc end ti_op_wartosc,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_op4_masa else ti_op2_masa end ti_op_masa,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_op4_srednia_cena else ti_op2_srednia_cena end ti_op_srednia_cena,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_mb4_wartosc else ti_mb2_wartosc end ti_mb_wartosc,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_mb4_masa else ti_mb2_masa end ti_mb_masa,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_mb4_srednia_cena else ti_mb2_srednia_cena end ti_mb_srednia_cena
        from calosc
       order by 1;
      -- ... ... ... ogółem
      insert into [stat].dgt_tablica_i1p
      select 'Suma' ti_pcn,
                             sum (ti_on_wartosc) ti_on_wartosc,
                             sum (ti_on_masa) ti_on_masa,
                             sum (ti_on_wartosc) / case when sum (ti_on_masa) != 0 then sum (ti_on_masa) else 1 end ti_on_srednia_cena,
                             sum (ti_op_wartosc) ti_op_wartosc,
                             sum (ti_op_masa) ti_op_masa,
                             sum (ti_op_wartosc) / case when sum (ti_op_masa) != 0 then sum (ti_op_masa) else 1 end ti_op_srednia_cena,
                             sum (ti_mb_wartosc) ti_mb_wartosc,
                             sum (ti_mb_masa) ti_mb_masa,
                             sum (ti_mb_wartosc) / case when sum (ti_mb_masa) != 0 then sum (ti_mb_masa) else 1 end ti_mb_srednia_cena
        from dgt_tablica_i1p
      -- ... ... ... przy listowaniu danego kodu na poziomie 4-znaków najpierw ta pozycja musi być zliczona na poziomie 2-znaków.
; with on2 as (-- on2
                      select left (ti_pcn, 2) ti_on_pcn,
                             sum (ti_on_wartosc) ti_on_wartosc,
                             sum (ti_on_masa) ti_on_masa,
                             sum (ti_on_wartosc) / case when sum (ti_on_masa) != 0 then sum (ti_on_masa) else 1 end ti_on_srednia_cena
                        from dgt_tablica_i1p
                       where len (ti_pcn) = 4
                         and ti_pcn != 'Suma'
                       group by left (ti_pcn, 2) ),
op2 as                     (-- op2
                      select left (ti_pcn, 2) ti_op_pcn,
                             sum (ti_op_wartosc) ti_op_wartosc,
                             sum (ti_op_masa) ti_op_masa,
                             sum (ti_op_wartosc) / case when sum (ti_op_masa) != 0 then sum (ti_op_masa) else 1 end ti_op_srednia_cena
                        from dgt_tablica_i1p
                       where len (ti_pcn) = 4
                         and ti_pcn != 'Suma'
                       group by left (ti_pcn, 2) ),
mb2 as                     (-- mb2
                      select left (ti_pcn, 2) ti_mb_pcn,
                             sum (ti_mb_wartosc) ti_mb_wartosc,
                             sum (ti_mb_masa) ti_mb_masa,
                             sum (ti_mb_wartosc) / case when sum (ti_mb_masa) != 0 then sum (ti_mb_masa) else 1 end ti_mb_srednia_cena
                        from dgt_tablica_i1p
                       where len (ti_pcn) = 4
                         and ti_pcn != 'Suma'
                       group by left (ti_pcn, 2) ),
calosc as (
				select * from on2
				left join op2 on ti_on_pcn = ti_op_pcn
                left join mb2 on ti_on_pcn = ti_mb_pcn
)

      insert into [stat].dgt_tablica_i1p
      select ti_on_pcn,
             ti_on_wartosc,
             ti_on_masa,
             ti_on_srednia_cena,
             ti_op_wartosc,
             ti_op_masa,
             ti_op_srednia_cena,
             ti_mb_wartosc,
             ti_mb_masa,
             ti_mb_srednia_cena
        from calosc
       order by 1;
      --
      -- ... ... dgt_tablica_i1w
      truncate table [stat].dgt_tablica_i1w

;	with on2 as (-- on2
                      select left (ek_pcn, 2) ti_on2_pcn,
                             sum(ek_wartosc_faktury) ti_on2_wartosc,
                             sum(ek_masa_netto) ti_on2_masa,
                             sum(ek_wartosc_faktury) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ti_on2_srednia_cena
                        from [stat].dgt_eksport_intr_agr
						where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (ek_pcn, 2)) ,
					op2 as  (-- op2
                      select left (ek_pcn, 2) ti_op2_pcn,
                             sum(ek_wartosc_faktury) ti_op2_wartosc,
                             sum(ek_masa_netto) ti_op2_masa,                             sum(ek_wartosc_faktury) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ti_op2_srednia_cena
                        from [stat].dgt_eksport_intr_agr
						where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (ek_pcn, 2)) ,
mb2 as                     (-- mb2
                      select left (ek_pcn, 2) ti_mb2_pcn,
                             sum(ek_wartosc_faktury) ti_mb2_wartosc,
                             sum(ek_masa_netto) ti_mb2_masa,
                             sum(ek_wartosc_faktury) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ti_mb2_srednia_cena
                        from [stat].dgt_eksport_intr_agr
						where ek_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (ek_pcn, 2)) ,
on4 as                     (-- on4
                      select left (ek_pcn, 4) ti_on4_pcn,
                             sum(ek_wartosc_faktury) ti_on4_wartosc,
                             sum(ek_masa_netto) ti_on4_masa,
                             sum(ek_wartosc_faktury) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ti_on4_srednia_cena
                        from [stat].dgt_eksport_intr_agr
						where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (ek_pcn, 4)) ,
op4 as                     (-- op4
                      select left (ek_pcn, 4) ti_op4_pcn,
                             sum(ek_wartosc_faktury) ti_op4_wartosc,
                             sum(ek_masa_netto) ti_op4_masa,
                             sum(ek_wartosc_faktury) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ti_op4_srednia_cena
                        from [stat].dgt_eksport_intr_agr
						where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (ek_pcn, 4)) ,
mb4 as                     (-- mb4
                      select left (ek_pcn, 4) ti_mb4_pcn,
                             sum(ek_wartosc_faktury) ti_mb4_wartosc,
                             sum(ek_masa_netto) ti_mb4_masa,
                             sum(ek_wartosc_faktury) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ti_mb4_srednia_cena
                        from [stat].dgt_eksport_intr_agr
						where ek_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (ek_pcn, 4)),
				calosc as (
					select * from on2
					inner join on4 on ti_on2_pcn = left (ti_on4_pcn, 2)
					left join op2 on ti_on2_pcn = ti_op2_pcn
					left join mb2 on ti_on2_pcn = ti_mb2_pcn
	                 left join op4 on ti_on4_pcn = ti_op4_pcn
		             left join mb4 on ti_on4_pcn = ti_mb4_pcn )

      insert into [stat].dgt_tablica_i1w
      select distinct
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_pcn else ti_on2_pcn end ti_pcn,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_wartosc else ti_on2_wartosc end ti_on_wartosc,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_masa else ti_on2_masa end ti_on_masa,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_on4_srednia_cena else ti_on2_srednia_cena end ti_on_srednia_cena,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_op4_wartosc else ti_op2_wartosc end ti_op_wartosc,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_op4_masa else ti_op2_masa end ti_op_masa,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_op4_srednia_cena else ti_op2_srednia_cena end ti_op_srednia_cena,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_mb4_wartosc else ti_mb2_wartosc end ti_mb_wartosc,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_mb4_masa else ti_mb2_masa end ti_mb_masa,
             case when abs (ti_op2_srednia_cena - ti_mb2_srednia_cena) > ti_op2_srednia_cena / 2 then ti_mb4_srednia_cena else ti_mb2_srednia_cena end ti_mb_srednia_cena
        from calosc
       order by 1;
      -- ... ... ... ogółem
      insert into [stat].dgt_tablica_i1w
      select 'Suma' ti_pcn,
             sum (ti_on_wartosc) ti_on_wartosc,
             sum (ti_on_masa) ti_on_masa,
             sum (ti_on_wartosc) / case when sum (ti_on_masa) != 0 then sum (ti_on_masa) else 1 end ti_on_srednia_cena,
             sum (ti_op_wartosc) ti_op_wartosc,
             sum (ti_op_masa) ti_op_masa,
             sum (ti_op_wartosc) / case when sum (ti_op_masa) != 0 then sum (ti_op_masa) else 1 end ti_op_srednia_cena,
             sum (ti_mb_wartosc) ti_mb_wartosc,
             sum (ti_mb_masa) ti_mb_masa,
             sum (ti_mb_wartosc) / case when sum (ti_mb_masa) != 0 then sum (ti_mb_masa) else 1 end ti_mb_srednia_cena
        from dgt_tablica_i1w;
      -- ... ... ... przy listowaniu danego kodu na poziomie 4-znaków najpierw ta pozycja musi być zliczona na poziomie 2-znaków.

with on2 as (-- on2
                      select left (ti_pcn, 2) ti_on_pcn,
                             sum(ti_on_wartosc) ti_on_wartosc,
                             sum(ti_on_masa) ti_on_masa,
                             sum(ti_on_wartosc) / case when sum(ti_on_masa) != 0 then sum(ti_on_masa) else 1 end ti_on_srednia_cena
                        from dgt_tablica_i1w
                       where len (ti_pcn) = 4
                         and ti_pcn != 'Suma'
                       group by left (ti_pcn, 2) ),
op2 as                     (-- op2
                      select left (ti_pcn, 2) ti_op_pcn,
                             sum(ti_op_wartosc) ti_op_wartosc,
                             sum(ti_op_masa) ti_op_masa,
                             sum(ti_op_wartosc) / case when sum(ti_op_masa) != 0 then sum(ti_op_masa) else 1 end ti_op_srednia_cena
                        from dgt_tablica_i1w
                       where len (ti_pcn) = 4
                         and ti_pcn != 'Suma'
                       group by left (ti_pcn, 2) ),
mb2 as                      (-- mb2
                      select left (ti_pcn, 2) ti_mb_pcn,
                             sum(ti_mb_wartosc) ti_mb_wartosc,
                             sum(ti_mb_masa) ti_mb_masa,
                             sum(ti_mb_wartosc) / case when sum(ti_mb_masa) != 0 then sum(ti_mb_masa) else 1 end ti_mb_srednia_cena
                        from dgt_tablica_i1w
                       where len (ti_pcn) = 4
                         and ti_pcn != 'Suma'
                       group by left (ti_pcn, 2) ),
calosc as (			select * from on2
					left join op2 on ti_on_pcn = ti_op_pcn
					left join mb2 on ti_on_pcn = ti_mb_pcn
             ) 

      insert into [stat].dgt_tablica_i1w
      select ti_on_pcn,
             ti_on_wartosc,
             ti_on_masa,
             ti_on_srednia_cena,
             ti_op_wartosc,
             ti_op_masa,
             ti_op_srednia_cena,
             ti_mb_wartosc,
             ti_mb_masa,
             ti_mb_srednia_cena
        from calosc
       order by 1;

      -- ... ... dgt_tablica_i2p
      truncate table [stat].dgt_tablica_i2p;

        with onn as (-- on
              select left (im_pcn, 2) ti_on_pcn,
                     sum (im_wartosc_faktury) ti_on_wartosc
                from dgt_import_intr_agr
				where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (im_pcn, 2)) ,
         onpr as (-- onpr
              select left (im_pcn, 2) ti_onpr_pcn,
                     case when sum (im_wartosc_faktury) != 0 then sum (im_wartosc_faktury) else 1 end ti_onpr_wartosc
---------------------------------------------------
---- Zmiana SN 2005.12.06
---             from dgt_import_intr_agr
---------------------------------------------------
             from dgt_import_intr_agr_arch
				where im_RokMc between dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@v_data_od)) and dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@p_data_do))
               group by left (im_pcn, 2)) ,
            mp as (-- mp
              select left (im_pcn, 2) ti_mp_pcn,
                     case when sum (im_wartosc_faktury) != 0 then sum (im_wartosc_faktury) else 1 end ti_mp_wartosc
                from dgt_import_intr_agr
				where im_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (im_pcn, 2)) ,
            mb as (-- mb
              select left (im_pcn, 2) ti_mb_pcn,
                     sum (im_wartosc_faktury) ti_mb_wartosc
                from dgt_import_intr_agr
				where im_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (im_pcn, 2)) ,
             mbpr as (-- mbpr
              select left (im_pcn, 2) ti_mbpr_pcn,
                     case when sum (im_wartosc_faktury) != 0 then sum (im_wartosc_faktury) else 1 end ti_mbpr_wartosc
---------------------------------------------------
---- Zmiana SN 2005.12.06
---             from dgt_import_intr_agr
---------------------------------------------------
                from dgt_import_intr_agr_arch
		    	where im_RokMc = dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@p_data_do))
               group by left (im_pcn, 2)) ,
			calosc as (
				select * from onn
			    left join mp on ti_on_pcn = ti_mp_pcn
			    left join mb on ti_on_pcn = ti_mb_pcn
				left join onpr on ti_on_pcn = ti_onpr_pcn
				left join mbpr on ti_on_pcn = ti_mbpr_pcn
			)

      insert into [stat].dgt_tablica_i2p
      select ti_on_pcn ti_pcn,
             ti_on_wartosc ti_on_wartosc,
             (ti_on_wartosc / ti_onpr_wartosc) * 100  ti_on_wartosc100,
             ti_mb_wartosc ti_mb_wartosc,
             (ti_mb_wartosc / ti_mbpr_wartosc) * 100 ti_mb_wartosc100,
             (ti_mb_wartosc / ti_mp_wartosc) * 100 ti_mp_wartosc100
		from calosc
       order by 1
      -- ... ... ... wstawienie podsumowania
      insert into [stat].dgt_tablica_i2p
      select 'Suma',
             sum (ti_on_wartosc), 
             null,
             sum (ti_mb_wartosc),
             null,
             null
        from dgt_tablica_i2p
      -- ... ... dgt_tablica_i2w
      truncate table [stat].dgt_tablica_i2w;

			with onn as (-- on
              select left (ek_pcn, 2) ti_on_pcn,
                     sum(ek_wartosc_faktury) ti_on_wartosc
                from stat.dgt_eksport_intr_agr
				where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (ek_pcn, 2)) ,
            onpr as (-- onpr
              select left (ek_pcn, 2) ti_onpr_pcn,
                     case when sum(ek_wartosc_faktury) != 0 then sum(ek_wartosc_faktury) else 1 end ti_onpr_wartosc
---------------------------------------------------
---- Zmiana SN 2005.12.06
--              from stat.dgt_eksport_intr_agr
---------------------------------------------------
                from stat.dgt_eksport_intr_agr_arch
			where ek_RokMc between dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@v_data_od)) and dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@p_data_do))
               group by left (ek_pcn, 2)) ,
             mp as (-- mp
              select left (ek_pcn, 2) ti_mp_pcn,
                     case when sum(ek_wartosc_faktury) != 0 then sum(ek_wartosc_faktury) else 1 end ti_mp_wartosc
                from stat.dgt_eksport_intr_agr
				where ek_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (ek_pcn, 2)) ,
            mb as (-- mb
              select left (ek_pcn, 2) ti_mb_pcn,
                     sum(ek_wartosc_faktury) ti_mb_wartosc
                from stat.dgt_eksport_intr_agr
				where ek_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (ek_pcn, 2)) ,
            mbpr as (-- mbpr
              select left (ek_pcn, 2) ti_mbpr_pcn,
                     case when sum(ek_wartosc_faktury) != 0 then sum(ek_wartosc_faktury) else 1 end ti_mbpr_wartosc
---------------------------------------------------
--- Zmiana SN 2005.12.06
---             from stat.dgt_eksport_intr_agr
---------------------------------------------------
               from stat.dgt_eksport_intr_agr_arch
               where ek_RokMc = dbo.KonwertujDateNaRokMc(dateadd (year, -1, @p_data_do))
               group by left (ek_pcn, 2)) ,
			calosc as (
				select * from onn
				left join mp on ti_on_pcn = ti_mp_pcn
				left join mb on ti_on_pcn = ti_mb_pcn
				left join onpr on ti_on_pcn = ti_onpr_pcn
				left join mbpr on ti_on_pcn = ti_mbpr_pcn )

      insert into [stat].dgt_tablica_i2w
      select ti_on_pcn ti_pcn,
             ti_on_wartosc ti_on_wartosc,
             (ti_on_wartosc / ti_onpr_wartosc) * 100  ti_on_wartosc100,
             ti_mb_wartosc ti_mb_wartosc,
             (ti_mb_wartosc / ti_mbpr_wartosc) * 100 ti_mb_wartosc100,
             (ti_mb_wartosc / ti_mp_wartosc) * 100 ti_mp_wartosc100
        from calosc
       order by 1
      -- ... ... ... wstawienie podsumowania
      insert into [stat].dgt_tablica_i2w
      select 'Suma',
             sum (ti_on_wartosc), 
             null,
             sum (ti_mb_wartosc),
             null,
             null
        from dgt_tablica_i2w
    end
  --
  -- Ustawienie poczatkowej daty dla sadow
  print '-- ... ustawienie poczatkowej daty'
  if     year (@p_data_od) = year (@p_data_do)
     and year (@p_data_do) != 2004
    begin
      select @v_data_od = convert (datetime, convert (varchar, year (@p_data_do)) + '0101', 112)
    end
  else
    begin
      -- ... ... dla roku 2004 i pierwszych 2 miesiecy roku 2005 procedury doszacowania
      --         beda generowane od 06.2004
      if    year (@p_data_do) = 2004
         or (     year (@p_data_do) = 2005
              and month (@p_data_do) <= 2)
        begin
           select @v_data_od = convert (datetime, convert (varchar, case when year (@p_data_do) = 2004 then year (@p_data_do) else year (@p_data_do) - 1 end) + '0101', 112)
        end
      else
        -- ... ... od roku 2006 i pierwszych 2 miesiecy danego roku procedury doszacowania
        --         beda generowane od stycznia roku poprzedniego
        if     year (@p_data_do) >= 2006
           and month (@p_data_do) <= 2
          begin
            select @v_data_od = convert (datetime, convert (varchar, year (dateadd (year, -1, @p_data_do))) + '0101', 112)
          end
        else
          -- ... ... od roku 2006 i kolejnych miesiecy powyzej pierwszych 2 danego roku procedury doszacowania
          --         beda generowane od stycznia danego roku
          select @v_data_od = convert (datetime, convert (varchar, year (@p_data_do)) + '0101', 112)
    end
  print '@v_data_biezz = ' + convert (varchar, @v_data_od, 111)
  --
  -- ... sad
  if @p_rodzaj_danych = 'SAD'
    begin
      -- ... ... dgt_tablica_s1p
      truncate table [stat].dgt_tablica_s1p;

                with on2 as (-- on2
                      select left (im_pcn, 2) ts_on2_pcn,
                             sum(im_wartosc_stat_zl) ts_on2_wartosc,
                             sum (im_masa_netto) ts_on2_masa,
                             sum(im_wartosc_stat_zl) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ts_on2_srednia_cena
                        from dgt_import_sad_sads_agr
						where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (im_pcn, 2) ),
                  op2 as (-- op2
                      select left (im_pcn, 2) ts_op2_pcn,
                             sum(im_wartosc_stat_zl) ts_op2_wartosc,
                             sum (im_masa_netto) ts_op2_masa,
                             sum(im_wartosc_stat_zl) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ts_op2_srednia_cena
                        from dgt_import_sad_sads_agr
						where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@p_data_do))
                       group by left (im_pcn, 2) ),
                    mb2 as (-- mb2
                      select left (im_pcn, 2) ts_mb2_pcn,
                             sum(im_wartosc_stat_zl) ts_mb2_wartosc,
                             sum (im_masa_netto) ts_mb2_masa,
                             sum(im_wartosc_stat_zl) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ts_mb2_srednia_cena
                        from dgt_import_sad_sads_agr
					   	where im_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (im_pcn, 2) ),
                    on4 as (-- on4
                      select left (im_pcn, 4) ts_on4_pcn,
                             sum(im_wartosc_stat_zl) ts_on4_wartosc,
                             sum (im_masa_netto) ts_on4_masa,
                             sum(im_wartosc_stat_zl) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ts_on4_srednia_cena
                        from dgt_import_sad_sads_agr
						where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (im_pcn, 4) ),
                    op4 as (-- op4
                      select left (im_pcn, 4) ts_op4_pcn,
                             sum(im_wartosc_stat_zl) ts_op4_wartosc,
                             sum (im_masa_netto) ts_op4_masa,
                             sum(im_wartosc_stat_zl) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ts_op4_srednia_cena
                        from dgt_import_sad_sads_agr
				where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@p_data_do))
                       group by left (im_pcn, 4) ),
                    mb4 as (-- mb4
                      select left (im_pcn, 4) ts_mb4_pcn,
                             sum(im_wartosc_stat_zl) ts_mb4_wartosc,
                             sum (im_masa_netto) ts_mb4_masa,
                             sum(im_wartosc_stat_zl) / case when sum (im_masa_netto) != 0 then sum (im_masa_netto) else 1 end ts_mb4_srednia_cena
                        from dgt_import_sad_sads_agr
					   where im_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
                       group by left (im_pcn, 4) ),
					calosc as (
						select * from on2
						inner join on4 on ts_on2_pcn = left (ts_on4_pcn, 2)
						left join op2 on ts_on2_pcn = ts_op2_pcn
						left join mb2 on ts_on2_pcn = ts_mb2_pcn
						left join op4 on ts_on4_pcn = ts_op4_pcn
						left join mb4 on ts_on4_pcn = ts_mb4_pcn )

      insert into [stat].dgt_tablica_s1p
      select distinct
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_pcn else ts_on2_pcn end ts_pcn,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_wartosc else ts_on2_wartosc end ts_on_wartosc,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_masa else ts_on2_masa end ts_on_masa,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_srednia_cena else ts_on2_srednia_cena end ts_on_srednia_cena,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_op4_wartosc else ts_op2_wartosc end ts_op_wartosc,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_op4_masa else ts_op2_masa end ts_op_masa,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_op4_srednia_cena else ts_op2_srednia_cena end ts_op_srednia_cena,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_mb4_wartosc else ts_mb2_wartosc end ts_mb_wartosc,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_mb4_masa else ts_mb2_masa end ts_mb_masa,
             case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_mb4_srednia_cena else ts_mb2_srednia_cena end ts_mb_srednia_cena
        from calosc
       order by 1
      -- ... ... ... ogółem
      insert into [stat].dgt_tablica_s1p
      select 'Suma' ts_on_pcn,
             sum(ts_on_wartosc) ts_on_wartosc,
             sum(ts_on_masa) ts_on_masa,
             sum(ts_on_wartosc) / case when sum(ts_on_masa) != 0 then sum(ts_on_masa) else 1 end ts_on_srednia_cena,
             sum(ts_op_wartosc) ts_op_wartosc,
             sum(ts_op_masa) ts_op_masa,
             sum(ts_op_wartosc) / case when sum(ts_op_masa) != 0 then sum(ts_op_masa) else 1 end ts_op_srednia_cena,
             sum(ts_mb_wartosc) ts_mb_wartosc,
             sum(ts_mb_masa) ts_mb_masa,
             sum(ts_mb_wartosc) / case when sum(ts_mb_masa) != 0 then sum(ts_mb_masa) else 1 end ts_mb_srednia_cena
        from dgt_tablica_s1p;
      -- ... ... ... przy listowaniu danego kodu na poziomie 4-znaków najpierw ta pozycja musi być zliczona na poziomie 2-znaków.
                with on2 as (-- on2
                      select left (ts_pcn, 2) ts_on_pcn,
                             sum(ts_on_wartosc) ts_on_wartosc,
                             sum(ts_on_masa) ts_on_masa,
                             sum(ts_on_wartosc) / case when sum(ts_on_masa) != 0 then sum(ts_on_masa) else 1 end ts_on_srednia_cena
                        from dgt_tablica_s1p
                       where len (ts_pcn) = 4
                         and ts_pcn != 'Suma'
                       group by left (ts_pcn, 2) ),
                  op2 as  (-- op2
                      select left (ts_pcn, 2) ts_op_pcn,
                             sum(ts_op_wartosc) ts_op_wartosc,
                             sum(ts_op_masa) ts_op_masa,
                             sum(ts_op_wartosc) / case when sum(ts_op_masa) != 0 then sum(ts_op_masa) else 1 end ts_op_srednia_cena
                        from dgt_tablica_s1p
                       where len (ts_pcn) = 4
                         and ts_pcn != 'Suma'
                       group by left (ts_pcn, 2) ),
                   mb2 as (-- mb2
                      select left (ts_pcn, 2) ts_mb_pcn,
                             sum(ts_mb_wartosc) ts_mb_wartosc,
                             sum(ts_mb_masa) ts_mb_masa,
                             sum(ts_mb_wartosc) / case when sum(ts_mb_masa) != 0 then sum(ts_mb_masa) else 1 end ts_mb_srednia_cena
                        from dgt_tablica_s1p
                       where len (ts_pcn) = 4
                         and ts_pcn != 'Suma'
                       group by left (ts_pcn, 2) ),
				calosc as (
					select * from on2 
					left join op2 on ts_on_pcn = ts_op_pcn
					left join mb2 on ts_on_pcn = ts_mb_pcn
				)
      insert into [stat].dgt_tablica_s1p
      select ts_on_pcn,
             ts_on_wartosc,
             ts_on_masa,
             ts_on_srednia_cena,
             ts_op_wartosc,
             ts_op_masa,
             ts_op_srednia_cena,
             ts_mb_wartosc,
             ts_mb_masa,
             ts_mb_srednia_cena
        from calosc
       order by 1
      -- ... ... dgt_tablica_s1w
      truncate table [stat].dgt_tablica_s1w;

		with on2 as (-- on2
				select left (ek_pcn, 2) ts_on2_pcn,
						sum(ek_wartosc_stat_zl) ts_on2_wartosc,
						sum(ek_masa_netto) ts_on2_masa,
						sum(ek_wartosc_stat_zl) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ts_on2_srednia_cena
				from dgt_eksport_sad_sads_agr
				where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
				group by left (ek_pcn, 2) ),
			op2 as  (-- op2
				select left (ek_pcn, 2) ts_op2_pcn,
						sum(ek_wartosc_stat_zl) ts_op2_wartosc,
						sum(ek_masa_netto) ts_op2_masa,
						sum(ek_wartosc_stat_zl) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ts_op2_srednia_cena
				from dgt_eksport_sad_sads_agr
				where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@p_data_do))
				group by left (ek_pcn, 2) ),
			mb2 as  (-- mb2
				select left (ek_pcn, 2) ts_mb2_pcn,
						sum(ek_wartosc_stat_zl) ts_mb2_wartosc,
						sum(ek_masa_netto) ts_mb2_masa,
						sum(ek_wartosc_stat_zl) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ts_mb2_srednia_cena
				from dgt_eksport_sad_sads_agr
				where ek_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
				group by left (ek_pcn, 2) ),
			on4 as (-- on4
				select left (ek_pcn, 4) ts_on4_pcn,
						sum(ek_wartosc_stat_zl) ts_on4_wartosc,
						sum(ek_masa_netto) ts_on4_masa,
						sum(ek_wartosc_stat_zl) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ts_on4_srednia_cena
				from dgt_eksport_sad_sads_agr
				where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
				group by left (ek_pcn, 4) ),
			op4 as  (-- op4
				select left (ek_pcn, 4) ts_op4_pcn,
						sum(ek_wartosc_stat_zl) ts_op4_wartosc,
						sum(ek_masa_netto) ts_op4_masa,
						sum(ek_wartosc_stat_zl) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ts_op4_srednia_cena
				from dgt_eksport_sad_sads_agr
				where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@p_data_do))
				group by left (ek_pcn, 4) ),
			mb4 as  (-- mb4
				select left (ek_pcn, 4) ts_mb4_pcn,
						sum(ek_wartosc_stat_zl) ts_mb4_wartosc,
						sum(ek_masa_netto) ts_mb4_masa,
						sum(ek_wartosc_stat_zl) / case when sum(ek_masa_netto) != 0 then sum(ek_masa_netto) else 1 end ts_mb4_srednia_cena
				from dgt_eksport_sad_sads_agr
				where ek_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
				group by left (ek_pcn, 4)),
			calosc as (
				select * from on2 
				inner join on4 on ts_on2_pcn = left (ts_on4_pcn, 2)
				left join op2 on ts_on2_pcn = ts_op2_pcn
				left join mb2 on ts_on2_pcn = ts_mb2_pcn
				left join op4 on ts_on4_pcn = ts_op4_pcn
				left join mb4 on ts_on4_pcn = ts_mb4_pcn
			)

		insert into [stat].dgt_tablica_s1w
		select distinct
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_pcn else ts_on2_pcn end ts_pcn,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_wartosc else ts_on2_wartosc end ts_on_wartosc,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_masa else ts_on2_masa end ts_on_masa,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_on4_srednia_cena else ts_on2_srednia_cena end ts_on_srednia_cena,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_op4_wartosc else ts_op2_wartosc end ts_op_wartosc,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_op4_masa else ts_op2_masa end ts_op_masa,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_op4_srednia_cena else ts_op2_srednia_cena end ts_op_srednia_cena,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_mb4_wartosc else ts_mb2_wartosc end ts_mb_wartosc,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_mb4_masa else ts_mb2_masa end ts_mb_masa,
				case when abs (ts_op2_srednia_cena - ts_mb2_srednia_cena) > ts_op2_srednia_cena / 2 then ts_mb4_srednia_cena else ts_mb2_srednia_cena end ts_mb_srednia_cena
		from calosc
		order by 1
      -- ... ... ... ogółem
      insert into [stat].dgt_tablica_s1w
      select 'Suma' ts_on_pcn,
             sum(ts_on_wartosc) ts_on_wartosc,
             sum(ts_on_masa) ts_on_masa,
             sum(ts_on_wartosc) / case when sum(ts_on_masa) != 0 then sum(ts_on_masa) else 1 end ts_on_srednia_cena,
             sum(ts_op_wartosc) ts_op_wartosc,
             sum(ts_op_masa) ts_op_masa,
             sum(ts_op_wartosc) / case when sum(ts_op_masa) != 0 then sum(ts_op_masa) else 1 end ts_op_srednia_cena,
             sum(ts_mb_wartosc) ts_mb_wartosc,
             sum(ts_mb_masa) ts_mb_masa,
             sum(ts_mb_wartosc) / case when sum(ts_mb_masa) != 0 then sum(ts_mb_masa) else 1 end ts_mb_srednia_cena
        from dgt_tablica_s1w;
      -- ... ... ... przy listowaniu danego kodu na poziomie 4-znaków najpierw ta pozycja musi być zliczona na poziomie 2-znaków.
        with on2 as (-- on2
                select left (ts_pcn, 2) ts_on_pcn,
                        sum(ts_on_wartosc) ts_on_wartosc,
                        sum(ts_on_masa) ts_on_masa,
                        sum(ts_on_wartosc) / case when sum(ts_on_masa) != 0 then sum(ts_on_masa) else 1 end ts_on_srednia_cena
                from dgt_tablica_s1w
                where len (ts_pcn) = 4
                    and ts_pcn != 'Suma'
                group by left (ts_pcn, 2) ),
             op2 as (-- op2
                select left (ts_pcn, 2) ts_op_pcn,
                        sum(ts_op_wartosc) ts_op_wartosc,
                        sum(ts_op_masa) ts_op_masa,
                        sum(ts_op_wartosc) / case when sum(ts_op_masa) != 0 then sum(ts_op_masa) else 1 end ts_op_srednia_cena
                from dgt_tablica_s1w
                where len (ts_pcn) = 4
                    and ts_pcn != 'Suma'
                group by left (ts_pcn, 2) ),
               mb2 as (-- mb2
                select left (ts_pcn, 2) ts_mb_pcn,
                        sum(ts_mb_wartosc) ts_mb_wartosc,
                        sum(ts_mb_masa) ts_mb_masa,
                        sum(ts_mb_wartosc) / case when sum(ts_mb_masa) != 0 then sum(ts_mb_masa) else 1 end ts_mb_srednia_cena
                from dgt_tablica_s1w
                where len (ts_pcn) = 4
                    and ts_pcn != 'Suma'
                group by left (ts_pcn, 2)),
			calosc as (
				select * from on2 
				left join op2 on ts_on_pcn = ts_op_pcn
				left join mb2 on ts_on_pcn = ts_mb_pcn )

      insert into [stat].dgt_tablica_s1w
      select ts_on_pcn,
             ts_on_wartosc,
             ts_on_masa,
             ts_on_srednia_cena,
             ts_op_wartosc,
             ts_op_masa,
             ts_op_srednia_cena,
             ts_mb_wartosc,
             ts_mb_masa,
             ts_mb_srednia_cena
        from calosc
       order by 1
      -- ... ... dgt_tablica_s2p
      truncate table [stat].dgt_tablica_s2p;

        with onn as (-- on
              select left (im_pcn, 2) ts_on_pcn,
                     sum(im_wartosc_stat_zl) ts_on_wartosc
                from dgt_import_sad_sads_agr
				where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (im_pcn, 2) ),
            onpr as (-- onpr
              select left (im_pcn, 2) ts_onpr_pcn,
                     case when sum(im_wartosc_stat_zl) != 0 then sum(im_wartosc_stat_zl) else 1 end ts_onpr_wartosc
----------------------------------------------------
---- Zmiana SN 2005.12.01
----           from dgt_import_sad_sads_agr
----------------------------------------------------
               from dgt_import_sad_sads_agr_arch
				where im_RokMc between dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@v_data_od)) and dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@p_data_do))
               group by left (im_pcn, 2) ),
            mp as (-- mp
              select left (im_pcn, 2) ts_mp_pcn,
                     case when sum(im_wartosc_stat_zl) != 0 then sum(im_wartosc_stat_zl) else 1 end ts_mp_wartosc
                from dgt_import_sad_sads_agr
				where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@p_data_do))
               group by left (im_pcn, 2) ),
            mb as (-- mb
              select left (im_pcn, 2) ts_mb_pcn,
                     sum(im_wartosc_stat_zl) ts_mb_wartosc
                from dgt_import_sad_sads_agr
				where im_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (im_pcn, 2) ),
            mbpr as (-- mbpr
              select left (im_pcn, 2) ts_mbpr_pcn,
                     case when sum(im_wartosc_stat_zl) != 0 then sum(im_wartosc_stat_zl) else 1 end ts_mbpr_wartosc
----------------------------------------------------
---- Zmiana SN 2005.12.01
----           from dgt_import_sad_sads_agr
----------------------------------------------------
               from dgt_import_sad_sads_agr_arch
				where im_RokMc = dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@p_data_do))
               group by left (im_pcn, 2) ),
			calosc as (
				select * from onn
				left join mp on ts_on_pcn = ts_mp_pcn
				left join mb on ts_on_pcn = ts_mb_pcn
				left join onpr on ts_on_pcn = ts_onpr_pcn
				left join mbpr on ts_on_pcn = ts_mbpr_pcn  )

      insert into [stat].dgt_tablica_s2p
      select ts_on_pcn ts_pcn,
             ts_on_wartosc ts_on_wartosc,
             (ts_on_wartosc / ts_onpr_wartosc) * 100  ts_on_wartosc100,
             ts_mb_wartosc ts_mb_wartosc,
             (ts_mb_wartosc / ts_mbpr_wartosc) * 100 ts_mb_wartosc100,
             (ts_mb_wartosc / ts_mp_wartosc) * 100 ts_mp_wartosc100
		from calosc 
       order by 1
      -- ... ... ... wstawienie podsumowania
      insert into [stat].dgt_tablica_s2p
      select 'suma',
             sum (ts_on_wartosc), 
             null,
             sum (ts_mb_wartosc),
             null,
             null
        from dgt_tablica_s2p
      -- ... ... dgt_tablica_s2w
      truncate table [stat].dgt_tablica_s2w;

	  with onn as (-- on
              select left (ek_pcn, 2) ts_on_pcn,
                     sum(ek_wartosc_stat_zl) ts_on_wartosc
                from dgt_eksport_sad_sads_agr
				where ek_RokMc between dbo.[KonwertujDateNaRokMc](@v_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (ek_pcn, 2) ),
           onpr as (-- onpr
              select left (ek_pcn, 2) ts_onpr_pcn,
                     case when sum(ek_wartosc_stat_zl) != 0 then sum(ek_wartosc_stat_zl) else 1 end ts_onpr_wartosc
----------------------------------------------------
---- Zmiana SN 2005.12.01
----           from dgt_eksport_sad_sads_agr
----------------------------------------------------
               from dgt_eksport_sad_sads_agr_arch
				where ek_RokMc between dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@v_data_od)) and dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@p_data_do))
               group by left (ek_pcn, 2) ),
            mp as (-- mp
              select left (ek_pcn, 2) ts_mp_pcn,
                     case when sum(ek_wartosc_stat_zl) != 0 then sum(ek_wartosc_stat_zl) else 1 end ts_mp_wartosc
                from dgt_eksport_sad_sads_agr
				where ek_RokMc = dbo.[KonwertujDateNaRokMc](dateadd(month,-1,@p_data_do))
               group by left (ek_pcn, 2) ),
            mb as (-- mb
              select left (ek_pcn, 2) ts_mb_pcn,
                     sum(ek_wartosc_stat_zl) ts_mb_wartosc
                from dgt_eksport_sad_sads_agr
				where ek_RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
               group by left (ek_pcn, 2) ),
            mbpr as (-- mbpr
              select left (ek_pcn, 2) ts_mbpr_pcn,
                     case when sum(ek_wartosc_stat_zl) != 0 then sum(ek_wartosc_stat_zl) else 1 end ts_mbpr_wartosc
----------------------------------------------------
---- Zmiana SN 2005.12.01
----           from dgt_eksport_sad_sads_agr
----------------------------------------------------
               from dgt_eksport_sad_sads_agr_arch
				where ek_RokMc = dbo.[KonwertujDateNaRokMc](dateadd(year,-1,@p_data_do))
               group by left (ek_pcn, 2) ),
			calosc as (
				select * from onn
				left join mp on ts_on_pcn = ts_mp_pcn
				left join mb on ts_on_pcn = ts_mb_pcn
				left join onpr on ts_on_pcn = ts_onpr_pcn
				left join mbpr on ts_on_pcn = ts_mbpr_pcn
			)

      insert into [stat].dgt_tablica_s2w
      select ts_on_pcn ts_pcn,
             ts_on_wartosc ts_on_wartosc,
             (ts_on_wartosc / ts_onpr_wartosc) * 100  ts_on_wartosc100,
             ts_mb_wartosc ts_mb_wartosc,
             (ts_mb_wartosc / ts_mbpr_wartosc) * 100 ts_mb_wartosc100,
             (ts_mb_wartosc / ts_mp_wartosc) * 100 ts_mp_wartosc100
		from calosc
       order by 1
      -- ... ... ... wstawienie podsumowania
      insert into [stat].dgt_tablica_s2w
      select 'suma',
             sum (ts_on_wartosc), 
             null,
             sum (ts_mb_wartosc),
             null,
             null
        from dgt_tablica_s2w
    end
  --
  exec stat.DziennikWpisInfo 'stop: dgp_tablice_kontrolne'