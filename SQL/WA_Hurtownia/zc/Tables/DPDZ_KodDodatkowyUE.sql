CREATE TABLE [zc].[DPDZ_KodDodatkowyUE] (
    [IdDok]             BIGINT      NOT NULL,
    [IdPozycji]         SMALLINT    NOT NULL,
    [IdPozycjiKodDodUE] SMALLINT    NOT NULL,
    [KodUE]             VARCHAR (4) NULL,
    [KodUEPid]          INT         NULL,
    CONSTRAINT [PK_DPDZ_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKodDodUE] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_KodUEPid] FOREIGN KEY ([KodUEPid]) REFERENCES [pdr].[s088] ([s088_id]),
    CONSTRAINT [FK_DPDZ_KodDodatkowyUE_IdDokIdPozycji_DPDZ_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DPDZ_Towar] ([IdDok], [IdPozycji])
);

