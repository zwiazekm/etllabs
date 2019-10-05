CREATE TABLE [aimp2].[ZCP_TowarDokumentPoprzedni] (
    [IdDokPoprzed]    NUMERIC (19)  NOT NULL,
    [IdTowarZCP]      NUMERIC (19)  NULL,
    [Kategoria]       NVARCHAR (1)  NULL,
    [KategoriaPid]    INT           NULL,
    [KodDokPoprz]     NVARCHAR (3)  NULL,
    [KodDokPoprzPid]  INT           NULL,
    [Numer]           NVARCHAR (35) NULL,
    [NumerDokumentu]  NUMERIC (5)   NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [ZCP_TowarDokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC)
);

