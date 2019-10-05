CREATE        procedure [gust].uzupelnienie_pol_dodatkowych
AS
--
declare @v_komunikat  varchar (1000)
--

exec stat.DziennikWpisInfo 'start:uzupelnianie_danych'


------------TYP
update gust.tbl_wynikowe
set Typ='P'
Where kraj_przeznaczenia is NULL
and Typ IS NULL

--wstawienie informacji do tbl_info
	select @v_komunikat = 'zaliczono_do_importu: ' + convert (varchar(100), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat
--

update gust.tbl_wynikowe
set Typ='W'
Where kraj_przeznaczenia is not NULL
and Typ IS NULL

--wstawienie informacji do tbl_info
	select @v_komunikat = 'zaliczono_do_eksportu: ' + convert (varchar(100), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat

---------Export Import Wywóz

update gust.tbl_wynikowe
set Przeplyw ='Intrastat'
Where Typ='W' AND kraj_przeznaczenia IN( 'AT','BE','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HU','IE',
					'IT','LT','LU','LV','MT','NL','PL','PT','SE','SI','SK','QR','QY','QV','BG','RO')

update gust.tbl_wynikowe
set Przeplyw ='Sad'
Where Typ='W' AND kraj_przeznaczenia NOT IN( 'AT','BE','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HU','IE',
					'IT','LT','LU','LV','MT','NL','PL','PT','SE','SI','SK','QR','QY','QV' )
-----------Export Import Przywóz
update gust.tbl_wynikowe
set Przeplyw ='Intrastat'
Where Typ='P' AND kraj_wysylki IN( 'AT','BE','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HU','IE',
					'IT','LT','LU','LV','MT','NL','PL','PT','SE','SI','SK','QR','QY','QV''BG','RO')

update gust.tbl_wynikowe
set Przeplyw ='Sad'
Where Typ='P' AND kraj_wysylki NOT IN( 'AT','BE','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HU','IE',
					'IT','LT','LU','LV','MT','NL','PL','PT','SE','SI','SK','QR','QY','QV' )


-----------Ustawienie znacznika kategorii progowej
update gust.tbl_wynikowe
set zn_kategorii_progowej = '1'
Where Przeplyw= 'Intrastat'


update gust.tbl_wynikowe
set zn_kategorii_progowej = '0'
Where Przeplyw= 'Sad'





--Zmiana statusu z 'A' na 'B' dla rekordów już pobranych
Update gust.kopia_tbl_dane_zrodlowe
Set flaga='B'
Where ID_numer IN (Select ID_numer From gust.tbl_wynikowe)

	

--Ryby ustawienie transport morski (1)

 Update  gust.tbl_wynikowe 
  Set Rodzaj_transportu='1'
  Where CN  NOT IN ( '27111100',
		 '27112100','27160000')
		
	 AND Rodzaj_transportu Is Null

--wstawienie informacji do tbl_info
	select @v_komunikat = 'rodzaj_transportu: morski = ' + convert (varchar(100), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat


--GAZ, Energia transport sieciowy 7

 Update  gust.tbl_wynikowe 
  Set Rodzaj_transportu='7'
  Where (CN In 
		-- GAZ 
		( '27111100',
		 '27112100')
		--Energia
	OR CN In ('27160000')) 
		AND Rodzaj_transportu Is Null

--wstawienie informacji do tbl_info
	select @v_komunikat = 'rodzaj_transportu: instalacje_przesylowe = ' + convert (varchar(100), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat

-- Sad eksport procedura 1000

    Update gust.tbl_wynikowe
     Set Procedura = '1000'
     Where Przeplyw = 'Sad' AND Typ = 'W' AND Procedura Is Null

--wstawienie informacji do tbl_info
	select @v_komunikat = 'sad_wywoz: procedura 1000 = ' + convert (varchar(100), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat

-- Sad import procedura 4000

    Update gust.tbl_wynikowe
     Set Procedura = '4000'
     Where Przeplyw = 'Sad' AND Typ = 'P' AND Procedura Is Null

--wstawienie informacji do tbl_info
	select @v_komunikat = 'sad_przywoz: procedura 4000 = ' + convert (varchar(100), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat

-- INTRASTAT  procedura 0000

    Update gust.tbl_wynikowe
     Set Procedura = '0000'
     Where Przeplyw = 'Intrastat'  AND Procedura Is Null


--  rodzaj_transakcji 11

    Update gust.tbl_wynikowe
     Set Rodzaj_transakcji= '11'
     Where Rodzaj_transakcji is null

--  Warunki dostawy FOB

    Update gust.tbl_wynikowe
     Set  warunki_dostawy='FOB'
    Where Typ='W' AND warunki_dostawy is null

--  Warunki dostawy CIF
	Update gust.tbl_wynikowe
     Set  warunki_dostawy='CIF'
     Where Typ='P'  AND warunki_dostawy is null
exec stat.DziennikWpisInfo 'stop:uzupelnianie_danych'
-- Formatowanie danych
exec stat.DziennikWpisInfo 'start:formatowanie_danych' 
         update gust.tbl_wynikowe
	
    set       masa                  = right ('               ' + isnull (masa, '0'), 15),
       	  ilosc                       = right ('               ' + isnull (ilosc, '0'), 15),
       	  wartosc_zl             = right ('               ' + isnull (wartosc_zl, '0'), 15)

exec stat.DziennikWpisInfo 'stop:formatowanie_danych'
--