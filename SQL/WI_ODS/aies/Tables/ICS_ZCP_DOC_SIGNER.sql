CREATE TABLE [aies].[ICS_ZCP_DOC_SIGNER] (
    [ID]                             NUMERIC (19)  NOT NULL,
    [EMAIL]                          VARCHAR (35)  NULL,
    [NAME]                           VARCHAR (30)  NOT NULL,
    [SURNAME]                        VARCHAR (40)  NOT NULL,
    [CRIMINAL_LIABILITY_CERTIFICATE] VARCHAR (MAX) NULL,
    [PHONE]                          VARCHAR (15)  NULL,
    [CUSTOMS_AGENT_ENTRY_DATE]       DATETIME      NULL,
    [CUSTOMS_AGENT_ENTRY_NO]         VARCHAR (35)  NULL,
    CONSTRAINT [pk_ICS_ZCP_DOC_SIGNER] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
) TEXTIMAGE_ON [FG_AIES];

