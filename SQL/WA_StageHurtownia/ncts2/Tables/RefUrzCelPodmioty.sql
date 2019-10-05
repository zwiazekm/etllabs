CREATE TABLE [ncts2].[RefUrzCelPodmioty] (
    [Id]              BIGINT        NOT NULL,
    [IdUrzeduCelnego] BIGINT        NULL,
    [Nazwa]           NVARCHAR (35) NULL,
    [KodJezyka]       NVARCHAR (2)  NULL,
    [TIN]             NVARCHAR (17) NULL,
    CONSTRAINT [RefUrzCelPodmioty_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

