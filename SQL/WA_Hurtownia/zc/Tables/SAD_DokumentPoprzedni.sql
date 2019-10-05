CREATE TABLE [zc].[SAD_DokumentPoprzedni] (
    [IdDok]             BIGINT       NOT NULL,
    [IdPozycji]         SMALLINT     NOT NULL,
    [IdPozycjiDokPoprz] SMALLINT     NOT NULL,
    [Kategoria]         CHAR (1)     NULL,
    [KategoriaPid]      INT          NULL,
    [KodDokPoprz]       CHAR (3)     NULL,
    [KodDokPoprzPid]    INT          NULL,
    [TypSAD]            CHAR (2)     NULL,
    [TypSADPid]         INT          NULL,
    [NrDokPoprz]        VARCHAR (35) NULL,
    [NrCelina]          VARCHAR (25) NULL,
    CONSTRAINT [PK_SAD_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiDokPoprz] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_DokumentPoprzedni_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_DokumentPoprzedni_KategoriaPid] FOREIGN KEY ([KategoriaPid]) REFERENCES [pdr].[s080] ([s080_id]),
    CONSTRAINT [FK_SAD_DokumentPoprzedni_KodDokPoprzPid] FOREIGN KEY ([KodDokPoprzPid]) REFERENCES [pdr].[s081] ([s081_id]),
    CONSTRAINT [FK_SAD_DokumentPoprzedni_TypSADPid] FOREIGN KEY ([TypSADPid]) REFERENCES [pdr].[s015] ([s015_id])
);

