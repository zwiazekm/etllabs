CREATE  PROCEDURE [stat].dgp_upoufnienie
  @p_rodzaj_danych varchar (10), -- SAD, INTR
  @p_typ           varchar (10) -- P - przywóz, W - wywóz
as
  declare @v_komunikat varchar(100) 
  if not exists (select 1 from stat.dgv_kopia_poufnosc)
  begin
    exec stat.DziennikWpisInfo 'Brak definicji upoufnień' 
    return
  end
  -- import SAD
  select @v_komunikat = 'start: dgp_upoufnienie, rodzaj: ' + @p_rodzaj_danych + ', typ: ' + @p_typ
  exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
  if @p_rodzaj_danych = 'SAD' and @p_typ = 'P'
  begin
    exec stat.DziennikWpisInfo 'dgp_upoufnienie, rodzaj: SAD, typ: P' 
    -- kod PCN
    update [stat].dgt_import_sad
       set im_zp = 'P',
           im_pcn = isnull((select top 1 dgt1.im_pcnp 
                             from dgt_import_sad dgt1
                            where substring(dgt2.im_pcnp ,1,6) = substring(dgt1.im_pcnp,1,6) 
                              and dgt2.im_pcnp <> dgt1.im_pcnp
                              -- sprawdzenie czy dany kod nie jest w upoufnionych
                              and not exists (select 1 
                                                from stat.dgv_kopia_poufnosc p
                                               where p.kod_tow_p = substring(dgt1.im_pcnp,1,8)
												 and dgt1.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                 and ((exists (select 1 
                                                                 from stat.dgv_kopia_v2_sad_odbiorca o, dgv_kopia_v2_kontrahenci k
                                                                where o.idDokNr = dgt1.im_iddoknr
                                                                  and o.idKntr = k.idKntr 
                                                                  and substring(k.TIN,3,10) = p.nip))
                                                       or (exists (select 1 
                                                                     from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                    where kt.[IdDokNr] = dgt1.im_iddoknr
                                                                      and kt.[Typ] = 'ODB' 
                                                                      and substring(kt.TIN,3,10) = p.nip)))) 
                              and dgt1.im_wartosc_stat_zl = (select max(dgt.im_wartosc_stat_zl)
                                                               from dgt_import_sad dgt
                                                              where substring(dgt2.im_pcnp ,1,6) = substring(dgt.im_pcnp,1,6)
                                                                and dgt2.im_pcnp <> dgt.im_pcnp
                                                                -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                and not exists (select 1 
                                                                                  from stat.dgv_kopia_poufnosc p
                                                                                 where p.kod_tow_p = substring(dgt.im_pcnp,1,8)
								    	  									       and dgt.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                                                   and ((exists (select 1 
                                                                                                   from stat.dgv_kopia_v2_sad_odbiorca o, dgv_kopia_v2_kontrahenci k
                                                                                                  where o.idDokNr = dgt2.im_iddoknr
                                                                                                    and o.idKntr = k.idKntr 
                                                                                                    and substring(k.TIN,3,10) = p.nip))
                                                                                         or (exists (select 1 
                                                                                                       from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                                                      where kt.[IdDokNr] = dgt.im_iddoknr
                                                                                                        and kt.[Typ] = 'ODB' 
                                                                                                        and substring(kt.TIN,3,10) = p.nip)))))),
                           (select top 1 dgt1.im_pcnp 
                             from dgt_import_sad dgt1
                            where substring(dgt2.im_pcnp ,1,4) = substring(dgt1.im_pcnp,1,4) 
                              and dgt2.im_pcnp <> dgt1.im_pcnp
                              -- sprawdzenie czy dany kod nie jest w upoufnionych
                              and not exists (select 1 
                                                from stat.dgv_kopia_poufnosc p
                                               where p.kod_tow_p = substring(dgt1.im_pcnp,1,8)
											     and dgt1.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                 and ((exists (select 1 
                                                                 from stat.dgv_kopia_v2_sad_odbiorca o, dgv_kopia_v2_kontrahenci k
                                                                where o.idDokNr = dgt1.im_iddoknr
                                                                  and o.idKntr = k.idKntr 
                                                                  and substring(k.TIN,3,10) = p.nip))
                                                       or (exists (select 1 
                                                                     from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                    where kt.[IdDokNr] = dgt1.im_iddoknr
                                                                      and kt.[Typ] = 'ODB' 
                                                                      and substring(kt.TIN,3,10) = p.nip))))
                              and dgt1.im_wartosc_stat_zl = (select max(dgt.im_wartosc_stat_zl)
                                                               from dgt_import_sad dgt
                                                              where substring(dgt2.im_pcnp ,1,4) = substring(dgt.im_pcnp,1,4)
                                                                and dgt2.im_pcnp <> dgt.im_pcnp
                                                                -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                and not exists (select 1 
                                                                                  from stat.dgv_kopia_poufnosc p
                                                                                 where p.kod_tow_p = substring(dgt.im_pcnp,1,8)
																				 and dgt.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                                                   and ((exists (select 1 
                                                                                                   from stat.dgv_kopia_v2_sad_odbiorca o, dgv_kopia_v2_kontrahenci k
                                                                                                  where o.idDokNr = dgt2.im_iddoknr
                                                                                                    and o.idKntr = k.idKntr 
                                                                                                    and substring(k.TIN,3,10) = p.nip))
                                                                                         or (exists (select 1 
                                                                                                       from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                                                      where kt.[IdDokNr] = dgt.im_iddoknr
                                                                                                        and kt.[Typ] = 'ODB' 
                                                                                                        and substring(kt.TIN,3,10) = p.nip)))))))
           
      from dgt_import_sad dgt2
     where exists (select 1 
                     from stat.dgv_kopia_poufnosc p
                    where p.kod_tow_p = substring(dgt2.im_pcnp,1,8)
					   and dgt2.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                      and ((exists (select 1 
                                      from stat.dgv_kopia_v2_sad_odbiorca o, dgv_kopia_v2_kontrahenci k
                                     where o.idDokNr = dgt2.im_iddoknr
                                       and o.idKntr = k.idKntr 
                                       and substring(k.TIN,3,10) = p.nip))
                            or (exists (select 1 
                                          from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                         where kt.[IdDokNr] = dgt2.im_iddoknr
                                           and kt.[Typ] = 'ODB' 
                                           and substring(kt.TIN,3,10) = p.nip)))) 
    --
    select @v_komunikat = 'dgp_upoufnienie - PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID  
    --                 
    -- kraj pochodzenia
    update [stat].dgt_import_sad
       set im_kraj_pochodzenia = replace(left(isnull(kraj, 'QZ')+'  ',2),'  ','QZ')
      from stat.dgv_kopia_poufnosc p
     where kraj_poch_p =  im_kraj_pochodzenia 
	   and im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
       and ((exists (select 1 
                       from stat.dgv_kopia_v2_sad_odbiorca o, dgv_kopia_v2_kontrahenci k
                      where o.idDokNr = im_iddoknr
                        and o.idKntr = k.idKntr 
                        and substring(k.TIN,3,10) = p.nip))
             or (exists (select 1 
                           from stat.dgv_kopia_v2_tmp_kontrahenci kt
                          where kt.[IdDokNr] = im_iddoknr
                            and kt.[Typ] = 'ODB' 
                            and substring(kt.TIN,3,10) = p.nip))) 
    -- 
    select @v_komunikat = 'dgp_upoufnienie - kraj poch. - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
    -- kraj wysylki
    update [stat].dgt_import_sad
       set im_kraj_wysylki = replace(left(isnull(kraj, 'QZ')+'  ',2),'  ','QZ')
      from stat.dgv_kopia_poufnosc p
     where kraj_wys_p =  im_kraj_wysylki  
	   and im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
       and ((exists (select 1 
                       from stat.dgv_kopia_v2_sad_odbiorca o, dgv_kopia_v2_kontrahenci k
                      where o.idDokNr = im_iddoknr
                        and o.idKntr = k.idKntr 
                        and substring(k.TIN,3,10) = p.nip))
             or (exists (select 1 
                           from stat.dgv_kopia_v2_tmp_kontrahenci kt
                          where kt.[IdDokNr] = im_iddoknr
                            and kt.[Typ] = 'ODB' 
                            and substring(kt.TIN,3,10) = p.nip))) 
     -- 
     select @v_komunikat = 'dgp_upoufnienie - kraj wys. - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
     exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
     --
  end
  -- import Intrastat
  if @p_rodzaj_danych = 'INTR' and @p_typ = 'P'
  begin
    exec stat.DziennikWpisInfo 'dgp_upoufnienie, rodzaj: INTR, typ: P' 
    -- pcn
    update [stat].dgt_import_intr_agr
       set im_zp = 'P',
           im_pcn = isnull((select top 1 dgt1.im_pcnp 
                              from dgt_import_intr_agr dgt1
                             where substring(dgt2.im_pcnp ,1,6) = substring(dgt1.im_pcnp,1,6) 
                               and dgt2.im_pcnp <> dgt1.im_pcnp
                              -- sprawdzenie czy dany kod nie jest w upoufnionych
                               and not exists (select 1 
                                                 from stat.dgv_kopia_poufnosc p
                                                where p.nip = dgt1.im_nip
                                                  and p.kod_tow_p = dgt1.im_pcnp
												   and im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc)
                               and dgt1.im_wartosc_stat_zl = (select max(dgt.im_wartosc_stat_zl)
                                                                from dgt_import_intr_agr dgt
                                                               where substring(dgt2.im_pcnp ,1,6) = substring(dgt.im_pcnp,1,6)
                                                                 and dgt2.im_pcnp <> dgt.im_pcnp
                                                                 -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                 and not exists (select 1 
                                                                                   from stat.dgv_kopia_poufnosc p
                                                                                  where p.nip = dgt.im_nip
                                                                                    and p.kod_tow_p = dgt.im_pcnp
                                                                                  	   and im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc ))),
                           (select top 1 dgt1.im_pcnp 
                              from dgt_import_intr_agr dgt1
                             where substring(dgt2.im_pcnp ,1,4) = substring(dgt1.im_pcnp,1,4) 
                               and dgt2.im_pcnp <> dgt1.im_pcnp
                               -- sprawdzenie czy dany kod nie jest w upoufnionych
                               and not exists (select 1 
                                                 from stat.dgv_kopia_poufnosc p
                                                where p.nip = dgt1.im_nip
                                                  and p.kod_tow_p = dgt1.im_pcnp
                                                  and dgt1.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc)
                               and dgt1.im_wartosc_stat_zl = (select max(dgt.im_wartosc_stat_zl)
                                                                from dgt_import_intr_agr dgt
                                                               where substring(dgt2.im_pcnp ,1,4) = substring(dgt.im_pcnp,1,4)
                                                                 and dgt2.im_pcnp <> dgt.im_pcnp
                                                                 -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                 and not exists (select 1 
                                                                                   from stat.dgv_kopia_poufnosc p
                                                                                  where p.nip = dgt.im_nip
                                                                                    and p.kod_tow_p = dgt.im_pcnp
                                                                                    and dgt.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc))))
       from dgt_import_intr_agr dgt2
      where exists (select 1 
                      from stat.dgv_kopia_poufnosc p
                     where p.nip = dgt2.im_nip
                       and p.kod_tow_p = dgt2.im_pcnp
                       and dgt2.im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc)
    -- 
    select @v_komunikat = 'dgp_upoufnienie - PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
    -- kraj pochodzenia
    update [stat].dgt_import_intr_agr
       set im_kraj_pochodzenia = replace(left(isnull(kraj, 'QY')+'  ',2),'  ','QY')
      from stat.dgv_kopia_poufnosc p
     where nip = im_nip
       and kraj_poch_p =  im_kraj_pochodzenia 
	   and im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
    -- 
    select @v_komunikat = 'dgp_upoufnienie - kraj poch. - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
    -- kraj wysylki
    update [stat].dgt_import_intr_agr
       set im_kraj_wysylki = replace(left(isnull(kraj, 'QY')+'  ',2),'  ','QY')
      from stat.dgv_kopia_poufnosc p
     where nip = im_nip
       and kraj_wys_p = im_kraj_wysylki  
	   and im_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
    --     
    select @v_komunikat = 'dgp_upoufnienie - kraj wys. - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
  end
  -- eksport SAD
  if @p_rodzaj_danych = 'SAD' and @p_typ = 'W'
  begin
  exec stat.DziennikWpisInfo 'dgp_upoufnienie, rodzaj: SAD, typ: W'  
    -- kod PCN
    update [stat].dgt_eksport_sad
       set ek_zp = 'P',
           ek_pcn = isnull((select top 1 dgt1.ek_pcnp 
                              from dgt_eksport_sad dgt1
                             where substring(dgt2.ek_pcnp ,1,6) = substring(dgt1.ek_pcnp,1,6) 
                               and dgt2.ek_pcnp <> dgt1.ek_pcnp
                               -- sprawdzenie czy dany kod nie jest w upoufnionych
                               and not exists (select 1 
                                                 from stat.dgv_kopia_poufnosc p
                                                where p.kod_tow_p = dgt1.ek_pcnp
												  and dgt1.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                  and ((exists (select 1 
                                                                  from stat.dgv_kopia_v2_sad_nadawca o, dgv_kopia_v2_kontrahenci k
                                                                 where o.idDokNr = dgt1.ek_iddoknr
                                                                   and o.idKntr = k.idKntr 
                                                                   and substring(k.TIN,3,10) = p.nip))
                                                        or (exists (select 1 
                                                                      from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                     where kt.[IdDokNr] = dgt1.ek_iddoknr
                                                                       and kt.[Typ] = 'NAD' 
                                                                       and substring(kt.TIN,3,10) = p.nip))))
                               and dgt1.ek_wartosc_stat_zl = (select max(dgt.ek_wartosc_stat_zl)
                                                                from dgt_eksport_sad dgt
                                                               where substring(dgt2.ek_pcnp ,1,6) = substring(dgt.ek_pcnp,1,6)
                                                                 and dgt2.ek_pcnp <> dgt.ek_pcnp
                                                                 -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                 and not exists (select 1 
                                                                                  from stat.dgv_kopia_poufnosc p
                                                                                 where p.kod_tow_p = dgt.ek_pcnp
																				   and dgt.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                                                   and ((exists (select 1 
                                                                                                   from stat.dgv_kopia_v2_sad_nadawca o, dgv_kopia_v2_kontrahenci k
                                                                                                  where o.idDokNr = dgt.ek_iddoknr
                                                                                                    and o.idKntr = k.idKntr 
                                                                                                    and substring(k.TIN,3,10) = p.nip))
                                                                                         or (exists (select 1 
                                                                                                       from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                                                      where kt.[IdDokNr] = dgt.ek_iddoknr
                                                                                                        and kt.[Typ] = 'NAD' 
                                                                                                        and substring(kt.TIN,3,10) = p.nip)))))),
                            (select top 1 dgt1.ek_pcnp 
                              from dgt_eksport_sad dgt1
                             where substring(dgt2.ek_pcnp ,1,4) = substring(dgt1.ek_pcnp,1,4) 
                               and dgt2.ek_pcnp <> dgt1.ek_pcnp
                              -- sprawdzenie czy dany kod nie jest w upoufnionych
                               and not exists (select 1 
                                                 from stat.dgv_kopia_poufnosc p
                                                where p.kod_tow_p = dgt1.ek_pcnp
												  and dgt1.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                  and ((exists (select 1 
                                                                  from stat.dgv_kopia_v2_sad_nadawca o, dgv_kopia_v2_kontrahenci k
                                                                 where o.idDokNr = dgt1.ek_iddoknr
                                                                   and o.idKntr = k.idKntr 
                                                                   and substring(k.TIN,3,10) = p.nip))
                                                        or (exists (select 1 
                                                                      from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                     where kt.[IdDokNr] = dgt1.ek_iddoknr
                                                                       and kt.[Typ] = 'NAD' 
                                                                       and substring(kt.TIN,3,10) = p.nip))))
                               and dgt1.ek_wartosc_stat_zl = (select max(dgt.ek_wartosc_stat_zl)
                                                                from dgt_eksport_sad dgt
                                                               where substring(dgt2.ek_pcnp ,1,4) = substring(dgt.ek_pcnp,1,4)
                                                                 and dgt2.ek_pcnp <> dgt.ek_pcnp
                                                                 -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                 and not exists (select 1 
                                                                                  from stat.dgv_kopia_poufnosc p
                                                                                 where p.kod_tow_p = dgt.ek_pcnp
																				   and dgt.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                                                                                   and ((exists (select 1 
                                                                                                   from stat.dgv_kopia_v2_sad_nadawca o, dgv_kopia_v2_kontrahenci k
                                                                                                  where o.idDokNr = dgt.ek_iddoknr
                                                                                                    and o.idKntr = k.idKntr 
                                                                                                    and substring(k.TIN,3,10) = p.nip))
                                                                                         or (exists (select 1 
                                                                                                       from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                                                                                      where kt.[IdDokNr] = dgt.ek_iddoknr
                                                                                                        and kt.[Typ] = 'NAD' 
                                                                                                        and substring(kt.TIN,3,10) = p.nip)))))))
      from dgt_eksport_sad dgt2
     where exists (select 1 
                     from stat.dgv_kopia_poufnosc p
                    where p.kod_tow_p = dgt2.ek_pcnp
					  and dgt2.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                      and ((exists (select 1 
                                      from stat.dgv_kopia_v2_sad_nadawca o, dgv_kopia_v2_kontrahenci k
                                     where o.idDokNr = dgt2.ek_iddoknr
                                       and o.idKntr = k.idKntr 
                                       and substring(k.TIN,3,10) = p.nip))
                            or (exists (select 1 
                                          from stat.dgv_kopia_v2_tmp_kontrahenci kt
                                         where kt.[IdDokNr] = dgt2.ek_iddoknr
                                           and kt.[Typ] = 'NAD' 
                                           and substring(kt.TIN,3,10) = p.nip))))
    --
    select @v_komunikat = 'dgp_upoufnienie - PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
    -- kraj przeznaczenia
    update [stat].dgt_eksport_sad
       set ek_kraj_przeznaczenia = replace(left(isnull(kraj, 'QZ')+'  ',2),'  ','QZ')
      from stat.dgv_kopia_poufnosc p
     where kraj_przez_p = ek_kraj_przeznaczenia
	   and ek_RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
       and ((exists (select 1 
                       from stat.dgv_kopia_v2_sad_nadawca o, dgv_kopia_v2_kontrahenci k
                      where o.idDokNr = ek_iddoknr
                        and o.idKntr = k.idKntr 
                        and substring(k.TIN,3,10) = p.nip))
             or (exists (select 1 
                           from stat.dgv_kopia_v2_tmp_kontrahenci kt
                          where kt.[IdDokNr] = ek_iddoknr
                            and kt.[Typ] = 'NAD' 
                            and substring(kt.TIN,3,10) = p.nip))) 
    --
    select @v_komunikat = 'dgp_upoufnienie - kraj przez. - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
  end
  -- eksport Intrastat
  if @p_rodzaj_danych = 'INTR' and @p_typ = 'W'
  begin
  exec stat.DziennikWpisInfo 'dgp_upoufnienie, rodzaj: INTR, typ: W' 
    -- kod PCN
    update [stat].dgt_eksport_intr_agr
       set ek_zp = 'P',
           ek_pcn = isnull((select top 1 dgt1.ek_pcnp 
                              from stat.dgt_eksport_intr_agr dgt1
                             where substring(dgt2.ek_pcnp ,1,6) = substring(dgt1.ek_pcnp,1,6) 
                               and dgt2.ek_pcnp <> dgt1.ek_pcnp
                               -- sprawdzenie czy dany kod nie jest w upoufnionych
                               and not exists (select 1 
                                                 from stat.dgv_kopia_poufnosc p
                                                where p.nip = dgt1.ek_nip 
                                                  and p.kod_tow_p = dgt1.ek_pcnp
                                                  and dgt1.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc)
                               and dgt1.ek_wartosc_stat_zl = (select max(dgt.ek_wartosc_stat_zl)
                                                                from stat.dgt_eksport_intr_agr dgt
                                                               where substring(dgt2.ek_pcnp ,1,6) = substring(dgt.ek_pcnp,1,6)
                                                                 and dgt2.ek_pcnp <> dgt.ek_pcnp
                                                                 -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                 and not exists (select 1 
                                                                                   from stat.dgv_kopia_poufnosc p
                                                                                  where p.nip = dgt.ek_nip 
                                                                                    and p.kod_tow_p = dgt.ek_pcnp
                                                                                    and dgt.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
																					))),
                           (select top 1 dgt1.ek_pcnp 
                              from stat.dgt_eksport_intr_agr dgt1
                             where substring(dgt2.ek_pcnp ,1,4) = substring(dgt1.ek_pcnp,1,4) 
                               and dgt2.ek_pcnp <> dgt1.ek_pcnp
                               -- sprawdzenie czy dany kod nie jest w upoufnionych
                               and not exists (select 1 
                                                 from stat.dgv_kopia_poufnosc p
                                                where p.nip = dgt1.ek_nip 
                                                  and p.kod_tow_p = dgt1.ek_pcnp
                                                  and dgt1.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc)
                               and dgt1.ek_wartosc_stat_zl = (select max(dgt.ek_wartosc_stat_zl)
                                                                from stat.dgt_eksport_intr_agr dgt
                                                               where substring(dgt2.ek_pcnp ,1,4) = substring(dgt.ek_pcnp,1,4)
                                                                 and dgt2.ek_pcnp <> dgt.ek_pcnp
                                                                 -- sprawdzenie czy dany kod nie jest w upoufnionych
                                                                 and not exists (select 1 
                                                                                   from stat.dgv_kopia_poufnosc p
                                                                                  where p.nip = dgt.ek_nip 
                                                                                    and p.kod_tow_p = dgt.ek_pcnp
                                                                                    and dgt.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc))))
      from stat.dgt_eksport_intr_agr dgt2
     where exists (select 1 
                     from stat.dgv_kopia_poufnosc p
                    where p.nip = dgt2.ek_nip 
                      and p.kod_tow_p = dgt2.ek_pcnp
                      and dgt2.ek_RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc)
  
    --
    select @v_komunikat = 'dgp_upoufnienie - kraj PCN - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
    -- kraj przeznaczenia
      update [stat].dgt_eksport_intr_agr
         set ek_kraj_przeznaczenia = replace(left(isnull(kraj, 'QY')+'  ',2),'  ','QY')
        from stat.dgv_kopia_poufnosc p
       where nip = ek_nip
         and kraj_przez_p = ek_kraj_przeznaczenia
		 and ek_RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
    --
    select @v_komunikat = 'dgp_upoufnienie - kraj przez. - zmodyfikowano: ' + convert(varchar(100),@@ROWCOUNT) + ' wierszy'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    --
  end
  
  exec stat.DziennikWpisInfo 'stop: dgp_upoufnienie'