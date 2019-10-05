CREATE PROCEDURE gust.import_danych_zrodlowych
AS 

declare @v_komunikat varchar(100)
--

exec stat.DziennikWpisInfo 'start:ladowanie_danych_zrodlowych_do_tbl_dane_zrodlowe'

--

DECLARE @v_polecenie nvarchar (4000)

--

	UPDATE gust.tbl_dane_zrodlowe
       	SET [ExtractDate] = GETDATE() ,
          	 flaga = 'A'
	WHERE [ExtractDate] IS NULL AND 
		Flaga IS NULL

--wstawianie informacji do tbl_info
	Select @v_komunikat = 'zaimportowano do tbl_dane_zrodlowe: ' +  convert (varchar(100), @@ROWCOUNT) + ' wiersze/y'
     	 exec stat.DziennikWpisInfo @v_komunikat

--
exec stat.DziennikWpisInfo 'stop:ladowanie_danych_zrodlowych'