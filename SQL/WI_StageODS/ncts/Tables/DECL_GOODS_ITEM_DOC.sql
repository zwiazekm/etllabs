CREATE TABLE [ncts].[DECL_GOODS_ITEM_DOC] (
    [DOC_TYP_ID]          VARCHAR (6)    NULL,
    [SID]                 INT            NOT NULL,
    [DECL_GOODS_ITEM_SID] INT            NULL,
    [SENT]                CHAR (1)       NOT NULL,
    [DOC_REF]             NVARCHAR (105) NULL,
    [DOC_REF_LNG]         CHAR (2)       NULL,
    [COMPL_OF_INF]        NVARCHAR (78)  NULL,
    [COMPL_OF_INF_LNG]    CHAR (2)       NULL,
    CONSTRAINT [PK_DECL_GOODS_ITEM_DOC] PRIMARY KEY CLUSTERED ([SID] ASC)
);

