CREATE TABLE [aes2].[ecs_ext_additional_info] (
    [id]                 NUMERIC (19)  NOT NULL,
    [declcoexit_decl_id] NUMERIC (19)  NULL,
    [code]               NVARCHAR (5)  NOT NULL,
    [text]               NVARCHAR (70) NULL,
    CONSTRAINT [ecs_ext_additional_info$PK_ecs_ext_additional_info] PRIMARY KEY CLUSTERED ([id] ASC)
);

