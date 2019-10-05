CREATE TABLE [aes2].[QUERY_TowarPodmiot] (
    [Id]           NUMERIC (19)   NOT NULL,
    [Miejscowosc]  NVARCHAR (255) NULL,
    [Kraj]         NVARCHAR (255) NULL,
    [KrajPid]      INT            NULL,
    [Nazwa]        NVARCHAR (255) NULL,
    [KodPocztowy]  NVARCHAR (255) NULL,
    [UlicaNumer]   NVARCHAR (255) NULL,
    [TIN]          NVARCHAR (255) NULL,
    [IdTowarQUERY] NUMERIC (19)   NULL,
    [Email]        NVARCHAR (70)  NULL,
    [RodzPodmiotu] NVARCHAR (1)   NOT NULL,
    CONSTRAINT [QUERY_TowarPodmiot$PK_QUERY_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

