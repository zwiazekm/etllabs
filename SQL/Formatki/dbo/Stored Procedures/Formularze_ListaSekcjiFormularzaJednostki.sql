-- ==========================================================================================
-- Author:		Kamil Nowiński
-- Create date: 2014-07
-- Description:	Procedura odpowiadająca za wyliczenie widoczności i uprawnień dla poszczególnych 
--				sekcji danego formularza i wybranego użytkownika.
--				Procedura krzyżuje kilka obszarów konfiguracyjnych:
--				- wybiera jednostki podległe jednostkom wskaznego użytkownika (@LoginUzytkownika)
--				- nakłada uprawnienia użytkownika (FormatkaUprawnienia, UzytkownikWRoli) 
--				- do sekcji wybranej formatki (@KodFormularza)
--				- z sekcjami widocznymi (SekcjeDlaKomorek) dla wybranej jednostki (@KodJednostki)
-- Version:		2.0 (2014-08-12)
-- ==========================================================================================
CREATE PROCEDURE [dbo].[Formularze_ListaSekcjiFormularzaJednostki]
(
	@KodFormularza			varchar(5),
	@LoginUzytkownika		nvarchar(250),
	@KodJednostki			varchar(50)
)
AS
BEGIN

	DECLARE @Dzis DATE = GETDATE();
	DECLARE @JednostkaId INT = 0;
	DECLARE @UzytkownikId INT = (SELECT UzytkownikId FROM dbo.Uzytkownik WHERE [Login] = @LoginUzytkownika);

	SELECT @JednostkaId = JednostkaId FROM dbo.StrukturaOrganizacyjna 
	WHERE KodUrzedu = @KodJednostki
	AND @Dzis BETWEEN isnull(valid_from, '18000101') and isnull(valid_to, '21000101');

	WITH JU AS	--Jednostki Uzytkownika
	(
		SELECT UJ.JednostkaOrgId
		FROM UzytkownikJednostka as UJ 
		WHERE UJ.UzytkownikId = @UzytkownikId
	)
	, SoTree (KodUrzedu, JednostkaId)
	AS
	(
			SELECT so.KodUrzedu, so.JednostkaId
			FROM dbo.StrukturaOrganizacyjna AS so
			INNER JOIN JU ON JU.JednostkaOrgId = so.JednostkaId
		UNION ALL
			SELECT so.KodUrzedu, so.JednostkaId
			FROM dbo.StrukturaOrganizacyjna AS so
			INNER JOIN SoTree AS n ON so.KodUrzeduNadrzedny = n.KodUrzedu
	)
	, WszystkieJednostkiUzytkownika as (
		SELECT so.JednostkaId, so.KodUrzedu
		FROM SoTree
		INNER JOIN dbo.StrukturaOrganizacyjna AS so ON so.JednostkaId = SoTree.JednostkaId
	)
	, SekcjeWidoczne as (
		SELECT DISTINCT SekcjaId FROM dbo.SekcjeDlaKomorek as SK
		INNER JOIN WszystkieJednostkiUzytkownika as WJU ON WJU.JednostkaId = SK.JednostkaOrgId
		WHERE SK.JednostkaOrgId = @JednostkaId
	)

	SELECT
		FS.LP,
		FS.Nazwa,
		FS.SekcjaId,
		FS.SekcjaKod,
		FU.Uprawnienia,
		U.Imie,
		U.Nazwisko
	FROM	
		dbo.FormatkaSekcje as FS
			INNER JOIN dbo.FormatkaUprawnienia as FU ON FS.SekcjaId = FU.SekcjaId
			INNER JOIN dbo.UzytkownikWRoli as UR ON FU.RolaUzytkownikaId = UR.RolaUzytkownikaId
			INNER JOIN dbo.Uzytkownik as U ON U.UzytkownikId = UR.UzytkownikId 
			INNER JOIN SekcjeWidoczne as W ON W.SekcjaId = FU.SekcjaId
	WHERE
		UR.UzytkownikId = @UzytkownikId
		AND FS.FormatkaKod = @KodFormularza
END