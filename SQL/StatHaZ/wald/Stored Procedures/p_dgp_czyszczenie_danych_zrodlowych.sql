






CREATE       PROCEDURE [wald].[p_dgp_czyszczenie_danych_zrodlowych]

AS

INSERT INTO [stat].dgt_bledne_dane_1
SELECT * FROM [stat].dgt_bledne_dane_2
TRUNCATE TABLE [stat].dgt_bledne_dane_2

--exec [stat].dgp_czyszczenie_danych_zrodlowych_bez_kursor
exec [stat].dgp_czyszczenie_danych_zrodlowych_v2
exec [stat].dgp_czyszczenie_danych_zrodlowych_v2_z2005
exec [stat].dgp_czyszczenie_danych_zrodlowych_z2005