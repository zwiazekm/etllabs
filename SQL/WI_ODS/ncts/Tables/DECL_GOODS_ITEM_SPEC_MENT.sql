﻿CREATE TABLE [ncts].[DECL_GOODS_ITEM_SPEC_MENT] (
    [SID]                 INT            NOT NULL,
    [DECL_GOODS_ITEM_SID] INT            NULL,
    [SPEC_MENT_TYP_ID]    VARCHAR (5)    NULL,
    [EXP_FROM_EC]         CHAR (1)       NULL,
    [EXP_COUNTRY_ID]      CHAR (2)       NULL,
    [TEXT]                NVARCHAR (210) NULL,
    [TEXT_LNG]            CHAR (2)       NULL,
    CONSTRAINT [PK_DECL_GOODS_ITEM_SPEC_MENT] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_NCTS],
    CONSTRAINT [FK_DGISM_DGI] FOREIGN KEY ([DECL_GOODS_ITEM_SID]) REFERENCES [ncts].[DECL_GOODS_ITEM] ([SID]),
    CONSTRAINT [GISM_D_OF_GI_D] FOREIGN KEY ([DECL_GOODS_ITEM_SID]) REFERENCES [ncts].[DECL_GOODS_ITEM] ([SID]),
    CONSTRAINT [GISM_D_OF_SMT] FOREIGN KEY ([SPEC_MENT_TYP_ID]) REFERENCES [ncts].[SPEC_MENT_TYP] ([ID]),
    CONSTRAINT [GISM_D_TEXT_IN_L] FOREIGN KEY ([TEXT_LNG]) REFERENCES [ncts].[LANG] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [DGISM_DGIS_I]
    ON [ncts].[DECL_GOODS_ITEM_SPEC_MENT]([DECL_GOODS_ITEM_SID] ASC)
    ON [FG_NCTS];

