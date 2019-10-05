CREATE TABLE [aimp2].[DSK_PodmiotGospodarczy] (
    [IdPodmiotuGospodarczego]     NUMERIC (19)  NOT NULL,
    [IdGrupyCertyfAEO]            NUMERIC (19)  NULL,
    [IdAdresu]                    NUMERIC (19)  NULL,
    [Email]                       NVARCHAR (70) NULL,
    [EORI]                        NVARCHAR (17) NULL,
    [NazwaPodmiotu]               NVARCHAR (70) NULL,
    [InnyNumerIdentyfikPodmiotu]  NVARCHAR (30) NULL,
    [PlacowkaPodmiotu]            NCHAR (2)     NULL,
    [REGON]                       NVARCHAR (14) NULL,
    [RodzajPrzedstawicielstwa]    NCHAR (3)     NULL,
    [RodzajPrzedstawicielstwaPid] INT           NULL,
    [TIN]                         NVARCHAR (17) NULL,
    CONSTRAINT [DSK_PodmiotGospodarczy_PK] PRIMARY KEY CLUSTERED ([IdPodmiotuGospodarczego] ASC)
);

