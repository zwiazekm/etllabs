CREATE TABLE [zc].[PWD_DokumentWymagany] (
    [IdDok]          BIGINT       NOT NULL,
    [IdPozycji]      SMALLINT     NOT NULL,
    [KodDokWym]      VARCHAR (4)  NULL,
    [KodDokWymPid]   INT          NULL,
    [NrDokWym]       VARCHAR (35) NULL,
    [IdPozycjiTowar] SMALLINT     DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_PWD_DokumentWymagany] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiTowar] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PWD_DokumentWymagany_IdDok_PWD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[PWD_Dokument] ([IdDok]),
    CONSTRAINT [FK_PWD_DokumentWymagany_KodDokWymPid] FOREIGN KEY ([KodDokWymPid]) REFERENCES [pdr].[s034] ([s034_id])
);

