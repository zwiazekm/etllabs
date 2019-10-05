CREATE TABLE [aes2].[ecs_ext_package] (
    [id]             NUMERIC (19)   NOT NULL,
    [no_of_packages] INT            NULL,
    [kind]           NVARCHAR (2)   NULL,
    [no_of_pieces]   INT            NULL,
    [state_br]       NCHAR (1)      NOT NULL,
    [marks]          NVARCHAR (126) NULL,
    [goods_item_id]  NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_ext_package$pk_ecs_ext_package] PRIMARY KEY CLUSTERED ([id] ASC)
);

