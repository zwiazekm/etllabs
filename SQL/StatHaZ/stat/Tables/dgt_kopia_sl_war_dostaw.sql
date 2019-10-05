CREATE TABLE [stat].[dgt_kopia_sl_war_dostaw] (
    [kod]         VARCHAR (10)   NOT NULL,
    [opis]        NVARCHAR (250) NULL,
    [generacjaId] INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_sl_war_dostaw] PRIMARY KEY CLUSTERED ([kod] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [opis]
    ON [stat].[dgt_kopia_sl_war_dostaw]([opis]);

