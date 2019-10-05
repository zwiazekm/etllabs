CREATE TABLE [aimp2].[DPDZ_DokumentPoprzedni] (
    [IdDokPoprzed]    NUMERIC (19)  NOT NULL,
    [IdTowarDPDZ]     NUMERIC (19)  NULL,
    [Kategoria]       NVARCHAR (1)  NULL,
    [KategoriaPid]    INT           NULL,
    [KodDokPoprz]     NVARCHAR (3)  NULL,
    [KodDokPoprzPid]  INT           NULL,
    [Numer]           NVARCHAR (35) NULL,
    [NumerDokumentu]  NUMERIC (5)   NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [DPDZ_DokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC) ON [FG_AIMP2],
    CONSTRAINT [DPDZ_DokumentPoprzedni$FK_DPDZ_Towar] FOREIGN KEY ([IdTowarDPDZ]) REFERENCES [aimp2].[DPDZ_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

