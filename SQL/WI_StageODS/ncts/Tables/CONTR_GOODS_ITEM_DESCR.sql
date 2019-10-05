CREATE TABLE [ncts].[CONTR_GOODS_ITEM_DESCR] (
    [SID]                  INT            NOT NULL,
    [CONTR_GOODS_ITEM_SID] INT            NULL,
    [CONTR_IND]            CHAR (2)       NULL,
    [POINTER]              VARCHAR (35)   NULL,
    [DESCR]                NVARCHAR (420) NULL,
    [DESCR_LNG]            CHAR (2)       NULL,
    CONSTRAINT [PK_CONTR_GOODS_ITEM_DESCR] PRIMARY KEY CLUSTERED ([SID] ASC)
);

