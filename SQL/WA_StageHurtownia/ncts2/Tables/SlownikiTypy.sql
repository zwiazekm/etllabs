CREATE TABLE [ncts2].[SlownikiTypy] (
    [Id]      BIGINT         NOT NULL,
    [Nazwa]   NVARCHAR (100) NULL,
    [IdDDNTA] BIGINT         NULL,
    [IdPDR]   NVARCHAR (50)  NULL,
    CONSTRAINT [SlownikiTypy_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

