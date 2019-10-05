CREATE TABLE [stat].[dgt_rejestr_podmiotow] (
    [nip]           VARCHAR (10)  NULL,
    [regon]         VARCHAR (14)  NULL,
    [nazwa_pelna]   VARCHAR (255) NULL,
    [imie]          VARCHAR (35)  NULL,
    [nazwisko]      VARCHAR (35)  NULL,
    [kraj]          VARCHAR (2)   NULL,
    [gmina]         VARCHAR (7)   NULL,
    [kod_poczt]     VARCHAR (8)   NULL,
    [poczta]        VARCHAR (35)  NULL,
    [miejscowosc]   VARCHAR (35)  NULL,
    [ulica]         VARCHAR (45)  NULL,
    [nr_domu]       VARCHAR (9)   NULL,
    [nr_lok]        VARCHAR (5)   NULL,
    [telefon]       VARCHAR (35)  NULL,
    [faks]          VARCHAR (35)  NULL,
    [email]         VARCHAR (128) NULL,
    [rodz_vat]      VARCHAR (1)   NULL,
    [data_zakoncz]  VARCHAR (8)   NULL,
    [kategoria_p]   VARCHAR (1)   NULL,
    [kategoria_w]   VARCHAR (1)   NULL,
    [priorytet_p]   VARCHAR (1)   NULL,
    [priorytet_w]   VARCHAR (1)   NULL,
    [kod_us]        VARCHAR (10)  COLLATE SQL_Polish_CP1250_CI_AS NULL,
    [trans_dostawa] VARCHAR (14)  NULL,
    [trans_nabycie] VARCHAR (14)  NULL
) ON [StatDane];


GO
CREATE STATISTICS [data_zakoncz]
    ON [stat].[dgt_rejestr_podmiotow]([data_zakoncz]);


GO
CREATE STATISTICS [email]
    ON [stat].[dgt_rejestr_podmiotow]([email]);


GO
CREATE STATISTICS [faks]
    ON [stat].[dgt_rejestr_podmiotow]([faks]);


GO
CREATE STATISTICS [gmina]
    ON [stat].[dgt_rejestr_podmiotow]([gmina]);


GO
CREATE STATISTICS [imie]
    ON [stat].[dgt_rejestr_podmiotow]([imie]);


GO
CREATE STATISTICS [kategoria_p]
    ON [stat].[dgt_rejestr_podmiotow]([kategoria_p]);


GO
CREATE STATISTICS [kategoria_w]
    ON [stat].[dgt_rejestr_podmiotow]([kategoria_w]);


GO
CREATE STATISTICS [kod_poczt]
    ON [stat].[dgt_rejestr_podmiotow]([kod_poczt]);


GO
CREATE STATISTICS [kod_us]
    ON [stat].[dgt_rejestr_podmiotow]([kod_us]);


GO
CREATE STATISTICS [kraj]
    ON [stat].[dgt_rejestr_podmiotow]([kraj]);


GO
CREATE STATISTICS [miejscowosc]
    ON [stat].[dgt_rejestr_podmiotow]([miejscowosc]);


GO
CREATE STATISTICS [nazwisko]
    ON [stat].[dgt_rejestr_podmiotow]([nazwisko]);


GO
CREATE STATISTICS [nr_domu]
    ON [stat].[dgt_rejestr_podmiotow]([nr_domu]);


GO
CREATE STATISTICS [nr_lok]
    ON [stat].[dgt_rejestr_podmiotow]([nr_lok]);


GO
CREATE STATISTICS [poczta]
    ON [stat].[dgt_rejestr_podmiotow]([poczta]);


GO
CREATE STATISTICS [priorytet_p]
    ON [stat].[dgt_rejestr_podmiotow]([priorytet_p]);


GO
CREATE STATISTICS [priorytet_w]
    ON [stat].[dgt_rejestr_podmiotow]([priorytet_w]);


GO
CREATE STATISTICS [rodz_vat]
    ON [stat].[dgt_rejestr_podmiotow]([rodz_vat]);


GO
CREATE STATISTICS [telefon]
    ON [stat].[dgt_rejestr_podmiotow]([telefon]);


GO
CREATE STATISTICS [trans_dostawa]
    ON [stat].[dgt_rejestr_podmiotow]([trans_dostawa]);


GO
CREATE STATISTICS [trans_nabycie]
    ON [stat].[dgt_rejestr_podmiotow]([trans_nabycie]);


GO
CREATE STATISTICS [ulica]
    ON [stat].[dgt_rejestr_podmiotow]([ulica]);

