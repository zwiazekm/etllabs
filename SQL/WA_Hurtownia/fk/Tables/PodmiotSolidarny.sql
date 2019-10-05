CREATE TABLE [fk].[PodmiotSolidarny] (
    [IdDokumentuSprawy] VARCHAR (30) NOT NULL,
    [IdPodmiotu]        INT          NOT NULL,
    [IdKomorki]         VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_PodmiotSolidarny] PRIMARY KEY CLUSTERED ([IdDokumentuSprawy] ASC, [IdPodmiotu] ASC, [IdKomorki] ASC) ON [FG_FK],
    CONSTRAINT [FK_PodmiotSolidarny_IdDokumentuSprawy_SprawyDluzne_IdDokumentuSprawy] FOREIGN KEY ([IdDokumentuSprawy]) REFERENCES [fk].[SprawyDluzne] ([IdDokumentuSprawy]),
    CONSTRAINT [FK_PodmiotSolidarny_IdPodmiotuIdKomorki_PodmiotDluzny_IdPodmiotuIdKomorki] FOREIGN KEY ([IdPodmiotu], [IdKomorki]) REFERENCES [fk].[PodmiotDluzny] ([IdPodmiotu], [IdKomorki])
);

