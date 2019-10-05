CREATE TABLE [ncts].[DECL_GOODS_ITEM_SPEC_MENT] (
    [SID]                 INT            NOT NULL,
    [DECL_GOODS_ITEM_SID] INT            NULL,
    [SPEC_MENT_TYP_ID]    VARCHAR (5)    NULL,
    [EXP_FROM_EC]         CHAR (1)       NULL,
    [EXP_COUNTRY_ID]      CHAR (2)       NULL,
    [TEXT]                NVARCHAR (210) NULL,
    [TEXT_LNG]            CHAR (2)       NULL,
    CONSTRAINT [PK_DECL_GOODS_ITEM_SPEC_MENT] PRIMARY KEY CLUSTERED ([SID] ASC)
);

