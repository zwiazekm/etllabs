

CREATE  PROCEDURE [wald].[p_bledne_dane_waldemar_na_statystyke]
AS
--eksport Statystyka bledne_dane_1 do Statystyka bledne_dane_2

INSERT INTO [stat].dgt_bledne_dane_2
SELECT * FROM [stat].dgt_bledne_dane_1

--czysczenie bledne_dane_1

TRUNCATE TABLE [stat].dgt_bledne_dane_1

--eksport z Waldemara bledne_dane na Statystyke do bledne_dane_1

INSERT INTO [stat].dgt_bledne_dane_1
SELECT
bd_mmrr,
bd_rodzaj,
bd_tabela,
bd_bledna_wartosc,
bd_nowa_wartosc,
bd_iddoknr,
bd_id_dok,
bd_iddoknr_pozid,
bd_id_dok_pozid,
bd_do_usuniecia,
bd_koment,
bd_typ,
uname
FROM
[wald].dgt_bledne_dane

INSERT INTO wald.raport 
SELECT 'P' AS Akcja, 'Waldemar-bledne dane --> Statystyka-bledne dane' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator