CREATE TABLE [aimp2].[DSK_DokumentPoprzedni] (
    [IdDokPoprzed]   NUMERIC (19)  NOT NULL,
    [IdTowarDSK]     NUMERIC (19)  NULL,
    [Kategoria]      NCHAR (1)     NULL,
    [KategoriaPid]   INT           NULL,
    [Kod]            NCHAR (3)     NULL,
    [KodPid]         INT           NULL,
    [NumerPozycji]   NUMERIC (5)   NULL,
    [NumerDokumentu] NVARCHAR (35) NULL,
    CONSTRAINT [DSK_DokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_DokumentPoprzedni$FK_DSK_Towar] FOREIGN KEY ([IdTowarDSK]) REFERENCES [aimp2].[DSK_Towar] ([IdPozycji])
);

