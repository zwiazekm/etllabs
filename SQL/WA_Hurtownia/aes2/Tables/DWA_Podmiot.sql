CREATE TABLE [aes2].[DWA_Podmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [UlicaNumer]                NVARCHAR (255) NULL,
    [KodPocztowy]               NVARCHAR (255) NULL,
    [Miejscowosc]               NVARCHAR (255) NULL,
    [Nazwa]                     NVARCHAR (255) NULL,
    [Kraj]                      NVARCHAR (255) NULL,
    [KrajPid]                   INT            NULL,
    [TIN]                       NVARCHAR (255) NULL,
    [Przedstawicielstwo]        NVARCHAR (1)   NULL,
    [WskaznikEksportera]        NVARCHAR (5)   NULL,
    [DataWpisuNaListe]          NVARCHAR (35)  NULL,
    [NrWpisuNaListe]            DATETIME2 (3)  NULL,
    [IdDokDWA]                  NUMERIC (19)   NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [REGON]                     NVARCHAR (14)  NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    CONSTRAINT [DWA_Podmiot$PK_DWA_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWA_Podmiot_IdDokDWA__DWA_Dokument_id] FOREIGN KEY ([IdDokDWA]) REFERENCES [aes2].[DWA_Dokument] ([Id])
);

