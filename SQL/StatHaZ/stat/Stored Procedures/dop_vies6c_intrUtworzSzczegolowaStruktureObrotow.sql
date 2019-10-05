-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 11.06.2014
-- Opis:            Tworzy szczegółową strukturę handlu dla podmiotó spełniających kryterium obrotów
-- =============================================
CREATE PROCEDURE [stat].[dop_vies6c_intrUtworzSzczegolowaStruktureObrotow]
	@p_rok int,
	@p_miesiac int,
	@p_typ char(1)
AS
begin
    if @p_typ = 'P'
	  begin
	    exec stat.DziennikWpisInfo 'Insert do stat.dot_struktura_ponizej_asymilacji dla typu P';
	    insert into stat.dot_struktura_ponizej_asymilacji
			select @p_typ typ,
				   nlp.RokMc,
				   nlp.kodTowarowy,
				   nlp.kodKraju,
				   nlp.krajPochodzenia,
				   nlp.rodzajTransakcji,
				   SUM(nlp.nabyciaBezposr)/odk.obrotyDlaKraju udzialPozycjiWObrotach
			  from [stat].[dot_viesNabyciaListaPodmWgMSOKP] nlp,
				   (select sdp.RokMc,
						   sdp.kodKraju,
						   MAX(sdp.sumaDlaPodmiotow) obrotyDlaKraju
					  from [stat].[dot_viesNabyciaListaPodmWgMSOKP] sdp
					 group by sdp.RokMc, sdp.kodKraju) odk
			 where nlp.RokMc = odk.RokMc
			   and nlp.kodKraju = odk.kodKraju
			   and nlp.RokMc % 100 = @p_miesiac --uwaga: można łatwo wywołać dla wszystkich miesięcy
			 group by nlp.RokMc, nlp.kodKraju, odk.obrotyDlaKraju, nlp.kodTowarowy, nlp.kodKraju, nlp.krajPochodzenia, nlp.rodzajTransakcji;
 	  end;
	else
	  begin
	        exec stat.DziennikWpisInfo 'Insert do stat.dot_struktura_ponizej_asymilacji dla typu W';
	  	    insert into stat.dot_struktura_ponizej_asymilacji
			select @p_typ typ,
				   dlp.RokMc,
				   dlp.kodTowarowy,
				   dlp.kodKraju,
				   dlp.krajPochodzenia,
				   dlp.rodzajTransakcji,
				   SUM(dlp.dostawyBezposr) / odk.obrotyDlaKraju udzialPozycjiWObrotach
			  from [stat].[dot_viesDostawyListaPodmWgMSOKP] dlp,
				   (select sdp.RokMc,
						   sdp.kodKraju,
						   MAX(sdp.sumaDlaPodmiotow) obrotyDlaKraju
					  from [stat].[dot_viesDostawyListaPodmWgMSOKP] sdp
					 group by sdp.[RokMc], sdp.kodKraju) odk
			 where dlp.RokMc = odk.RokMc
			   and dlp.kodKraju = odk.kodKraju
			   and dlp.RokMc % 100 = @p_miesiac --uwaga: można łatwo wywołać dla wszystkich miesięcy
			 group by dlp.RokMc, dlp.kodKraju, odk.obrotyDlaKraju, dlp.kodTowarowy, dlp.kodKraju, dlp.krajPochodzenia, dlp.rodzajTransakcji;
	  end;
end;