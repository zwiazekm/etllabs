CREATE TABLE [stat].[dgt_kopia_v2_sl_transport] (
    [Rodzaj]      CHAR (1)      NOT NULL,
    [Opis]        VARCHAR (250) NULL,
    [generacjaId] INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sl_transport] PRIMARY KEY CLUSTERED ([Rodzaj] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [Opis]
    ON [stat].[dgt_kopia_v2_sl_transport]([Opis]);

