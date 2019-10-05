CREATE TABLE [aes2].[ZWU_Podmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [UlicaNumer]                NVARCHAR (105) NULL,
    [KodPocztowy]               NVARCHAR (9)   NULL,
    [Miejscowosc]               NVARCHAR (105) NULL,
    [Nazwa]                     NVARCHAR (105) NULL,
    [Kraj]                      NVARCHAR (2)   NULL,
    [KrajPid]                   NVARCHAR (2)   NULL,
    [TIN]                       NVARCHAR (17)  NULL,
    [REGON]                     NVARCHAR (14)  NULL,
    [IdDokZWU]                  NUMERIC (19)   NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    CONSTRAINT [ZWU_Podmiot$PK_ZWU_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Podmiot_IdDokZWU_ZWU_Dokument_id] FOREIGN KEY ([IdDokZWU]) REFERENCES [aes2].[ZWU_Dokument] ([Id])
);


GO
ALTER TABLE [aes2].[ZWU_Podmiot] NOCHECK CONSTRAINT [FK__ZWU_Podmiot_IdDokZWU_ZWU_Dokument_id];

