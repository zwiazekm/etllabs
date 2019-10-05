CREATE TABLE [aes2].[ZWA_TowarPodmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [UlicaNumer]                NVARCHAR (105) NULL,
    [KodPocztowy]               NVARCHAR (9)   NULL,
    [Miejscowosc]               NVARCHAR (105) NULL,
    [Nazwa]                     NVARCHAR (105) NULL,
    [Kraj]                      NVARCHAR (2)   NULL,
    [KrajPid]                   NVARCHAR (2)   NULL,
    [TIN]                       NVARCHAR (17)  NULL,
    [IdTowarZWA]                NUMERIC (19)   NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [Emai]                      NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    CONSTRAINT [ZWA_TowarPodmiot$PK_ZWA_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_TowarPodmiot_IdTowarZWA__ZWA_Towar_id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [aes2].[ZWA_Towar] ([Id])
);

