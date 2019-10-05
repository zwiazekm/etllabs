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
    CONSTRAINT [PWD_DokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC)
);

