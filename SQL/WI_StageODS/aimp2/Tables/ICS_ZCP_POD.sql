CREATE TABLE [aimp2].[ICS_ZCP_POD] (
    [ID]                    NUMERIC (19)  NOT NULL,
    [ZCP_ID]                NUMERIC (19)  NOT NULL,
    [ZCP_DECISION_ID]       NUMERIC (19)  NULL,
    [CREATED_DATE]          DATETIME2 (3) NOT NULL,
    [FAMILIARIZE_DEBT_DATE] DATETIME2 (3) NULL,
    [STATUS]                NVARCHAR (40) NOT NULL,
    [message_id]            NUMERIC (19)  NULL,
    [version]               INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_POD$ICS_ZCP_PO_12535764731] PRIMARY KEY CLUSTERED ([ID] ASC)
);

