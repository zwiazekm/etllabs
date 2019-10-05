CREATE TABLE [wald].[wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS] (
    [stat]                      NVARCHAR (2)    NULL,
    [koment]                    NVARCHAR (50)   NULL,
    [uname]                     NVARCHAR (50)   NULL,
    [id]                        NUMERIC (19)    NOT NULL,
    [gi_gross_mass]             NUMERIC (18, 3) NULL,
    [gi_country_of_export]      VARCHAR (2)     NULL,
    [gi_country_of_destination] VARCHAR (2)     NULL,
    [gi_gross_mass_br]          NUMERIC (18, 3) NULL,
    [gi_crn]                    NVARCHAR (70)   NULL,
    [gi_un_dangerous_goods]     VARCHAR (4)     NULL,
    [gi_taxes_amount]           NUMERIC (17, 2) NULL,
    [gi_item_no]                INT             NULL,
    [gi_state_br]               CHAR (1)        NOT NULL,
    [vog_statistical_value]     NUMERIC (17, 2) NULL,
    [vog_statistical_currency]  VARCHAR (3)     NULL,
    [gi_desc_br]                NVARCHAR (280)  NULL,
    [gi_cn_code]                VARCHAR (8)     NULL,
    [gi_taric_code]             VARCHAR (2)     NULL,
    [gi_commodity_code_br]      VARCHAR (22)    NULL,
    [gi_country_of_origin]      VARCHAR (2)     NULL,
    [gi_proc_requested]         VARCHAR (2)     NULL,
    [gi_proc_previous]          VARCHAR (2)     NULL,
    [gi_proc_detail]            VARCHAR (3)     NULL,
    [gi_net_mass]               NUMERIC (18, 3) NULL,
    [gi_net_mass_br]            NUMERIC (18, 3) NULL,
    [gi_quantity_suppl_unit]    NUMERIC (19)    NULL,
    [gi_desc]                   NVARCHAR (280)  NULL,
    [declcoexport_decl_id]      NUMERIC (19)    NULL,
    [generacjaId]               INT             NOT NULL
) ON [WaldDane];


GO

CREATE TRIGGER [wald].[uname_masa_ecs] ON [wald].[wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS] 
FOR UPDATE
AS
update wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS
set uname=suser_sname()
where declcoexport_decl_id in (select declcoexport_decl_id from deleted) and [id] in (select [id] from deleted)