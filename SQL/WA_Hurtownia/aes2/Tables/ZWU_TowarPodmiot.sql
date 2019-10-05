CREATE TABLE [aes2].[ZWU_TowarPodmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [UlicaNumer]                NVARCHAR (105) NULL,
    [KodPocztowy]               NVARCHAR (9)   NULL,
    [Miejscowosc]               NVARCHAR (105) NULL,
    [Nazwa]                     NVARCHAR (105) NULL,
    [Kraj]                      NVARCHAR (2)   NULL,
    [KrajPid]                   NVARCHAR (2)   NULL,
    [TIN]                       NVARCHAR (17)  NULL,
    [REGON]                     NVARCHAR (14)  NULL,
    [IdTowarZWU]                NUMERIC (19)   NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    CONSTRAINT [ZWU_TowarPodmiot$PK_ZWU_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_TowarPodmiot_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

