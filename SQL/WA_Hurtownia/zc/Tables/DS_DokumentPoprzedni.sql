CREATE TABLE [zc].[DS_DokumentPoprzedni] (
    [IdDok]          BIGINT       NOT NULL,
    [IdPozycji]      SMALLINT     NOT NULL,
    [KodDokPoprz]    VARCHAR (3)  NULL,
    [KodDokPoprzPid] INT          NULL,
    [NrDokPoprz]     VARCHAR (35) NULL,
    [NrCelina]       VARCHAR (25) NULL,
    CONSTRAINT [PK_DS_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DS_DokumentPoprzedni_IdDok_DS_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DS_Dokument] ([IdDok]),
    CONSTRAINT [FK_DS_DokumentPoprzedni_KodDokPoprzPid] FOREIGN KEY ([KodDokPoprzPid]) REFERENCES [pdr].[s081] ([s081_id])
);

