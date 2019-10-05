CREATE TABLE [aes2].[ecs_exp_provisional_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [ref]           NVARCHAR (35) NULL,
    [type]          NVARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [PK_ecs_exp_provisional_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

