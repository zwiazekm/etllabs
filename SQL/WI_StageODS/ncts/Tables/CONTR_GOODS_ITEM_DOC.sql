CREATE TABLE [ncts].[CONTR_GOODS_ITEM_DOC] (
    [SID]                  INT            NOT NULL,
    [CONTR_GOODS_ITEM_SID] INT            NULL,
    [DOC_TYP_ID]           VARCHAR (6)    NULL,
    [SENT]                 CHAR (1)       NULL,
    [COMPL_OF_INF]         NVARCHAR (78)  NULL,
    [COMPL_OF_INF_LNG]     CHAR (2)       NULL,
    [CONTR_LEV]            CHAR (1)       NULL,
    [DOC_REF]              NVARCHAR (105) NULL,
    [DOC_REF_LNG]          CHAR (2)       NULL,
    [DOC_TYP_TEXT]         NVARCHAR (140) NULL,
    [DOC_REF_TEXT]         NVARCHAR (140) NULL,
    [COMPL_OF_INF_TEXT]    NVARCHAR (140) NULL,
    CONSTRAINT [PK_CONTR_GOODS_ITEM_DOC] PRIMARY KEY CLUSTERED ([SID] ASC)
);

