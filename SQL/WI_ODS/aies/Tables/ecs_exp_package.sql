CREATE TABLE [aies].[ecs_exp_package] (
    [id]             NUMERIC (19)  NOT NULL,
    [no_of_packages] INT           NULL,
    [kind]           VARCHAR (2)   NULL,
    [no_of_pieces]   INT           NULL,
    [state_br]       CHAR (1)      DEFAULT ('U') NOT NULL,
    [marks]          NVARCHAR (42) NULL,
    [goods_item_id]  NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_exp_package] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

