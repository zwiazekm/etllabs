CREATE TABLE [zc].[DPDZ_KodDodatkowyPL] (
    [IdDok]             BIGINT      NOT NULL,
    [IdPozycji]         SMALLINT    NOT NULL,
    [IdPozycjiKodDodPL] SMALLINT    NOT NULL,
    [KodPL]             VARCHAR (4) NULL,
    [KodPLPid]          INT         NULL,
    CONSTRAINT [PK_DPDZ_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKodDodPL] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_KodPLPid] FOREIGN KEY ([KodPLPid]) REFERENCES [pdr].[s109] ([s109_id]),
    CONSTRAINT [FK_DPDZ_KodDodatkowyPL_IdDokIdPozycji_DPDZ_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DPDZ_Towar] ([IdDok], [IdPozycji])
);

