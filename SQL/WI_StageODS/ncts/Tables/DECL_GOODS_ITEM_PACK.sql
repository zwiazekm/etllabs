CREATE TABLE [ncts].[DECL_GOODS_ITEM_PACK] (
    [SID]                      INT            NOT NULL,
    [PACK_TYP_ID]              CHAR (2)       NOT NULL,
    [PACK_MARKS_AND_IDENT]     NVARCHAR (126) NULL,
    [PACK_MARKS_AND_IDENT_LNG] CHAR (2)       NULL,
    [NUMB_OF_PACK]             DECIMAL (5)    NULL,
    [NUMB_OF_PIEC]             DECIMAL (5)    NULL,
    [DECL_GOODS_ITEM_SID]      INT            NULL,
    CONSTRAINT [PK_DECL_GOODS_ITEM_PACK] PRIMARY KEY CLUSTERED ([SID] ASC)
);

