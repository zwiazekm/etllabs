CREATE TABLE [zc].[DPDZ_DokumentWymagany] (
    [IdDok]                BIGINT       NOT NULL,
    [IdPozycji]            SMALLINT     NOT NULL,
    [IdPozycjiDokWymagany] SMALLINT     NOT NULL,
    [KodDokWym]            VARCHAR (4)  NULL,
    [KodDokWymPid]         INT          NULL,
    [NrDokWym]             VARCHAR (35) NULL,
    CONSTRAINT [PK_DPDZ_DokumentWymagany] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiDokWymagany] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_KodDokWymPid] FOREIGN KEY ([KodDokWymPid]) REFERENCES [pdr].[s034] ([s034_id]),
    CONSTRAINT [FK_DPDZ_DokumentWymagany_IdDokIdPozycji_DPDZ_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DPDZ_Towar] ([IdDok], [IdPozycji])
);

