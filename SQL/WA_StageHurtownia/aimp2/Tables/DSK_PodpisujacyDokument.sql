CREATE TABLE [aimp2].[DSK_PodpisujacyDokument] (
    [IdPodpisujacego]                 NUMERIC (19)  NOT NULL,
    [IdDok]                           NUMERIC (19)  NULL,
    [DataWpisuNaListeAgentowCelnych]  DATETIME2 (3) NULL,
    [NumerWpisuNaListeAgentowCelnych] NVARCHAR (35) NULL,
    [EmailOsobyPodpisujacej]          NVARCHAR (70) NULL,
    [ImieOsobyPodpisujacej]           NVARCHAR (30) NULL,
    [NazwiskoOsobyPodpisujacej]       NVARCHAR (40) NULL,
    [TrescPouczenia]                  NTEXT         NULL,
    [NumerTelefonuOsobyPodpisujacej]  NVARCHAR (15) NULL,
    CONSTRAINT [DSK_PodpisujacyDokument_PK] PRIMARY KEY CLUSTERED ([IdPodpisujacego] ASC)
);

