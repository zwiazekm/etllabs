CREATE TABLE [aies].[ecs_ext_additional_info] (
    [id]                 NUMERIC (19) NOT NULL,
    [declcoexit_decl_id] NUMERIC (19) NULL,
    [code]               VARCHAR (5)  NOT NULL,
    [text]               VARCHAR (70) NULL,
    CONSTRAINT [pk_ecs_ext_additional_info] PRIMARY KEY CLUSTERED ([id] ASC)
);

