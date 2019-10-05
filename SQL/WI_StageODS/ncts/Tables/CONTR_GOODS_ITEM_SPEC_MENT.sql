CREATE TABLE [ncts].[CONTR_GOODS_ITEM_SPEC_MENT] (
    [CONTR_GOODS_ITEM_SID] INT            NOT NULL,
    [SID]                  INT            NULL,
    [SPEC_MENT_TYP_ID]     VARCHAR (5)    NULL,
    [CONTR_LEV]            CHAR (1)       NOT NULL,
    [EXP_FROM_COUNTRY_ID]  CHAR (2)       NULL,
    [EXP_FROM_EC]          CHAR (1)       NULL,
    [TEXT]                 NVARCHAR (210) NULL,
    [TEXT_LNG]             CHAR (2)       NULL,
    CONSTRAINT [PK_CONTR_GOODS_ITEM_SPEC_MENT] PRIMARY KEY CLUSTERED ([CONTR_GOODS_ITEM_SID] ASC)
);

