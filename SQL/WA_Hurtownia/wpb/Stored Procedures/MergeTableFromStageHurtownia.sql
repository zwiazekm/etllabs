-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-28
-- Description:	Merge z [$(WA_StageHurtownia)] do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [wpb].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'RB27_Dokument' BEGIN
		MERGE INTO wpb.RB27_Dokument AS tgt
		USING [WA_StageHurtownia].wpb.RB27_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.JednostkaSprawozdawcza=src.JednostkaSprawozdawcza, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.Status=src.Status, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataWykonania=src.DataWykonania, tgt.DataDo=src.DataDo, tgt.OkresOd=src.OkresOd, tgt.OkresDo=src.OkresDo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDokumentu, NumerDokumentu, JednostkaSprawozdawcza, DataRejestrDokWSyst, Status, DataZamkniecia, DataWykonania, DataDo, OkresOd, OkresDo)
		VALUES (src.IdDok, src.RodzajDokumentu, src.NumerDokumentu, src.JednostkaSprawozdawcza, src.DataRejestrDokWSyst, src.Status, src.DataZamkniecia, src.DataWykonania, src.DataDo, src.OkresOd, src.OkresDo);
		SET @Merged = 1; 
	END
	
	IF @TableName = 'RB27_Pozycje' BEGIN
		MERGE INTO wpb.RB27_Pozycje AS tgt
		USING [WA_StageHurtownia].wpb.RB27_Pozycje AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.[Plan]=src.[Plan], tgt.Naleznosci=src.Naleznosci, tgt.Potracenia=src.Potracenia, tgt.DochodyWykonane=src.DochodyWykonane, tgt.DochodyPrzekazane=src.DochodyPrzekazane, tgt.SaldoKoncoweOgolem=src.SaldoKoncoweOgolem, tgt.SaldoKoncoweZaleglosci=src.SaldoKoncoweZaleglosci, tgt.SaldoKoncoweNadplaty=src.SaldoKoncoweNadplaty
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, Dzial, Rozdzial, Paragraf, [Plan], Naleznosci, Potracenia, DochodyWykonane, DochodyPrzekazane, SaldoKoncoweOgolem, SaldoKoncoweZaleglosci, SaldoKoncoweNadplaty)
		VALUES (src.IdDok, src.NumerPozycji, src.Dzial, src.Rozdzial, src.Paragraf, src.[Plan], src.Naleznosci, src.Potracenia, src.DochodyWykonane, src.DochodyPrzekazane, src.SaldoKoncoweOgolem, src.SaldoKoncoweZaleglosci, src.SaldoKoncoweNadplaty);
		SET @Merged = 1; 
	END
	
	IF @TableName = 'RB28_Dokument' BEGIN
		MERGE INTO wpb.RB28_Dokument AS tgt
		USING [WA_StageHurtownia].wpb.RB28_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.JednostkaSprawozdawcza=src.JednostkaSprawozdawcza, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.Status=src.Status, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataWykonania=src.DataWykonania, tgt.DataDo=src.DataDo, tgt.OkresOd=src.OkresOd, tgt.OkresDo=src.OkresDo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDokumentu, NumerDokumentu, JednostkaSprawozdawcza, DataRejestrDokWSyst, Status, DataZamkniecia, DataWykonania, DataDo, OkresOd, OkresDo)
		VALUES (src.IdDok, src.RodzajDokumentu, src.NumerDokumentu, src.JednostkaSprawozdawcza, src.DataRejestrDokWSyst, src.Status, src.DataZamkniecia, src.DataWykonania, src.DataDo, src.OkresOd, src.OkresDo);
		SET @Merged = 1;
	END

	IF @TableName = 'RB28_Pozycje' BEGIN
		MERGE INTO wpb.RB28_Pozycje AS tgt
		USING [WA_StageHurtownia].wpb.RB28_Pozycje AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.PlanPoZmianach=src.PlanPoZmianach, tgt.Zaangazowanie=src.Zaangazowanie, tgt.WykonanieWydatkow=src.WykonanieWydatkow, tgt.OgolemZobowiazania=src.OgolemZobowiazania, tgt.ZobowLatUbieglych=src.ZobowLatUbieglych, tgt.ZobowBiezacegoRoku=src.ZobowBiezacegoRoku, tgt.WydatkiNiewygasle=src.WydatkiNiewygasle
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, Dzial, Rozdzial, Paragraf, PlanPoZmianach, Zaangazowanie, WykonanieWydatkow, OgolemZobowiazania, ZobowLatUbieglych, ZobowBiezacegoRoku, WydatkiNiewygasle)
		VALUES (src.IdDok, src.NumerPozycji, src.Dzial, src.Rozdzial, src.Paragraf, src.PlanPoZmianach, src.Zaangazowanie, src.WykonanieWydatkow, src.OgolemZobowiazania, src.ZobowLatUbieglych, src.ZobowBiezacegoRoku, src.WydatkiNiewygasle);
		SET @Merged = 1;
	END

	IF @TableName = 'RB28PR_Dokument' BEGIN
		MERGE INTO wpb.RB28PR_Dokument AS tgt
		USING [WA_StageHurtownia].wpb.RB28PR_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.JednostkaSprawozdawcza=src.JednostkaSprawozdawcza, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.Status=src.Status, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataWykonania=src.DataWykonania, tgt.DataDo=src.DataDo, tgt.OkresOd=src.OkresOd, tgt.OkresDo=src.OkresDo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDokumentu, NumerDokumentu, JednostkaSprawozdawcza, DataRejestrDokWSyst, Status, DataZamkniecia, DataWykonania, DataDo, OkresOd, OkresDo)
		VALUES (src.IdDok, src.RodzajDokumentu, src.NumerDokumentu, src.JednostkaSprawozdawcza, src.DataRejestrDokWSyst, src.Status, src.DataZamkniecia, src.DataWykonania, src.DataDo, src.OkresOd, src.OkresDo);
		SET @Merged = 1;
	END
	
	IF @TableName = 'RB28PR_Pozycje' BEGIN
		MERGE INTO wpb.RB28PR_Pozycje AS tgt
		USING [WA_StageHurtownia].wpb.RB28PR_Pozycje AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodPozycji=src.KodPozycji, tgt.NazwaProgramu=src.NazwaProgramu, tgt.Czesc=src.Czesc, tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.PlanPoZmianachWkladUE=src.PlanPoZmianachWkladUE, tgt.PlanPoZmianachWkladBP=src.PlanPoZmianachWkladBP, tgt.ZaangazowanieWkladUE=src.ZaangazowanieWkladUE, tgt.ZaangazowanieWkladBP=src.ZaangazowanieWkladBP, tgt.WykonanieWydatkowWkladBP=src.WykonanieWydatkowWkladBP, tgt.WykonanieWydatkowWkladUE=src.WykonanieWydatkowWkladUE
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, KodPozycji, NazwaProgramu, Czesc, Dzial, Rozdzial, Paragraf, PlanPoZmianachWkladUE, PlanPoZmianachWkladBP, ZaangazowanieWkladUE, ZaangazowanieWkladBP, WykonanieWydatkowWkladBP, WykonanieWydatkowWkladUE)
		VALUES (src.IdDok, src.NumerPozycji, src.KodPozycji, src.NazwaProgramu, src.Czesc, src.Dzial, src.Rozdzial, src.Paragraf, src.PlanPoZmianachWkladUE, src.PlanPoZmianachWkladBP, src.ZaangazowanieWkladUE, src.ZaangazowanieWkladBP, src.WykonanieWydatkowWkladBP, src.WykonanieWydatkowWkladUE);
		SET @Merged = 1;
	END

	IF @TableName = 'RB28UE_Dokument' BEGIN
		MERGE INTO wpb.RB28UE_Dokument AS tgt
		USING [WA_StageHurtownia].wpb.RB28UE_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.JednostkaSprawozdawcza=src.JednostkaSprawozdawcza, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.Status=src.Status, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataWykonania=src.DataWykonania, tgt.DataDo=src.DataDo, tgt.OkresOd=src.OkresOd, tgt.OkresDo=src.OkresDo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDokumentu, NumerDokumentu, JednostkaSprawozdawcza, DataRejestrDokWSyst, Status, DataZamkniecia, DataWykonania, DataDo, OkresOd, OkresDo)
		VALUES (src.IdDok, src.RodzajDokumentu, src.NumerDokumentu, src.JednostkaSprawozdawcza, src.DataRejestrDokWSyst, src.Status, src.DataZamkniecia, src.DataWykonania, src.DataDo, src.OkresOd, src.OkresDo);
		SET @Merged = 1;
	END

	IF @TableName = 'RB28UE_Pozycje' BEGIN
		MERGE INTO wpb.RB28UE_Pozycje AS tgt
		USING [WA_StageHurtownia].wpb.RB28UE_Pozycje AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaProgramu=src.NazwaProgramu, tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.PlanPoZmianach=src.PlanPoZmianach, tgt.Zaangazowanie=src.Zaangazowanie, tgt.WykonanieWydatkow=src.WykonanieWydatkow
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, NazwaProgramu, Dzial, Rozdzial, Paragraf, PlanPoZmianach, Zaangazowanie, WykonanieWydatkow)
		VALUES (src.IdDok, src.NumerPozycji, src.NazwaProgramu, src.Dzial, src.Rozdzial, src.Paragraf, src.PlanPoZmianach, src.Zaangazowanie, src.WykonanieWydatkow);
		SET @Merged = 1;
	END

	IF @TableName = 'RB70_Dokument' BEGIN
		MERGE INTO wpb.RB70_Dokument AS tgt
		USING [WA_StageHurtownia].wpb.RB70_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.JednostkaSprawozdawcza=src.JednostkaSprawozdawcza, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.Status=src.Status, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataWykonania=src.DataWykonania, tgt.OkresOd=src.OkresOd, tgt.OkresDo=src.OkresDo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDokumentu, NumerDokumentu, JednostkaSprawozdawcza, DataRejestrDokWSyst, Status, DataZamkniecia, DataWykonania, OkresOd, OkresDo)
		VALUES (src.IdDok, src.RodzajDokumentu, src.NumerDokumentu, src.JednostkaSprawozdawcza, src.DataRejestrDokWSyst, src.Status, src.DataZamkniecia, src.DataWykonania, src.OkresOd, src.OkresDo);
		SET @Merged = 1;
	END

	IF @TableName = 'RB70_Pozycje' BEGIN
		MERGE INTO wpb.RB70_Pozycje AS tgt
		USING [WA_StageHurtownia].wpb.RB70_Pozycje AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.StatusZatrudnienia=src.StatusZatrudnienia, tgt.PlanPoZmianach=src.PlanPoZmianach, tgt.PrzecietneWykonanieWokresieSprawozdaw=src.PrzecietneWykonanieWokresieSprawozdaw, tgt.StanNaKoniecOkresuSprawodaw=src.StanNaKoniecOkresuSprawodaw, tgt.PlanOsoboweUposazenia=src.PlanOsoboweUposazenia, tgt.PlanDodatkoweWynagrodzenieRoczne=src.PlanDodatkoweWynagrodzenieRoczne, tgt.WykonanieOsoboweUposazenia=src.WykonanieOsoboweUposazenia, tgt.DodatkoweWynagrodzenieRoczne=src.DodatkoweWynagrodzenieRoczne, tgt.WynagrodzeniePozaLimitem=src.WynagrodzeniePozaLimitem
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, Dzial, Rozdzial, StatusZatrudnienia, PlanPoZmianach, PrzecietneWykonanieWokresieSprawozdaw, StanNaKoniecOkresuSprawodaw, PlanOsoboweUposazenia, PlanDodatkoweWynagrodzenieRoczne, WykonanieOsoboweUposazenia, DodatkoweWynagrodzenieRoczne, WynagrodzeniePozaLimitem)
		VALUES (src.IdDok, src.NumerPozycji, src.Dzial, src.Rozdzial, src.StatusZatrudnienia, src.PlanPoZmianach, src.PrzecietneWykonanieWokresieSprawozdaw, src.StanNaKoniecOkresuSprawodaw, src.PlanOsoboweUposazenia, src.PlanDodatkoweWynagrodzenieRoczne, src.WykonanieOsoboweUposazenia, src.DodatkoweWynagrodzenieRoczne, src.WynagrodzeniePozaLimitem);
		SET @Merged = 1;
	END

		IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END