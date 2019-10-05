CREATE TABLE [aimp2].[DSK_DokumentPoprzedniDeklaracja] (
    [IdDokPoprzed] NUMERIC (19)  NOT NULL,
    [IdDok]        NUMERIC (19)  NULL,
    [Kategoria]    NCHAR (1)     NULL,
    [KategoriaPid] INT           NULL,
    [Kod]          NCHAR (3)     NULL,
    [KodPid]       INT           NULL,
    [Numer]        NVARCHAR (35) NULL,
    CONSTRAINT [DSK_DokumentPoprzedniDeklaracja_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC)
);

