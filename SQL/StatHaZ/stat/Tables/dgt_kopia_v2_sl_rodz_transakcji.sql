CREATE TABLE [stat].[dgt_kopia_v2_sl_rodz_transakcji] (
    [RodzajTransakcji] VARCHAR (2)  NOT NULL,
    [Opis]             VARCHAR (80) NULL,
    [generacjaId]      INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sl_rodz_transakcji] PRIMARY KEY CLUSTERED ([RodzajTransakcji] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [Opis]
    ON [stat].[dgt_kopia_v2_sl_rodz_transakcji]([Opis]);

