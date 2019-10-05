CREATE TABLE [stat].[dgt_kopia_sl_mapowania] (
    [rodzaj]      VARCHAR (10) NOT NULL,
    [stary]       VARCHAR (10) NOT NULL,
    [nowy]        VARCHAR (10) NOT NULL,
    [generacjaId] INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_sl_mapowania] PRIMARY KEY CLUSTERED ([rodzaj] ASC, [stary] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_sl_mapowania]([generacjaId]);


GO
CREATE STATISTICS [nowy]
    ON [stat].[dgt_kopia_sl_mapowania]([nowy]);


GO
CREATE STATISTICS [stary]
    ON [stat].[dgt_kopia_sl_mapowania]([stary]);

