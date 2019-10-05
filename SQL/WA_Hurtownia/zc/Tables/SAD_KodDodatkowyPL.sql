CREATE TABLE [zc].[SAD_KodDodatkowyPL] (
    [IdDok]             BIGINT      NOT NULL,
    [IdPozycji]         SMALLINT    NOT NULL,
    [IdPozycjiKodDodPL] SMALLINT    NOT NULL,
    [KodPL]             VARCHAR (4) NULL,
    [KodPLPid]          INT         NULL,
    CONSTRAINT [PK_SAD_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKodDodPL] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_KodDodatkowyPL_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_KodDodatkowyPL_KodPLPid] FOREIGN KEY ([KodPLPid]) REFERENCES [pdr].[s109] ([s109_id])
);

