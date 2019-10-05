CREATE TABLE [ais2].[PDS_TowarPodmiot] (
    [Id]             NUMERIC (19)  NOT NULL,
    [Miejscowosc]    VARCHAR (35)  NULL,
    [Kraj]           VARCHAR (2)   NULL,
    [KrajPid]        INT           NULL,
    [KodPocztowy]    VARCHAR (9)   NULL,
    [UlicaNumer]     VARCHAR (35)  NULL,
    [Email]          VARCHAR (255) NULL,
    [Nazwa]          NVARCHAR (35) NULL,
    [TIN]            VARCHAR (17)  NULL,
    [RodzajPodmiotu] INT           NULL,
    [IdTowarPDS]     NUMERIC (19)  NULL,
    CONSTRAINT [PDS_TowarPodmiot$PK_PDS_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AIS2],
    CONSTRAINT [FK__PDS_TowarPodmiot_IdTowarPDS__PDS_Towar_id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [ais2].[PDS_Towar] ([Id])
);

