CREATE TABLE [stat].[dgt_kopia_kw_tabela] (
    [nr_tabeli]   VARCHAR (20) NOT NULL,
    [rodzaj]      CHAR (1)     NOT NULL,
    [z_dnia]      DATETIME     NOT NULL,
    [data_od]     DATETIME     NOT NULL,
    [data_do]     DATETIME     NOT NULL,
    [uwagi]       VARCHAR (80) NULL,
    [aktywna]     CHAR (1)     NULL,
    [generacjaId] INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_kw_tabela] PRIMARY KEY CLUSTERED ([nr_tabeli] ASC, [rodzaj] ASC, [z_dnia] ASC, [generacjaId] ASC) ON [StatIndeksy]
);

