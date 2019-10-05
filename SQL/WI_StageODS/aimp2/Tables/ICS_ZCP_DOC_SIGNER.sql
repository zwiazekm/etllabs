CREATE TABLE [aimp2].[ICS_ZCP_DOC_SIGNER] (
    [ID]                       NUMERIC (19)   NOT NULL,
    [EMAIL]                    NVARCHAR (35)  NULL,
    [NAME]                     NVARCHAR (30)  NOT NULL,
    [SURNAME]                  NVARCHAR (40)  NOT NULL,
    [criminal_liab_cert]       NVARCHAR (MAX) NULL,
    [PHONE]                    NVARCHAR (15)  NULL,
    [CUSTOMS_AGENT_ENTRY_DATE] DATETIME2 (3)  NULL,
    [CUSTOMS_AGENT_ENTRY_NO]   NVARCHAR (35)  NULL,
    [ZCP_ACF]                  NTEXT          NULL,
    [version]                  INT            NOT NULL,
    CONSTRAINT [ICS_ZCP_DOC_SIGNER$PK_ICS_ZCP_DOC_SIGNER] PRIMARY KEY CLUSTERED ([ID] ASC)
);

