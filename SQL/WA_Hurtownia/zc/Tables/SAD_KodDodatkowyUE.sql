CREATE TABLE [zc].[SAD_KodDodatkowyUE] (
    [IdDok]             BIGINT      NOT NULL,
    [IdPozycji]         SMALLINT    NOT NULL,
    [IdPozycjiKodDodUE] SMALLINT    NOT NULL,
    [KodUE]             VARCHAR (4) NULL,
    [KodUEPid]          INT         NULL,
    CONSTRAINT [PK_SAD_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKodDodUE] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_KodDodatkowyUE_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_KodDodatkowyUE_KodUEPid] FOREIGN KEY ([KodUEPid]) REFERENCES [pdr].[s088] ([s088_id])
);

