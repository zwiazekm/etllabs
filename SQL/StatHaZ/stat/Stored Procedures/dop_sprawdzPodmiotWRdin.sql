CREATE PROCEDURE stat.dop_sprawdzPodmiotWRdin
  --@p_nip varchar(10),
  @p_rok int,
  --@p_miesiac int,
  @p_typ char(1),
  @p1 numeric(5,2)--,
  --@p2 smallint--,
  --@czyZweryfikowanyWRdin bit output
as
begin

	if @p_typ = 'P'
	begin
	    insert into stat.dot_rdinPodmiotyWeryf
		select r.NIP, 
		       ou.RokMc, 
			   --ou.stat_przywoz, 
			   --r.minimalna_wartosc_nabyc, 
			   --r.maksymalna_wartosc_nabyc,
			   'P' typ,
		       case when (ou.stat_przywoz > r.minimalna_wartosc_nabyc) and (ou.stat_przywoz < r.maksymalna_wartosc_nabyc) then 1 else 0 end czyZweryfikowanyWRdin
		  from (select r.NIP,
					   r.RokMc,
					   r.trans_nabycie,
					   r.trans_nabycie+(r.trans_nabycie*@p1) maksymalna_wartosc_nabyc,
					   r.trans_nabycie-(r.trans_dostawa*@p1) minimalna_wartosc_nabyc
				  from stat.dgt_kopia_intr_rdin r
				 where r.Rok = @p_rok - 1) r, --2012
				stat.dot_obroty_ubiegloroczne ou,
				stat.dgt_kopia_intr_dane_pod dp
		  where ou.id_pod = dp.id_pod
			and dp.nip = r.NIP
			and ou.RokMc = r.RokMc
		  order by r.NIP, ou.RokMc;
	end; --if
	else
	begin -- dla typu 'W'
	    insert into stat.dot_rdinPodmiotyWeryf
		select r.NIP, 
		       ou.RokMc, 
			   --ou.stat_przywoz, 
			   --r.minimalna_wartosc_dostaw, 
			   --r.maksymalna_wartosc_dostaw,
			   'W' typ,
		       case when (ou.stat_wywoz > r.minimalna_wartosc_dostaw) and (ou.stat_wywoz < r.maksymalna_wartosc_dostaw) then 1 else 0 end czyZweryfikowanyWRdin
		  from (select r.NIP,
					   r.RokMc,
					   r.trans_dostawa,
					   r.trans_dostawa+(r.trans_dostawa*@p1) maksymalna_wartosc_dostaw,
					   r.trans_dostawa-(r.trans_dostawa*@p1) minimalna_wartosc_dostaw
				  from stat.dgt_kopia_intr_rdin r
				 where r.RokMc / 100 = @p_rok -1) r,
				stat.dot_obroty_ubiegloroczne ou,
				stat.dgt_kopia_intr_dane_pod dp
		  where ou.id_pod = dp.id_pod
			and dp.nip = r.NIP
			and ou.RokMc = r.RokMc
		  order by r.NIP, ou.RokMc;
	end; --if else


end;