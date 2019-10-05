CREATE TABLE [zab].[Podmiot] (
    [IdPodmiotu]        BIGINT         NOT NULL,
    [NIP]               VARCHAR (10)   NOT NULL,
    [REGON]             VARCHAR (14)   NULL,
    [EORI]              VARCHAR (17)   NULL,
    [Nazwa]             NVARCHAR (255) NOT NULL,
    [AdresUlica]        NVARCHAR (100) NULL,
    [AdresNumerBudynku] VARCHAR (10)   NULL,
    [AdresNumerLokalu]  VARCHAR (10)   NULL,
    [AdresMiejscowosc]  NVARCHAR (100) NOT NULL,
    [AdresKodPocztowy]  VARCHAR (9)    NULL,
    [AdresKraj]         NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Kontrahenci] PRIMARY KEY CLUSTERED ([IdPodmiotu] ASC) ON [FG_ZAB]
);

