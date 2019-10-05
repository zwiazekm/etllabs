CREATE TABLE [aes2].[ecs_trs_goods_item] (
    [ID]                  NUMERIC (19)    NOT NULL,
    [DECL_ID]             NUMERIC (19)    NULL,
    [POSID]               INT             NULL,
    [DEKL_TYPE]           NVARCHAR (5)    NULL,
    [COUNTRY_ORIGIN]      NVARCHAR (2)    NULL,
    [COUNTRY_DESTINATION] NVARCHAR (2)    NULL,
    [DESCRIPTION]         NVARCHAR (280)  NULL,
    [MASS_NETTO]          NUMERIC (16, 6) NULL,
    [MASS_GROSS]          NUMERIC (16, 6) NULL,
    [GOODS_CODE]          NVARCHAR (10)   NULL,
    [VERSION]             INT             NOT NULL,
    [EXPORT_MRN]          NVARCHAR (35)   NULL,
    CONSTRAINT [ecs_trs_goods_item$ecs_trs_go_3770493481] PRIMARY KEY CLUSTERED ([ID] ASC)
);

