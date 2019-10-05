CREATE TABLE [aies].[ecs_ext_package] (
    [id]             NUMERIC (19)  NOT NULL,
    [no_of_packages] INT           NULL,
    [kind]           VARCHAR (2)   NULL,
    [no_of_pieces]   INT           NULL,
    [state_br]       CHAR (1)      NOT NULL,
    [marks]          NVARCHAR (42) NULL,
    [goods_item_id]  NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_ext_package] PRIMARY KEY CLUSTERED ([id] ASC)
);

