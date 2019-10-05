CREATE PROCEDURE [stat].dop_struktura_roczna
  @p_rok smallint,
  @p_przygotuj_dane char(1) = 'T'
as
  declare @v_info varchar (1000)
  declare @id bigint;
  set @v_info = 'start: @p_rok=' + convert (varchar, @p_rok) + ', @p_przygotuj_dane=' + @p_przygotuj_dane;
  exec @id = [stat].DziennikWpisInfo @v_info, @@PROCID;
  --
  -- Zabezpieczenie dla roku < 2005
  --
  if @p_rok < 2005 
  begin
    exec [stat].DziennikWpisInfo 'stop: dop_struktura_roczna - błędny rok', @@PROCID;
    return
  end
  --
  -- Usunięcie poprzednich danych
  --
  delete stat.dot_struktura_priorytet_5_roczna where rok = @p_rok
  -- 
  if @p_rok <> 2006
    begin
    --
	TRUNCATE TABLE tmp.ek_sum_dekl_nip;
	INSERT INTO tmp.ek_sum_dekl_nip (ek_nip, ek_Rok, ek_wartosc)
    select ek_nip,
           ek_RokMc / 100 as ek_rok,
           sum(ek_wartosc_stat_zl) ek_wartosc
      from stat.dgt_eksport_intr
     where ek_znacznik_kategorii_progowej = 1 
     group by ek_nip, ek_RokMc / 100;
      
	TRUNCATE TABLE tmp.im_sum_dekl_nip;
	INSERT INTO tmp.im_sum_dekl_nip (im_nip, im_Rok, im_wartosc)
      select im_nip,
             im_RokMc / 100 as im_rok,
             sum(im_wartosc_stat_zl) im_wartosc
        from stat.dgt_import_intr
       where im_znacznik_kategorii_progowej = 1
       group by im_nip, im_RokMc / 100
  --
  exec [stat].DziennikWpisInfo '- eksport', @@PROCID;
  --
  --
  -- wstawienie eksportu do dot_struktura_priorytet_5_roczna
  --
  insert into stat.dot_struktura_priorytet_5_roczna
     (nr_poz, 
      nip, 
      regon, 
      typ, 
      rok, 
      kod_towarowy, 
      kraj_przezn_wysyl, 
      kraj_pochodzenia, 
      rodzaj_transakcji,
      udzial_w_obrotach)
     (select   null                                                                          		               nr_poz,
               ek.ek_nip                                                                     		               nip,
               pod.regon                                                                     		               regon,
               'W'                                                                           		               typ,
               n.ek_Rok                                                                      		               rok,
               ek_pcn                                                                        		               kod_towarowy,
               ek_kraj_przeznaczenia                                         		              	               kraj_przezn_wysyl,
               null                                                              		                           kraj_pochodzenia,
               ek_rodzaj_transakcji                                              		                           rodzaj_transakcji,
               convert(numeric(10,6),
                      floor((sum(ek_wartosc_stat_zl)/max(ek_wartosc))*1000000)/1000000.000000)					udzial_w_obrotach
          from dgt_eksport_intr ek, 
               tmp.ek_sum_dekl_nip n, 
               dgv_kopia_intr_dane_pod  pod
         where ek_znacznik_kategorii_progowej = 1
           and n.ek_Rok = @p_rok
           and ek.ek_nip = pod.nip
           and ek.ek_nip = n.ek_nip
		   and ek.ek_RokMc between n.ek_Rok*100+1 and n.ek_Rok*100+12
           and n.ek_wartosc > 0 
         group by ek.ek_nip,
               pod.regon,
               n.ek_Rok,
               ek_pcn,
               ek_kraj_przeznaczenia,
               ek_rodzaj_transakcji
        having convert(numeric(10,6),
                        floor( ( sum(ek_wartosc_stat_zl) / max(ek_wartosc) )*1000000)/1000000.000000) >= 0.0001)                      
  --
  exec [stat].DziennikWpisInfo '- import', @@PROCID, 1;
  --
  -- wstawienie importu do dot_struktura_priorytet_5_roczna
  --
  insert into stat.dot_struktura_priorytet_5_roczna
     (nr_poz, 
      nip, 
      regon, 
      typ, 
      rok, 
      kod_towarowy, 
      kraj_przezn_wysyl, 
      kraj_pochodzenia, 
      rodzaj_transakcji,
      udzial_w_obrotach)
     (select   null                                                             		                  		     nr_poz,
               im.im_nip                                                         		       		       		       nip,
               pod.regon                                                         		       		       		       regon,
               'P'                                                               		       		       		       typ,
               n.im_Rok                                                          		       		       		       rok,
               im_pcn                                                            		       		       		       kod_towarowy,
               im_kraj_wysylki                                                   		                 		       kraj_przezn_wysyl,
               im_kraj_pochodzenia                                               		       		                 kraj_pochodzenia,
               im_rodzaj_transakcji                                              		       		                 rodzaj_transakcji,
               convert(numeric(10,6),
                      floor((sum(im_wartosc_stat_zl)/max(im_wartosc))*1000000)/1000000.000000)  udzial_w_obrotach                     
          from dgt_import_intr im, 
               tmp.im_sum_dekl_nip n, 
               dgv_kopia_intr_dane_pod  pod
         where im_znacznik_kategorii_progowej = 1
           and n.im_Rok = @p_rok
           and im.im_nip = pod.nip
           and im.im_nip = n.im_nip
		   and im.im_RokMc between n.im_Rok*100+1 and n.im_Rok*100+12
           and n.im_wartosc > 0 
         group by im.im_nip,
               pod.regon,
               n.im_Rok,
               im_pcn,
               im_kraj_wysylki,
               im_kraj_pochodzenia,
               im_rodzaj_transakcji
        having convert(numeric(10,6),
                       floor((sum(im_wartosc_stat_zl)/max(im_wartosc))*1000000)/1000000.000000) >= 0.0001)
--
      --TRUNCATE TABLE tmp.ek_sum_dekl_nip;
      --TRUNCATE TABLE tmp.im_sum_dekl_nip;
  end

  exec [stat].DziennikWpisInfo 'stop', @@PROCID, 1;
  exec [stat].DziennikCzas @id;