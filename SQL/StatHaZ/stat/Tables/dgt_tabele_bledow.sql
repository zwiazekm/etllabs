CREATE TABLE [stat].[dgt_tabele_bledow] (
    [typ]    VARCHAR (10) NOT NULL,
    [tabela] VARCHAR (30) NULL,
    [rodzaj] VARCHAR (30) NOT NULL,
    [opis]   VARCHAR (30) NULL,
    CONSTRAINT [pk_dgt_tabele_bledow] PRIMARY KEY CLUSTERED ([typ] ASC, [rodzaj] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [opis]
    ON [stat].[dgt_tabele_bledow]([opis]);


GO
CREATE STATISTICS [rodzaj]
    ON [stat].[dgt_tabele_bledow]([rodzaj]);


GO
CREATE STATISTICS [tabela]
    ON [stat].[dgt_tabele_bledow]([tabela]);

