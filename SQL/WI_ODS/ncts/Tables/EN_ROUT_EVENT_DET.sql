﻿CREATE TABLE [ncts].[EN_ROUT_EVENT_DET] (
    [INC_FLAG]                   CHAR (1)        NULL,
    [INC_IND]                    CHAR (1)        NOT NULL,
    [EN_ROUT_EVENT_SEQ]          DECIMAL (4)     NOT NULL,
    [MRN]                        VARCHAR (21)    NOT NULL,
    [NEW_TRANSP_MEANS_IDENT]     VARCHAR (81)    NULL,
    [NEW_TRANSP_MEANS_IDENT_LNG] CHAR (2)        NULL,
    [NEW_TRANSP_MEANS_NAT]       CHAR (2)        NULL,
    [INC_INF]                    NVARCHAR (1050) NULL,
    [INC_INF_LNG]                CHAR (2)        NULL,
    [ENDORS_AUTH]                NVARCHAR (105)  NULL,
    [ENDORS_AUTH_LNG]            CHAR (2)        NULL,
    [DAT_ENDORS]                 DATETIME        NULL,
    [ENDORS_PLAC]                NVARCHAR (105)  NULL,
    [ENDORS_PLAC_LNG]            CHAR (2)        NULL,
    [ENDORS_COUNTRY_ID]          CHAR (2)        NULL,
    CONSTRAINT [ERED_DET_OF_ERE] FOREIGN KEY ([MRN], [EN_ROUT_EVENT_SEQ]) REFERENCES [ncts].[EN_ROUT_EVENT] ([MRN], [SEQ]),
    CONSTRAINT [ERED_ENDORS_AUTH_IN_L] FOREIGN KEY ([ENDORS_AUTH_LNG]) REFERENCES [ncts].[LANG] ([ID]),
    CONSTRAINT [ERED_ENDORS_PLAC_IN_L] FOREIGN KEY ([ENDORS_PLAC_LNG]) REFERENCES [ncts].[LANG] ([ID]),
    CONSTRAINT [ERED_INC_INF_IN_L] FOREIGN KEY ([INC_INF_LNG]) REFERENCES [ncts].[LANG] ([ID]),
    CONSTRAINT [ERED_TRANSP_MEANS_IDENT_IN_L] FOREIGN KEY ([NEW_TRANSP_MEANS_IDENT_LNG]) REFERENCES [ncts].[LANG] ([ID])
) ON [FG_NCTS];


GO
CREATE NONCLUSTERED INDEX [ERED_MERES_I]
    ON [ncts].[EN_ROUT_EVENT_DET]([MRN] ASC, [EN_ROUT_EVENT_SEQ] ASC)
    ON [FG_NCTS];

