﻿CREATE TABLE [aimp2].[ICS_DPZ_CONS_RECEIVER] (
    [ID]            NUMERIC (19)  NOT NULL,
    [RECEIVER_TYPE] NVARCHAR (1)  NULL,
    [N_FIRST_NAME]  NVARCHAR (30) NULL,
    [N_LAST_NAME]   NVARCHAR (40) NULL,
    [N_PESEL]       NVARCHAR (11) NULL,
    [B_IDENTIFIER]  NVARCHAR (17) NULL,
    [B_NAME]        NVARCHAR (70) NULL,
    [DECL_ID]       NUMERIC (19)  NOT NULL,
    [version]       INT           NOT NULL,
    CONSTRAINT [ICS_DPZ_CONS_RECEIVER_PK] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_DPZ_CONS_RECEIVER$FK_DPZ_CONS_RECEIVER] FOREIGN KEY ([DECL_ID]) REFERENCES [aimp2].[ICS_ZCP] ([ID])
);

