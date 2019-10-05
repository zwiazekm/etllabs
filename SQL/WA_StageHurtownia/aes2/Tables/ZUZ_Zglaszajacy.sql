CREATE TABLE [aes2].[ZUZ_Zglaszajacy] (
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
    [DataWpisuNaListe]          DATETIME2 (3)  NULL,
    [WskaznikEksportera]        NVARCHAR (5)   NULL,
    [WskaznikEksporteraPid]     NVARCHAR (5)   NULL,
    [NrWpisuNaListe]            NVARCHAR (35)  NULL,
    [Przedstawicielstwo]        NVARCHAR (1)   NULL,
    [PrzedstawicielstwoPid]     NVARCHAR (1)   NULL,
    [IdDokZUZ]                  NUMERIC (19)   NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    CONSTRAINT [ZUZ_Zglaszajacy$PK_ZUZ_Zglaszajacy] PRIMARY KEY CLUSTERED ([Id] ASC)
);

