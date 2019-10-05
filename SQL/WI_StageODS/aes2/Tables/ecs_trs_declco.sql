CREATE TABLE [aes2].[ecs_trs_declco] (
    [ID]                NUMERIC (19)  NOT NULL,
    [SELF_ID]           NVARCHAR (21) NULL,
    [DECL_CREATED_DATE] DATE          NULL,
    [VERSION]           INT           NOT NULL,
    [STATUS]            NCHAR (3)     NULL,
    [REF_NO]            NVARCHAR (35) NULL,
    [T_DECL_TYPE]       NVARCHAR (5)  NULL,
    CONSTRAINT [ecs_trs_declco$ecs_trs_de_20285312291] PRIMARY KEY CLUSTERED ([ID] ASC)
);

