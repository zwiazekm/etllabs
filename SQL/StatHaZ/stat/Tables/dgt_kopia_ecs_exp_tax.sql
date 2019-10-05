CREATE TABLE [stat].[dgt_kopia_ecs_exp_tax] (
    [id]                NUMERIC (19)    NOT NULL,
    [base]              NUMERIC (17, 2) NULL,
    [rate]              NUMERIC (7, 2)  NULL,
    [amount]            NUMERIC (15, 2) NULL,
    [method_of_payment] VARCHAR (1)     NULL,
    [type]              VARCHAR (3)     NULL,
    [goods_item_id]     NUMERIC (19)    NOT NULL,
    [generacjaId]       INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_tax] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [amount]
    ON [stat].[dgt_kopia_ecs_exp_tax]([amount]);


GO
CREATE STATISTICS [base]
    ON [stat].[dgt_kopia_ecs_exp_tax]([base]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_tax]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_tax]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_tax]([id]);


GO
CREATE STATISTICS [method_of_payment]
    ON [stat].[dgt_kopia_ecs_exp_tax]([method_of_payment]);


GO
CREATE STATISTICS [rate]
    ON [stat].[dgt_kopia_ecs_exp_tax]([rate]);


GO
CREATE STATISTICS [type]
    ON [stat].[dgt_kopia_ecs_exp_tax]([type]);

