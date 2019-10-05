CREATE PROCEDURE [etl].[gus005_UdzialDoszacowanImport]
AS
	SELECT     Kod_cn, 
	CONVERT(bigint, Wartosc_rzeczywista) AS Wartosc_rzeczywista, 
	CONVERT(bigint, Wartosc_doszacowana) AS Wartosc_doszacowana, 
	replace(convert(decimal(5,2),(Wartosc_doszacowana / (Wartosc_rzeczywista + Wartosc_doszacowana)) * 100),'.',',') AS [udzial_doszacowan w %], 
	ISNULL(REGON, '1111111111') AS REGON, 
	ISNULL(nip, '1111111111') AS nip, 
	convert(bigint,[Wartosc_doszacowan podmiotu]) as [wartosc_doszacowan podmiotu], 
	replace(convert(decimal(5,2),([wartosc_doszacowan podmiotu] / Wartosc_doszacowana) * 100),'.',',') AS [udzial podmiotu w doszacowaniach w %], 
	replace(convert(decimal(5,2),([wartosc_doszacowan podmiotu] / (Wartosc_rzeczywista + Wartosc_doszacowana)) * 100),'.',',') AS [udzial podmiotu w ogóle wartości w %]
	FROM stat.udzial_doszacowan_im
RETURN 0