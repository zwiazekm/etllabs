CREATE TABLE [stat].[dgt_kopia_ecs_exp_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      CHAR (1)       NOT NULL,
    [state_br_c]    NVARCHAR (140) NULL,
    [type]          VARCHAR (4)    NULL,
    [ref]           NVARCHAR (35)  NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    [generacjaId]   INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_produced_document] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_produced_document]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_produced_document]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_produced_document]([id]);


GO
CREATE STATISTICS [ref]
    ON [stat].[dgt_kopia_ecs_exp_produced_document]([ref]);


GO
CREATE STATISTICS [state_br]
    ON [stat].[dgt_kopia_ecs_exp_produced_document]([state_br]);


GO
CREATE STATISTICS [state_br_c]
    ON [stat].[dgt_kopia_ecs_exp_produced_document]([state_br_c]);


GO
CREATE STATISTICS [type]
    ON [stat].[dgt_kopia_ecs_exp_produced_document]([type]);

