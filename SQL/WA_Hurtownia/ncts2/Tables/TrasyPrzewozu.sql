CREATE TABLE [ncts2].[TrasyPrzewozu] (
    [IdOperacjiTranzytowej] BIGINT       NULL,
    [Trasa]                 NVARCHAR (2) NULL,
    [Id]                    BIGINT       NOT NULL,
    CONSTRAINT [TrasyPrzewozu_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

