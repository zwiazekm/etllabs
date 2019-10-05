CREATE TABLE [stat].[dgt_kopia_v2_sl_procedura] (
    [Procedura]   VARCHAR (4)   NOT NULL,
    [Opis]        VARCHAR (800) NULL,
    [generacjaId] INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sl_procedura] PRIMARY KEY CLUSTERED ([Procedura] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [Opis]
    ON [stat].[dgt_kopia_v2_sl_procedura]([Opis]);

