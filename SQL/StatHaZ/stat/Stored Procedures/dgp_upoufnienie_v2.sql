










CREATE           PROCEDURE [stat].dgp_upoufnienie_v2
  @p_rodzaj_danych varchar (10), -- SAD, INTR
  @p_typ           varchar (10) -- P - przywóz, W - wywóz
as
  declare @v_komunikat varchar(100) 

-- import Intrastat
	if @p_rodzaj_danych = 'INTR' and @p_typ = 'P'
   begin
   exec stat.DziennikWpisInfo 'dgp_upoufnienie_v2, rodzaj: INTR, typ: P' 
    -- kraj pochodzenia i kraj wysyłki
	update [stat].dgt_import_intr
	set im_kraj_pochodzenia='QY', im_kraj_wysylki='QY'
	from dgt_import_intr
	where im_pcn = '21021039' and im_kraj_pochodzenia = 'DE'
   
	select @v_komunikat = 'dgp_upoufnienie_v2 - INTR P KP KW - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID


-- pismo z GUS z dnia 24.04.2013
	update [stat].dgt_import_intr
	set im_kraj_pochodzenia='QZ', im_kraj_wysylki='QZ'
	from dgt_import_intr
	where im_nip='8790168837' and im_odbiorca='87057471800000' and im_kraj_pochodzenia='UA' and im_kraj_wysylki='UA' and im_pcn='31023090' and im_RokMc between 201301 and 201312

	select @v_komunikat = 'dgp_upoufnienie_v2 - INTR P KP KW - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
	end
	

-- eksport Intrastat
  if @p_rodzaj_danych = 'INTR' and @p_typ = 'W'
  begin
  exec stat.DziennikWpisInfo 'dgp_upoufnienie_v2, rodzaj: INTR, typ: W' 
    -- kod PCN
    update [stat].dgt_eksport_intr
       set ek_zp = 'P',
           ek_pcn = '25232900'
		from dgt_eksport_intr
		where ek_pcnp='25233000'

    select @v_komunikat = 'dgp_upoufnienie_v2 - INTR W PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    

    update [stat].dgt_eksport_intr
       set ek_zp = 'P',
           ek_pcn = '28369917'
		from dgt_eksport_intr
		where ek_pcnp in ('28362000','28363000')

    select @v_komunikat = 'dgp_upoufnienie_v2 - INTR W PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 

-- pismo z GUS z dnia 04.02.2013
    update [stat].dgt_eksport_intr
       set ek_zp = 'P',
           ek_pcn = '28369917'
		from dgt_eksport_intr
		where ek_pcnp in ('28362000','28363000') and ek_nip='1180019377' and ek_odbiorca='01117987800000' and ek_RokMc between 201301 and 201312

    select @v_komunikat = 'dgp_upoufnienie_v2 - INTR W PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 

    update [stat].dgt_eksport_intr
       set ek_zp = 'P',
           ek_pcn = '28273985'
		from dgt_eksport_intr
		where ek_pcnp in ('28272000') and ek_nip='1180019377' and ek_odbiorca='01117987800000' and ek_RokMc between 201301 and 201312

    select @v_komunikat = 'dgp_upoufnienie_v2 - INTR W PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 

    update [stat].dgt_eksport_intr
       set ek_zp = 'P',
           ek_pcn = '25232900'
		from dgt_eksport_intr
		where ek_pcnp in ('25233000') and ek_nip='6281949778' and ek_odbiorca='35708206200000' and ek_RokMc between 201301 and 201312

    select @v_komunikat = 'dgp_upoufnienie_v2 - INTR W PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 
--koniec pisma z dnia 04.02.2013

-- pismo z GUS z dnia 21.03.2013 firma RUETGERS
    update [stat].dgt_eksport_intr
       set ek_zp = 'P',
           ek_pcn = '27040090'
		from dgt_eksport_intr
		where ek_pcnp in ('27081000') and ek_RokMc between 201301 and 201312

    select @v_komunikat = 'dgp_upoufnienie_v2 - INTR W PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 
-- koniec pisma z dnia 21.03.2013 firma RUETGERS



  end


-- import SAD
if @p_rodzaj_danych = 'SAD' and @p_typ = 'P'
  begin
    exec stat.DziennikWpisInfo 'dgp_upoufnienie_v2, rodzaj: SAD, typ: P'
    -- kod PCN
    update [stat].dgt_import_sad
       set im_zp = 'P',
           im_pcn = '2905190000'
		from dgt_import_sad
		where im_pcnp like '29051100%' and im_kraj_pochodzenia='VE' and im_kraj_wysylki='VE'
      
    select @v_komunikat = 'dgp_upoufnienie_v2 - SAD P PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID  
	--

	-- pismo z GUS z dnia 24.04.2013
	update [stat].dgt_import_sad
	set im_kraj_pochodzenia='QZ', im_kraj_wysylki='QZ'
	from dgt_import_sad
	where im_odbiorca='87057471800000' and im_kraj_pochodzenia='UA' and im_kraj_wysylki='UA' and im_pcn='3102309000' and im_RokMc between 201301 and 201312

	select @v_komunikat = 'dgp_upoufnienie_v2 - SAD P KP KW - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
end


-- eksport SAD
  if @p_rodzaj_danych = 'SAD' and @p_typ = 'W'
  begin
    exec stat.DziennikWpisInfo 'dgp_upoufnienie_v2, rodzaj: SAD, typ: W' 
    -- kod PCN
    update [stat].dgt_eksport_sad
	 set ek_zp = 'P',
           ek_pcn = '25232900'
		from dgt_eksport_sad
		where ek_pcnp='25233000'
		
    select @v_komunikat = 'dgp_upoufnienie_v2 - SAD W PCN  - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID    


   update [stat].dgt_eksport_sad
	 set ek_zp = 'P',
           ek_pcn = '28369917'
		from dgt_eksport_sad
		where ek_pcnp in ('28362000','28363000')
		
    select @v_komunikat = 'dgp_upoufnienie_v2 - SAD W PCN  - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 

-- pismo z GUS z dnia 04.02.2013  
   update [stat].dgt_eksport_sad
	 set ek_zp = 'P',
           ek_pcn = '25232900'
		from dgt_eksport_sad
		where ek_pcnp in ('25233000') and ek_odbiorca='35708206200000' and ek_RokMc between 201301 and 201312
		
    select @v_komunikat = 'dgp_upoufnienie_v2 - SAD W PCN  - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 
--koniec pisma z dnia 04.02.2013

-- pismo z GUS z dnia 21.03.2013 firma RUETGERS
    update [stat].dgt_eksport_sad
       set ek_zp = 'P',
           ek_pcn = '27040090'
		from dgt_eksport_sad
		where ek_pcnp in ('27081000') and ek_RokMc between 201301 and 201312

    select @v_komunikat = 'dgp_upoufnienie_v2 - SAD W PCN  - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID 
-- koniec pisma z dnia 21.03.2013 firma RUETGERS
  end

  
  
  
  exec stat.DziennikWpisInfo 'stop: dgp_upoufnienie'