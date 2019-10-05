CREATE TABLE [aimp2].[PWD_DokumentPoprzedni] (
    [IdDokPoprzed]    NUMERIC (19)  NOT NULL,
    [IdTowarPWD]      NUMERIC (19)  NULL,
    [Kategoria]       NVARCHAR (1)  NULL,
    [KategoriaPid]    INT           NULL,
    [KodDokPoprz]     NVARCHAR (3)  NULL,
    [KodDokPoprzPid]  INT           NULL,
    [Numer]           NVARCHAR (35) NULL,
    [NumerDokumentu]  NUMERIC (5)   NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [PWD_DokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC) ON [FG_AIMP2],
    CONSTRAINT [PWD_DokumentPoprzedni$FK_PWD_Towar] FOREIGN KEY ([IdTowarPWD]) REFERENCES [aimp2].[PWD_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

