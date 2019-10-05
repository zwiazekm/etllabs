CREATE TABLE [aes2].[DWU_Podmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [Miejscowosc]               NVARCHAR (255) NULL,
    [Kraj]                      NVARCHAR (255) NULL,
    [KrajPid]                   INT            NULL,
    [KodPocztowy]               NVARCHAR (255) NULL,
    [UlicaNumer]                NVARCHAR (255) NULL,
    [TIN]                       NVARCHAR (255) NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [REGON]                     NVARCHAR (14)  NULL,
    [IdDokDWU]                  NUMERIC (19)   NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    [Nazwa]                     NVARCHAR (255) NULL,
    CONSTRAINT [DWU_Podmiot$PK_DWU_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWU_Podmiot_IdDokDWU__DWU_Dokument_id] FOREIGN KEY ([IdDokDWU]) REFERENCES [aes2].[DWU_Dokument] ([Id])
);

