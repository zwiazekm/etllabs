CREATE TABLE [zc].[SADG_Powiazanie] (
    [IdDok]         VARCHAR (30) NOT NULL,
    [Typ]           CHAR (1)     NOT NULL,
    [IdPozycji]     INT          NOT NULL,
    [NrEwidencyjny] VARCHAR (40) NULL,
    [RodzajDok]     VARCHAR (4)  NULL,
    CONSTRAINT [PK_SADG_Powiazanie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [Typ] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SADG_Powiazanie_IdDok_SADG_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SADG_Dokument] ([IdDok])
);

