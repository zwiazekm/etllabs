CREATE TABLE [stat].[dgt_kopia_sl_preferencji] (
    [kod]         VARCHAR (3) NOT NULL,
    [generacjaId] INT         NOT NULL,
    CONSTRAINT [PK_dgt_kopia_sl_preferencji] PRIMARY KEY CLUSTERED ([kod] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_sl_preferencji]([generacjaId]);

