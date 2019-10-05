CREATE TABLE [ais2].[PDS_Podmiot] (
    [Id]             NUMERIC (19)  NOT NULL,
    [Email]          VARCHAR (255) NULL,
    [Nazwa]          NVARCHAR (35) NULL,
    [TIN]            VARCHAR (17)  NULL,
    [Miejscowosc]    NVARCHAR (35) NULL,
    [Kraj]           VARCHAR (2)   NULL,
    [KrajPid]        VARCHAR (2)   NULL,
    [KodPocztowy]    VARCHAR (9)   NULL,
    [UlicaNumer]     NVARCHAR (35) NULL,
    [RodzajPodmiotu] VARCHAR (255) NULL,
    [IdDokPDS]       NUMERIC (19)  NULL,
    CONSTRAINT [PDS_Podmiot$PK_PDS_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC)
);

