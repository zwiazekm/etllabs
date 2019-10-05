CREATE TABLE [ncts2].[RefUrzCelPodmioty] (
    [Id]              BIGINT        NOT NULL,
    [IdUrzeduCelnego] BIGINT        NULL,
    [Nazwa]           NVARCHAR (35) NULL,
    [KodJezyka]       NVARCHAR (2)  NULL,
    [TIN]             NVARCHAR (17) NULL,
    CONSTRAINT [RefUrzCelPodmioty_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [RefUrzCelPodmioty_IdUrzeduCelnego_RefUrzCel_fk] FOREIGN KEY ([IdUrzeduCelnego]) REFERENCES [ncts2].[RefUrzCel] ([Id])
);

