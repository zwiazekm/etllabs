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
    CONSTRAINT [DPDZ_DokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC)
);

