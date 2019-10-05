CREATE TABLE [aimp2].[DPDZ_Podmiot] (
    [IdKontrahenta]           NUMERIC (19)  NOT NULL,
    [IdDok]                   NUMERIC (19)  NULL,
    [IdGrupyCertyfAEO]        NUMERIC (19)  NULL,
    [PlacowkaPodmiotu]        NCHAR (2)     NULL,
    [RolaPodmiotu]            NVARCHAR (20) NOT NULL,
    [Email]                   NVARCHAR (70) NULL,
    [EORI]                    NVARCHAR (17) NULL,
    [IdSISC]                  NVARCHAR (20) NULL,
    [IdPodmiotuGospodarczego] NVARCHAR (18) NULL,
    [NazwaPodmiotu]           NVARCHAR (100) NULL,
    [REGON]                   NVARCHAR (14) NULL,
    [TypReprezentacji]        NCHAR (3)     NULL,
    [TIN]                     NVARCHAR (17) NULL,
    [IdAdresu]                NUMERIC (19)  NULL,
    [IdOsobyPodpisujacejDok]  NUMERIC (19)  NULL,
    CONSTRAINT [DPDZ_Podmiot_PK] PRIMARY KEY CLUSTERED ([IdKontrahenta] ASC)
);

