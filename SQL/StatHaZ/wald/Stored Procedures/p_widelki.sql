
CREATE PROCEDURE [wald].p_widelki AS

truncate table [wald].widelki_masa_na_jedn
truncate table [wald].widelki_wartosc_na_jedn
truncate table [wald].widelki_wartosc_na_kg

exec [wald].p_widelki_masa_na_jedn
exec [wald].p_widelki_wartosc_na_jedn
exec [wald].p_widelki_wartosc_na_kg