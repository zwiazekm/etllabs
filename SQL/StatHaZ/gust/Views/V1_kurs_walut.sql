CREATE VIEW gust.V1_kurs_walut
AS
SELECT DISTINCT 
                      --TOP 100 PERCENT 
					  '0' + CAST(MONTH(z_dnia) AS varchar(12)) + SUBSTRING(CAST(YEAR(z_dnia) AS varchar(12)), 3, 2) AS Miesiac, id_waluty, kurs, 
                   		z_dnia
FROM         stat.dgt_kopia_kw_kurs
WHERE     (id_waluty = 'USD') OR (id_waluty = 'EUR')