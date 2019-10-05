﻿CREATE TABLE [aimp2].[ICS_ZCP_DECISION] (
    [ID]               NUMERIC (19)    NOT NULL,
    [DEC_DATE]         DATETIME2 (3)   NULL,
    [MRN]              NVARCHAR (18)   NULL,
    [DEC_NO]           NVARCHAR (40)   NULL,
    [POS_NO]           NUMERIC (5)     NULL,
    [TYPE]             NVARCHAR (4)    NULL,
    [ZCP_OPERATION_ID] NUMERIC (19)    NULL,
    [DECL_ID]          NUMERIC (19)    NOT NULL,
    [POSITIONS]        NVARCHAR (300)  NOT NULL,
    [DESCRIPTION]      NVARCHAR (1000) NOT NULL,
    [version]          INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_DECISION$PK_ICS_ZCP_DECISION] PRIMARY KEY CLUSTERED ([ID] ASC)
);

