﻿CREATE TABLE [aimp2].[ICS_ZCP_INEFFECTIVE_GUARANT] (
    [ID]      NUMERIC (19)   NOT NULL,
    [ZCP_ID]  NUMERIC (19)   NULL,
    [POS_NO]  NUMERIC (5)    NULL,
    [REASON]  NVARCHAR (255) NULL,
    [version] INT            NOT NULL,
    CONSTRAINT [ICS_ZCP_INEFFECTIVE_GUARANT$PK_ICS_ZCP_INEFFECTIVE_GUARANT] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_ZCP_INEFFECTIVE_GUARANT$FK_ICS_ZCP_INEFFECTIVE_GUARANT_ICS_ZCP] FOREIGN KEY ([ZCP_ID]) REFERENCES [aimp2].[ICS_ZCP] ([ID])
);

