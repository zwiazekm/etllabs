CREATE TABLE [ncts2].[RefPodmiotyAEO] (
    [Id]                BIGINT        NOT NULL,
    [IdSISC]            NVARCHAR (17) NULL,
    [Numer]             NVARCHAR (25) NULL,
    [DataObowiazywania] DATETIME      NULL,
    [WazneOd]           DATETIME      NULL,
    [WazneDo]           DATETIME      NULL,
    CONSTRAINT [RefPodmiotyAEO_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

