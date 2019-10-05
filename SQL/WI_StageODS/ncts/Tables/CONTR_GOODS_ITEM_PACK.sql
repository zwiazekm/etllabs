CREATE TABLE [ncts].[CONTR_GOODS_ITEM_PACK] (
    [SID]                      INT            NOT NULL,
    [CONTR_GOODS_ITEM_SID]     INT            NULL,
    [PACK_TYP_ID]              CHAR (2)       NULL,
    [PACK_MARKS_AND_IDENT]     NVARCHAR (126) NULL,
    [PACK_MARKS_AND_IDENT_LNG] CHAR (2)       NULL,
    [NUMB_OF_PACK]             DECIMAL (5)    NULL,
    [NUMB_OF_PIEC]             DECIMAL (5)    NULL,
    [CONTR_LEV]                CHAR (1)       NULL,
    [CONTR_DESCR]              NVARCHAR (70)  NULL,
    [CONTR_DESCR_LNG]          CHAR (2)       NULL,
    [PACK_TYP_TEXT]            NVARCHAR (140) NULL,
    [NUMB_OF_PACK_TEXT]        NVARCHAR (140) NULL,
    [NUMB_OF_PIEC_TEXT]        NVARCHAR (140) NULL,
    [MARKS_AND_IDENT_TEXT]     NVARCHAR (140) NULL,
    CONSTRAINT [PK_CONTR_GOODS_ITEM_PACK] PRIMARY KEY CLUSTERED ([SID] ASC)
);

