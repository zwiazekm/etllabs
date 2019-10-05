-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-05-29
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego) z systemu OSOZ(1.0)
-- =============================================
CREATE PROCEDURE [osoz].[TruncateAllOSOZ2]
AS
BEGIN
	SET NOCOUNT ON;

		TRUNCATE TABLE osoz.pokwitowanie_seed;
		TRUNCATE TABLE osoz.pokwitowania_procedury_akcyzowe;
		TRUNCATE TABLE osoz.gwarancje_na_zabezpieczeniach;
		TRUNCATE TABLE osoz.zaswiadczenia_tc;
		TRUNCATE TABLE osoz.gwarancje_na_pokwitowaniach;
		TRUNCATE TABLE osoz.potwierdzenia_na_zabezpieczeniu;
		TRUNCATE TABLE osoz.potwierdzenia;
		TRUNCATE TABLE osoz.dokumenty_windykacyjne;
		TRUNCATE TABLE osoz.inna_forma;
		TRUNCATE TABLE osoz.kwoty_na_zabezpieczeniach;
		TRUNCATE TABLE osoz.pokwitowania;
		TRUNCATE TABLE osoz.uzupelnienia_kwoty;
		TRUNCATE TABLE osoz.zabezpieczenie_forma_zabezpieczenia_gier;		
		TRUNCATE TABLE osoz.hipoteki;
		TRUNCATE TABLE osoz.zabezpieczenia_procedury_akcyzowe;
		TRUNCATE TABLE osoz.procedury_akcyzowe;
		TRUNCATE TABLE osoz.uzycia_zabezpieczenia;
		TRUNCATE TABLE osoz.dokumenty_obciazajace;
		TRUNCATE TABLE osoz.decyzcje_zwolnienia_seed;
		TRUNCATE TABLE osoz.decyzje_w_sprawie_zwolnienia;
		TRUNCATE TABLE osoz.zabezpieczenia_status_kontrahenta;
		TRUNCATE TABLE osoz.status_kontrahenta;
		TRUNCATE TABLE osoz.sl_nazwy_seed;
		TRUNCATE TABLE osoz.zabezpieczenia_sl_ograniczenie_waznosci;
		TRUNCATE TABLE osoz.sl_ograniczenie_waznosci;
		TRUNCATE TABLE osoz.zabezpieczenia_generalne_procedury_procedury;
		TRUNCATE TABLE osoz.procedury_pdr;
		TRUNCATE TABLE osoz.procedury_celne;
		TRUNCATE TABLE osoz.zabezpieczenia_generalne_procedury;
		TRUNCATE TABLE osoz.zabezpieczenia_towary;
		TRUNCATE TABLE osoz.towary;
		TRUNCATE TABLE osoz.rodzaje_dzialalnosci_dla_koncesji_zezwolen;
		TRUNCATE TABLE osoz.zezwolenia_gry_hazardowe;
		TRUNCATE TABLE osoz.zwrot_kwoty_zabezpieczenia;
		TRUNCATE TABLE osoz.zabezpieczenia;
		TRUNCATE TABLE osoz.gwarancje;
		TRUNCATE TABLE osoz.forma_zabezpieczenia;
		TRUNCATE TABLE osoz.gwaranci;
		TRUNCATE TABLE osoz.towary_potencjalnie_wrazliwe;
		TRUNCATE TABLE osoz.struktura_organizacyjna;
		TRUNCATE TABLE osoz.sl_kraje_ue;
		TRUNCATE TABLE osoz.sl_waluty;
		TRUNCATE TABLE osoz.pozwolenia;
		TRUNCATE TABLE osoz.kontrahenci
		TRUNCATE TABLE osoz.zabezpieczenia_procedury_celne;
		TRUNCATE TABLE osoz.zabezpieczenia_struktury_organizacyjne;
END