CREATE TABLE [zc].[SAD_SzczegolyWartosci] (
    [IdDok]               BIGINT      NOT NULL,
    [IdPozycji]           SMALLINT    NOT NULL,
    [IdPozycjiSzczegWart] SMALLINT    NOT NULL,
    [KodWartosci]         VARCHAR (5) NULL,
    [KodWartosciPid]      INT         NULL,
    CONSTRAINT [PK_SAD_SzczegolyWartosci] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiSzczegWart] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_SzczegolyWartosci_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_SzczegolyWartosci_KodWartosciPid] FOREIGN KEY ([KodWartosciPid]) REFERENCES [pdr].[s086] ([s086_id])
);

