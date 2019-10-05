CREATE TABLE [stat].[dgt_kopia_ecs_exp_container] (
    [id]            NUMERIC (19) NOT NULL,
    [state_br]      CHAR (1)     NOT NULL,
    [identity_f]    VARCHAR (17) NULL,
    [goods_item_id] NUMERIC (19) NOT NULL,
    [generacjaId]   INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_container] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_container]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_container]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_container]([id]);


GO
CREATE STATISTICS [identity_f]
    ON [stat].[dgt_kopia_ecs_exp_container]([identity_f]);


GO
CREATE STATISTICS [state_br]
    ON [stat].[dgt_kopia_ecs_exp_container]([state_br]);

