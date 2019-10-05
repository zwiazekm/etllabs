CREATE TABLE [zc].[PWD_DokumentPoprzedni] (
    [IdDok]          BIGINT       NOT NULL,
    [IdPozycji]      SMALLINT     NOT NULL,
    [KodDokPoprz]    VARCHAR (3)  NULL,
    [KodDokPoprzPid] INT          NULL,
    [NrDokPoprz]     VARCHAR (35) NULL,
    [NrCelina]       VARCHAR (25) NULL,
    [IdPozycjiTowar] SMALLINT     DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_PWD_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiTowar] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PWD_DokumentPoprzedni_IdDok_PWD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[PWD_Dokument] ([IdDok]),
    CONSTRAINT [FK_PWD_DokumentPoprzedni_KodDokPoprzPid] FOREIGN KEY ([KodDokPoprzPid]) REFERENCES [pdr].[s081] ([s081_id])
);

