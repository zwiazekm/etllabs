CREATE TABLE [zc].[ZWA_Podmiot] (
    [Id]              DECIMAL (19)  NOT NULL,
    [RodzPodmiotu]    CHAR (1)      NOT NULL,
    [RodzPodmiotuPid] CHAR (1)      NOT NULL,
    [TIN]             VARCHAR (17)  NULL,
    [Nazwa]           NVARCHAR (35) NULL,
    [UlicaNumer]      NVARCHAR (35) NULL,
    [KodPocztowy]     VARCHAR (9)   NULL,
    [Miejscowosc]     NVARCHAR (35) NULL,
    [Kraj]            CHAR (2)      NULL,
    [KrajPid]         INT           NULL,
    [IdDokZWA]        DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWA_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

