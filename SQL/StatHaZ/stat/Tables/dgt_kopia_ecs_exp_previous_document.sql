CREATE TABLE [stat].[dgt_kopia_ecs_exp_previous_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [type]          VARCHAR (6)   NULL,
    [ref]           NVARCHAR (35) NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    [generacjaId]   INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_previous_document] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_previous_document]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_previous_document]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_previous_document]([id]);


GO
CREATE STATISTICS [ref]
    ON [stat].[dgt_kopia_ecs_exp_previous_document]([ref]);


GO
CREATE STATISTICS [type]
    ON [stat].[dgt_kopia_ecs_exp_previous_document]([type]);

