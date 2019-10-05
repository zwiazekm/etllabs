create procedure stat.dop_sprawdzPodmiotWVies
  --@p_nip varchar(10) /*='5252279467'*/,
  @p_rok int,
  --@p_miesiac int,
  @p_typ char(1),
  @p1 numeric(5,2)--,
 -- @p2 smallint,
 -- @czyZweryfikowanyWVies bit output
as
begin
  -- declare @ilosc_wykroczen_wobec_instr int;
  -- declare @v_miesiace integer = 12;
  --

  if @p_typ = 'P'
  begin
	 -- select @v_miesiac = 1;
	  --
	  --while @v_miesiac <= 12
		--begin
		    insert into [stat].[dot_viesPodmiotyWeryf]
			select --@ilosc_wykroczen_wobec_instr = @v_miesiace - count(*)
			       ogr.nip,
				   ogr.RokMc,
				   ogr.typ,
			       case when (ou.stat_przywoz > ogr.minimalna_wartosc_obrotow) and (ou.stat_przywoz < ogr.maksymalna_wartosc_obrotow) then 1 else 0 end czyZweryfikowanyWVies
			  from stat.dot_obroty_ubiegloroczne ou,
				   (select v.nip,
						   v.typ,
						   v.RokMc,
						   v.wartosc_obrotow,
						   v.wartosc_obrotow+(v.wartosc_obrotow*@p1) maksymalna_wartosc_obrotow,
						   v.wartosc_obrotow-(v.wartosc_obrotow*@p1) minimalna_wartosc_obrotow
					  from stat.dot_obrotyMiesieczneWVies v
					 where /*v.nip = @p_nip
					   and */v.typ = 'P'
					   and v.RokMc/100 = @p_rok -1 --2012
					   /*and v.nrOkresu = @v_miesiac*/) ogr,
				   stat.dgt_kopia_intr_dane_pod dp
			 where ou.id_pod = dp.id_pod
			   and dp.nip = ogr.nip
			   and ou.RokMc = ogr.RokMc
			   --and ou.stat_przywoz > ogr.minimalna_wartosc_obrotow
			   --and ou.stat_przywoz < ogr.maksymalna_wartosc_obrotow;
				 --
		---	select @v_miesiac = @v_miesiac + 1;
		--end; --while
  end; --if
  else
  begin
     -- select @v_miesiac = 1;
	  --
	  --while @v_miesiac <= 12
		--begin
		    insert into [stat].[dot_viesPodmiotyWeryf]
			select --@ilosc_wykroczen_wobec_instr = @v_miesiace - count(*)
			       ogr.nip,
				   ogr.RokMc,
				   ogr.typ,
			       case when (ou.stat_wywoz > ogr.minimalna_wartosc_obrotow) and (ou.stat_wywoz < ogr.maksymalna_wartosc_obrotow) then 1 else 0 end czyZweryfikowanyWVies
			  from stat.dot_obroty_ubiegloroczne ou,
				   (select v.nip,
						   v.typ,
						   v.RokMc,
						   v.wartosc_obrotow,
						   v.wartosc_obrotow+(v.wartosc_obrotow*@p1) maksymalna_wartosc_obrotow,
						   v.wartosc_obrotow-(v.wartosc_obrotow*@p1) minimalna_wartosc_obrotow
					  from stat.dot_obrotyMiesieczneWVies v
					 where /*v.nip = @p_nip
					   and */v.typ = 'W'
					   and v.RokMc/100 = @p_rok -1
					   /*and v.nrOkresu = @v_miesiac*/) ogr,
				   stat.dgt_kopia_intr_dane_pod dp
			 where ou.id_pod = dp.id_pod
			   and dp.nip = ogr.nip
			   and ou.RokMc = ogr.RokMc;
			   --and ou.stat_wywoz > ogr.minimalna_wartosc_obrotow
			   --and ou.stat_wywoz < ogr.maksymalna_wartosc_obrotow;
				 --
			--select @v_miesiac = @v_miesiac + 1;
		--end; --while
  end; --if else

  /*if @ilosc_wykroczen_wobec_instr <= @p2
    set @czyZweryfikowanyWVies = 1;
  else
    set @czyZweryfikowanyWVies = 0;*/
end;