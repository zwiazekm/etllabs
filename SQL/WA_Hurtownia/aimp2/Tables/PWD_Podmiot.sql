CREATE TABLE [aimp2].[PWD_Podmiot] (
    [IdKontrahenta]           NUMERIC (19)  NOT NULL,
    [IdDok]                   NUMERIC (19)  NULL,
    [IdGrupyCertyfAEO]        NUMERIC (19)  NULL,
    [PlacowkaPodmiotu]        NCHAR (2)     NULL,
    [RolaPodmiotu]            NVARCHAR (20) NOT NULL,
    [Email]                   NVARCHAR (70) NULL,
    [EORI]                    NVARCHAR (17) NULL,
    [IdSISC]                  NVARCHAR (20) NULL,
    [IdPodmiotuGospodarczego] NVARCHAR (18) NULL,
    [NazwaPodmiotu]           NVARCHAR (70) NULL,
    [REGON]                   NVARCHAR (14) NULL,
    [TypReprezentacji]        NCHAR (3)     NULL,
    [TIN]                     NVARCHAR (17) NULL,
    [IdAdresu]                NUMERIC (19)  NULL,
    [IdOsobyPodpisujacejDok]  NUMERIC (19)  NULL,
    CONSTRAINT [PWD_Podmiot_PK] PRIMARY KEY CLUSTERED ([IdKontrahenta] ASC) ON [FG_AIMP2],
    CONSTRAINT [PWD_Podmiot$FK_PWD_Dokument] FOREIGN KEY ([IdDok]) REFERENCES [aimp2].[PWD_Dokument] ([IdDok]),
    CONSTRAINT [PWD_Podmiot$FK_PWD_PodmiotAdres] FOREIGN KEY ([IdAdresu]) REFERENCES [aimp2].[PWD_PodmiotAdres] ([IdAdresu])
);

