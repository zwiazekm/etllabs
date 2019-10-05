CREATE TABLE [aes2].[ZUZ_Podmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [Miejscowosc]               NVARCHAR (255) NULL,
    [Kraj]                      NVARCHAR (255) NULL,
    [KrajPid]                   NVARCHAR (255) NULL,
    [Nazwa]                     NVARCHAR (255) NULL,
    [KodPocztowy]               NVARCHAR (255) NULL,
    [UlicaNumer]                NVARCHAR (255) NULL,
    [TIN]                       NVARCHAR (255) NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [REGON]                     NVARCHAR (14)  NULL,
    [EORIUzupeln]               NVARCHAR (17)  NULL,
    [TINUzupeln]                NVARCHAR (17)  NULL,
    [IdDokZUZ]                  NUMERIC (19)   NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    CONSTRAINT [ZUZ_Podmiot$PK_ZUZ_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

