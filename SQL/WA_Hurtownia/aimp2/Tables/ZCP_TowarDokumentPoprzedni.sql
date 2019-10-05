﻿CREATE TABLE [aimp2].[ZCP_TowarDokumentPoprzedni] (
    [IdDokPoprzed]    NUMERIC (19)  NOT NULL,
    [IdTowarZCP]      NUMERIC (19)  NULL,
    [Kategoria]       NVARCHAR (1)  NULL,
    [KategoriaPid]    INT           NULL,
    [KodDokPoprz]     NVARCHAR (3)  NULL,
    [KodDokPoprzPid]  INT           NULL,
    [Numer]           NVARCHAR (35) NULL,
    [NumerDokumentu]  NUMERIC (5)   NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [ZCP_TowarDokumentPoprzedni_PK] PRIMARY KEY CLUSTERED ([IdDokPoprzed] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_TowarDokumentPoprzedni$FK_ZCP_Towar] FOREIGN KEY ([IdTowarZCP]) REFERENCES [aimp2].[ZCP_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

