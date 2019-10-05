CREATE TABLE [zc].[SAD_DokumentWymagany] (
    [IdDok]                BIGINT       NOT NULL,
    [IdPozycji]            SMALLINT     NOT NULL,
    [IdPozycjiDokWymagany] SMALLINT     NOT NULL,
    [KodDokWym]            VARCHAR (4)  NULL,
    [KodDokWymPid]         INT          NULL,
    [NrDokWym]             VARCHAR (35) NULL,
    CONSTRAINT [PK_SAD_DokumentWymagany] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiDokWymagany] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_DokumentWymagany_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_DokumentWymagany_KodDokWymPid] FOREIGN KEY ([KodDokWymPid]) REFERENCES [pdr].[s034] ([s034_id])
);

