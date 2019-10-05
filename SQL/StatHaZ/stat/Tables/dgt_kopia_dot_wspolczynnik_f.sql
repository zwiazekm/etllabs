CREATE TABLE [stat].[dgt_kopia_dot_wspolczynnik_f] (
    [typ]         CHAR (1)       NOT NULL,
    [RokMc]       INT            NOT NULL,
    [f]           DECIMAL (5, 4) NULL,
    [generacjaId] INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_wspolczynnik_f] PRIMARY KEY CLUSTERED ([typ] ASC, [RokMc] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [f]
    ON [stat].[dgt_kopia_dot_wspolczynnik_f]([f]);


GO
CREATE STATISTICS [miesiac]
    ON [stat].[dgt_kopia_dot_wspolczynnik_f]([RokMc]);

