CREATE TABLE [zab].[Gwaranci] (
    [IdGwaranta]        INT           NOT NULL,
    [Nazwa]             VARCHAR (255) NOT NULL,
    [NIP]               VARCHAR (15)  NOT NULL,
    [AdresUlica]        VARCHAR (255) NULL,
    [AdresNumerBudynku] VARCHAR (10)  NOT NULL,
    [AdresNumerLokalu]  VARCHAR (10)  NULL,
    [AdresMiejscowosc]  VARCHAR (100) NOT NULL,
    [AdresKodPocztowy]  VARCHAR (6)   NOT NULL,
    [AdresKraj]         VARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Gwaranci] PRIMARY KEY CLUSTERED ([IdGwaranta] ASC) ON [FG_ZAB]
);

