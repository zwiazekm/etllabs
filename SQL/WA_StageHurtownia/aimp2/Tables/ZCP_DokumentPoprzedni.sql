CREATE TABLE [aimp2].[ZCP_DokumentPoprzedni] (
    [IdDokPoprzed]    NUMERIC (19)  NOT NULL,
    [IdDok]           NUMERIC (19)  NULL,
    [Kategoria]       NVARCHAR (1)  NOT NULL,
    [KategoriaPid]    INT           NULL,
    [KodDokPoprz]     NVARCHAR (3)  NOT NULL,
    [KodDokPoprzPid]  INT           NULL,
    [Numer]           NVARCHAR (35) NOT NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [ZCP_DokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC)
);

